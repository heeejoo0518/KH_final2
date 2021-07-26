 package com.kh.moyoung;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.moyoung.movie.model.service.MovieService;
import com.kh.moyoung.movie.model.vo.Movie;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	@Autowired
	private MovieService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model,
			ModelAndView mav) {
		logger.info("Welcome home! The client locale is {}.", locale);
		log.info("메인 페이지");
		
		List<Movie> list = null;
		
		list = service.top5List();
		
		mav.addObject("list",list);
		mav.setViewName("home");
		
		return mav;
	}
	
	
}
