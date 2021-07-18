package com.kh.moyoung.movie.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.kh.moyoung.common.util.PageInfo;
import com.kh.moyoung.movie.model.service.MovieService;
import com.kh.moyoung.movie.model.vo.Movie;
import com.kh.moyoung.review.model.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/movie")
public class MovieController {
	@Autowired
	private MovieService Mservice;
	
	@Autowired
	private ReviewService Rservice;
	

	@GetMapping("/list")
	public ModelAndView list(ModelAndView model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		log.info("영화 목록 페이지 요청");

		List<Movie> list = null;
		
		PageInfo pageInfo = new PageInfo(page, 10, Mservice.getMovieCount(), 10);
				
		list = Mservice.getMovieList(pageInfo);

		System.out.println(list);
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("movie/movieList");

		return model;
	}

	@GetMapping("/view")
	public ModelAndView view(ModelAndView model,
			@RequestParam("no") int movieNo) {
		System.out.println(movieNo);
		
		Movie movie = Mservice.findByNo(movieNo);
		
		model.addObject("movie",movie);
		
		model.setViewName("movie/movieView");
		
		return model;
	}
	

}
