package com.kh.moyoung.party.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.kh.moyoung.member.model.vo.Member;
import com.kh.moyoung.party.model.service.PartyService;
import com.kh.moyoung.party.model.vo.Party;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/party")
public class PartyController {
	
		@Autowired
		private PartyService service;
		
		
		@GetMapping("/party")
		public ModelAndView list(ModelAndView mv) {
			
			List<Party> list = service.getPartyList();
		
			mv.addObject("list", list);
			mv.setViewName("party/party");
			
			return mv;
			
		}		
		
	
/*게시글 작성 페이지 불러오기*/
		@GetMapping("/partyWrite")
		public void  partyWrite() {
			log.info("게시글 작성 페이지 요청");
			
		}
		
/*게시글 작성*/
		@PostMapping("/partyWrite")
		public ModelAndView write(ModelAndView mv, HttpServletRequest request,
				@SessionAttribute(name="signinMember", required= false) Member signinMember,
				@ModelAttribute Party party) {
			
			int result = 0;
			
			log.info("게시글 작성 요청");
						
		if(signinMember.getU_id().equals(party.getWriter_id())) {
				
			result = service.save(party);
			
			if(result > 0) {
				mv.addObject("msg","정상적으로 등록되었습니다.");
				mv.addObject("location","/party/party");
			} else {
				mv.addObject("msg","등록 실패!");
				mv.addObject("location","/party/party");
			} 
			
			
		} else {
			mv.addObject("msg", "잘못된 접근입니다");
			mv.addObject("location", "/"); 
			}
		
			
			System.out.println(party);
	
			mv.setViewName("common/msg");
		
			return mv;
		

	}

		
		
		
		
		
		
		
		
}
