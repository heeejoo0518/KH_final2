package com.kh.moyung.party;

import org.springframework.stereotype.Controller;	
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("party")
public class PartyController {

		@GetMapping("/party")
		public ModelAndView party(ModelAndView mv) {
			
			mv.setViewName("party/party");
			return mv;
			
		}
}
