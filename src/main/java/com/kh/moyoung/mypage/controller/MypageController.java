package com.kh.moyoung.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.kh.moyoung.member.model.service.MemberService;
import com.kh.moyoung.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MypageController {
	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@GetMapping("/mypage/update")
	public String updateMemberView(@SessionAttribute(name = "signinMember", required = false) Member signinMember,
			@SessionAttribute(value="checkPw", required=false)String checkPw) {
		
		log.info("{}", checkPw);
		
		if(signinMember == null) return "redirect:/signin";
		else if(checkPw==null || !checkPw.equals("true")) return "redirect:/mypage/checkpw";
		return "/mypage/update";
	}
	
	@RequestMapping(value="/mypage/update", method={RequestMethod.POST})
	public ModelAndView updateMember(ModelAndView model, HttpServletRequest request,
			@SessionAttribute(name = "signinMember")Member signinMember,
			@RequestParam(value="updatePw", required = false)String pw, @RequestParam(value="updateNickname", required = false)String nickname, 
			@RequestParam(value="updateEmail", required = false)String email, @RequestParam(value="updateBirth", required = false)String birth) {
		
		Member updateMember = new Member(signinMember);
		
		if(pw!=null && !pw.equals("")) updateMember.setU_pwd(pw);
		if(nickname!=null && !nickname.equals("")) updateMember.setNickname(nickname);
		if(email!=null && !email.equals("")) updateMember.setEmail(email);
		if(birth!=null && !birth.equals("")) updateMember.setBirth(birth);
		
		service.save(updateMember);
		
		int result = service.save(updateMember);
		
		if(result>0) {
			model.addObject("msg","회원정보가 정상적으로 변경되었습니다.");
		}else {
			model.addObject("msg","회원정보 업데이트에 실패했습니다.");
		}
		
		model.addObject("location","/mypage/update");
		model.setViewName("common/msg");
		
		//수정완료한 뒤 세션삭제
		HttpSession session = request.getSession();
		session.removeAttribute("checkPw");
		
		return model;
	}
	
	@GetMapping("/mypage/checkpw")
	public String checkPwView(@SessionAttribute(name = "signinMember", required = false) Member signinMember) {
		if(signinMember == null) return "redirect:/signin";
		return "/mypage/checkpw";
	}
	
	@RequestMapping(value="/mypage/checkpw", method={RequestMethod.POST})
	public ModelAndView checkPw(ModelAndView model, HttpServletRequest request,
			@SessionAttribute(name = "signinMember")Member signinMember, @RequestParam(value="u_pw")String pw) {
		HttpSession session = request.getSession();
		
		boolean isEquals =  passwordEncoder.matches(pw, signinMember.getU_pwd());
		
		if(isEquals) {
			session.setAttribute("checkPw", "true");
			model.setViewName("redirect:/mypage/update");
		}
		else{
			model.addObject("msg", "비밀번호를 잘못 입력하셨습니다.");
			model.addObject("location","/mypage/checkpw");
			model.setViewName("common/msg");
		}
		
		return model;
	}
}
