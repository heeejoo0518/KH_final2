package com.kh.moyoung.member.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.gson.GsonFactory;
import com.kh.moyoung.common.service.UserMailSendService;
import com.kh.moyoung.member.model.service.MemberService;
import com.kh.moyoung.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
//@RestController
@SessionAttributes({ "signinMember", "tmpId" })
public class MemberController {
	@Autowired
	private MemberService service;

	@Autowired
	private UserMailSendService mailsender;

//	@Autowired
//	private PeopleService peopleService;

	@GetMapping("/signin")
	public String signInView(HttpSession session, HttpServletRequest request,
			@SessionAttribute(name = "signinMember", required = false) Member signinMember) {
//		log.info("get");
//		
//		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
//		if(flashMap != null && (boolean)flashMap.get("snsSignin")) {
//			//sns로그인한 경우
//			signinMember = (Member) flashMap.get("snsMember");
//			//model.addObject("signinMember", signinMember);
//			session.setAttribute("signinMember", signinMember);
//		}
		
		if (signinMember != null)
			return "redirect:/";
		else
			return "/member/signin";
	}

	@RequestMapping(value = "/signin", method = { RequestMethod.POST })
	public ModelAndView signIn(ModelAndView model, HttpServletResponse response, @RequestParam("userId") String userId,
			@RequestParam("userPwd") String userPwd, @RequestParam(value = "saveId", required = false) String saveId) {

		log.info("{}, {}", userId, userPwd);
		log.info("{}", saveId);
		
		Member signinMember = service.login(userId, userPwd);

		if (saveId != null) {
			Cookie cookie = new Cookie("saveId", userId);
			cookie.setMaxAge(259200);// 3일
			response.addCookie(cookie);
		} else {
			Cookie cookie = new Cookie("saveId", "");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}

		if (signinMember != null) {
			model.addObject("signinMember", signinMember);
			model.setViewName("redirect:/");
		} else {
			model.addObject("msg", "해당하는 회원이 없습니다.");
			model.addObject("location", "/");
			model.setViewName("common/msg");

			// 일치x -> 쿠키 삭제함
			Cookie cookie = new Cookie("saveId", "");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}

		return model;
	}

	@RequestMapping("/signout")
	public String logout(SessionStatus status, HttpServletResponse response) {
		// 세션 삭제
		status.setComplete();

		// 쿠키 삭제
		Cookie cookie = new Cookie("saveId", "");
		cookie.setMaxAge(0);
		response.addCookie(cookie);

		return "redirect:/";
	}

	@GetMapping("/signup")
	public String signUpView(@SessionAttribute(name = "signinMember", required = false) Member signinMember) {
		if (signinMember != null)
			return "redirect:/";
		return "/member/signup";
	}

	@RequestMapping(value = "/signup", method = { RequestMethod.POST })
	public ModelAndView signup(ModelAndView model, @ModelAttribute Member member) {

		int result = service.save(member);

		if (result > 0) {
			model.addObject("msg", "회원가입이 정상적으로 완료되었습니다.");
			model.addObject("location", "/");
		} else {
			model.addObject("msg", "회원가입을 실패하였습니다.");
			model.addObject("location", "/member/enroll");
		}

		model.setViewName("common/msg");

		return model;
	}

	@GetMapping("/member/idCheck")
	public ResponseEntity<Map<String, Object>> idCheck(@RequestParam("id") String userId) {
		log.info("User ID : {}", userId);

		Map<String, Object> map = new HashMap<>();

		map.put("validate", service.validate(userId));

		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}

	@GetMapping("/member/nicknameCheck")
	public ResponseEntity<Map<String, Object>> nicknameCheck(@RequestParam("nickname") String userNickname) {
		log.info("User Nickname : {}", userNickname);

		Map<String, Object> map = new HashMap<>();

		map.put("validate", service.validateNickname(userNickname));

		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}

	@GetMapping("/member/delete")
	public ModelAndView delete(ModelAndView model,
			@SessionAttribute(name = "signinMember", required = false) Member signinMember) {

		int result = service.delete(signinMember.getU_no());

		if (result > 0) {
			model.addObject("msg", "정상적으로 탈퇴되었습니다.");
			model.addObject("location", "/signout");
		} else {
			model.addObject("msg", "회원 탈퇴를 실패하였습니다.");
			model.addObject("location", "/member/update");
		}

		model.setViewName("common/msg");

		return model;
	}

	@GetMapping("/member/findId")
	public String findIdView(@SessionAttribute(name = "signinMember", required = false) Member signinMember) {
		if (signinMember != null)
			return "redirect:/";
		return "member/findId";
	}

	@PostMapping("/member/findId")
	public ModelAndView findId(ModelAndView model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam("nickname") String nickname, @RequestParam("emailCode") String emailCode) {
		boolean result = false;

		Cookie[] cookies = request.getCookies();

		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("tmpKey")) {
				if (emailCode.equals(cookie.getValue())) {
					result = true;
				}
			}
		}

		if (result) {
			Member member = service.findByNickname(nickname);
			model.addObject("tmpId", member.getU_id());
			model.setViewName("redirect:/member/showId");
		} else {
			model.addObject("msg", "인증번호를 다시 입력해주세요.");
			model.addObject("location", "/member/findId");
			model.setViewName("common/msg");
		}

		// 쓴 쿠키 삭제
		Cookie cookie = new Cookie("tmpKey", "");
		cookie.setMaxAge(0);
		response.addCookie(cookie);

		return model;
	}

	@PostMapping("/member/sendEmail")
	public ResponseEntity<Map<String, Object>> sendEmail(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("nickname") String nickname) {
		Map<String, Object> map = new HashMap<>();

		boolean result = true;
		String msg = "가입한 이메일로 인증코드가 발급되었습니다. 이메일을 확인해주세요.";

		Member member = service.findByNickname(nickname);
		if (member == null) {
			result = false;
			msg = "닉네임을 다시 한 번 확인해주세요.";
		} else {
			String key = mailsender.mailSendWithId(member.getEmail(), request);
			if (key == null) {
				result = false;
				msg = "사이트에 오류가 있습니다. 다시 한 번 시도해주세요.";
			} else {
				Cookie cookie = new Cookie("tmpKey", key);
				cookie.setMaxAge(120);// 3분
				response.addCookie(cookie);
			}
		}

		map.put("validate", result);
		map.put("msg", msg);

		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}

	@GetMapping("/member/findPw")
	public String findPwView(@SessionAttribute(name = "signinMember", required = false) Member signinMember) {
		if (signinMember != null)
			return "redirect:/";
		return "member/findPw";
	}

	@PostMapping("/member/findPw")
	public ModelAndView findPw(ModelAndView model, @RequestParam("userId") String userId, HttpServletRequest request) {

		Member member = service.findById(userId);

		if (member == null) {
			model.addObject("msg", "아이디를 다시 한 번 확인해주세요.");
			model.addObject("location", "/member/findPw");
			model.setViewName("common/msg");
			return model;
		}

		int result = mailsender.mailSendWithPassword(member, request);

		if (result > 0) {
			model.addObject("msg", "가입한 이메일로 임시 비밀번호가 발급되었습니다. 이메일을 확인해주세요.");
			model.addObject("location", "/");
		} else {
			model.addObject("msg", "사이트에 오류가 있습니다. 다시 한 번 시도해주세요.");
			model.addObject("location", "/member/findPw");
		}

		model.setViewName("common/msg");

		return model;
	}

	@GetMapping("/member/showId")
	public String showId() {
		return "/member/showId";
	}

	@PostMapping("/member/tokensignin")
	public ResponseEntity<Map<String, Object>> tokenSignIn(HttpSession session, @RequestParam("id_token") String id_token) throws GeneralSecurityException, IOException {
		Map<String, Object> map = new HashMap<>();
		map.put("snsSignin", false);
		
		NetHttpTransport transport = new NetHttpTransport();
		JsonFactory jsonFactory = new GsonFactory();

		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport, jsonFactory)
				.setAudience(Collections
						.singletonList("인증코드 넣어야할 곳"))
				.build();

		log.info("id_token : {}", id_token);

		GoogleIdToken idToken = verifier.verify(id_token);
		if (idToken != null) {
			Payload payload = idToken.getPayload();

			// user identifier
			String userId = payload.getSubject();
			log.info("userId:{}",userId);
			map.put("userId","g@"+userId);
			
			Member signinMember = service.findById("g@"+userId);

			if (signinMember != null && signinMember.getSignup_type() == 2) { // 구글로그인 맞는지
				session.setAttribute("signinMember", signinMember);
				map.put("snsSignin", true);
			} 
		} 
		
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
	
	@GetMapping("/member/tokensignup")
	public String tokenSignUpView() {
		return "redirect:/";
	}

	@PostMapping("/member/tokensignup")
	public ResponseEntity<Map<String, Object>> tokenSignUp(ModelAndView model,
			@RequestParam("id_token") String id_token) throws GeneralSecurityException, IOException {
		int result = 0;
		Map<String, Object> map = new HashMap<>();
		Member member = new Member();

		NetHttpTransport transport = new NetHttpTransport();
		JsonFactory jsonFactory = new GsonFactory();

		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport, jsonFactory)
				.setAudience(Collections
						.singletonList("인증코드 넣어야할 곳"))
				.build();

		log.info("id_token : {}", id_token);

		GoogleIdToken idToken = verifier.verify(id_token);
		if (idToken != null) {
			Payload payload = idToken.getPayload();

			// user identifier
			String userId = payload.getSubject();

			// Get profile information from payload
			String email = payload.getEmail();
			boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
			String name = (String) payload.get("name");
//			String pictureUrl = (String) payload.get("picture");
//			String locale = (String) payload.get("locale");
//			String familyName = (String) payload.get("family_name");
//			String givenName = (String) payload.get("given_name");

//			people api (생년월일 받아오려면 필요함)			
//			Person profile = peopleService.people().get("people/me")
//				    .setPersonFields("names,emailAddresses")
//				    .execute();

			// 이메일 인증이 된 경우만 회원가입
			if (emailVerified) {
				member.setU_id("g@" + userId);
				member.setEmail(email);
				member.setNickname("g@" + userId);
				member.setU_pwd("moyoung");
				member.setSignup_type(2);
				
				result = service.save(member);
			}

		} else {
			System.out.println("Invalid ID token.");
		}

		map.put("result", result);
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}

}
