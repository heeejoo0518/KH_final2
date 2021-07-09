package com.kh.moyoung.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.moyoung.member.model.service.MemberService;
import com.kh.moyoung.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
//@RestController
@SessionAttributes("signinMember")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@GetMapping("/signin")
	public String signInView() {
		return "/member/signin";
	}
	
	@RequestMapping(value = "/signin", method = {RequestMethod.POST})
	public ModelAndView signIn(ModelAndView model,
			@RequestParam("userId")String userId, @RequestParam("userPwd")String userPwd) {
		
		log.info("{}, {}", userId, userPwd);
		
		Member signinMember =  service.login(userId, userPwd);
		
		if(signinMember != null) {
			model.addObject("signinMember", signinMember);
			model.setViewName("redirect:/");
		} else {
			model.addObject("msg", "아이디나 패스워드가 일치하지 않습니다.");
			model.addObject("location", "/");
			model.setViewName("common/msg");
		}
		
		return model;
	}
	
	@RequestMapping("/signout")
	public String logout(SessionStatus status) {
		
		log.info("status.isComplete() : " + status.isComplete());

		status.setComplete();
		
		log.info("status.isComplete() : " + status.isComplete());		
		
		return "redirect:/";
	}
	
	@GetMapping("/signup")
	public String signUpView() {
		log.info("회원가입 페이지 요청");
		
		return "/member/signup";
	}	
	
	@RequestMapping(value = "/signup", method = {RequestMethod.POST})
	public ModelAndView signup(ModelAndView model, @ModelAttribute Member member) {

		int result = service.save(member);		
		
		if(result > 0) {
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
		
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}
	
	@GetMapping("/member/nicknameCheck")
	public ResponseEntity<Map<String, Object>> nicknameCheck(@RequestParam("nickname") String userNickname) {
		log.info("User Nickname : {}", userNickname);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("validate", service.validateNickname(userNickname));
		
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}
	
	@GetMapping("/member/delete")
	public ModelAndView delete(ModelAndView model,
			@SessionAttribute(name = "signinMember", required = false) Member signinMember) {
		
		int result = service.delete(signinMember.getU_no());
		
		if(result > 0) {
			model.addObject("msg", "정상적으로 탈퇴되었습니다.");
			model.addObject("location", "/logout");
		} else {
			model.addObject("msg", "회원 탈퇴를 실패하였습니다.");
			model.addObject("location", "/member/view");
		}	
		
		model.setViewName("common/msg");
		
		return model;
	}
	
}
