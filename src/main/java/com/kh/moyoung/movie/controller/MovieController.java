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
import com.kh.moyoung.member.model.vo.Member;
import com.kh.moyoung.movie.model.service.MovieService;
import com.kh.moyoung.movie.model.vo.Movie;
import com.kh.moyoung.review.model.service.ReviewService;
import com.kh.moyoung.review.model.vo.Review;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/movie")
public class MovieController {
	@Autowired
	private MovieService service;
	@Autowired
	private ReviewService Rservice;

	@GetMapping("/list")
	public ModelAndView list(ModelAndView model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value="sort", required = false, defaultValue = "a")String sort,
			@ModelAttribute Movie movie,
			HttpServletRequest request){
		log.info("영화 목록 페이지 요청");
		movie.setSort(sort);
		System.out.println("if 전 sort: "+movie.getSort());
		
		if(sort.equals("a")) {
			System.out.println("a if문");
			
			List<Movie> list = null;
			PageInfo pageInfo = new PageInfo(page, 10, service.getMovieCount(), 10);
			
			list=service.getMovieList(pageInfo);
			
			System.out.println(list);
			System.out.println("sort: "+sort);
			
			model.addObject("list",list);
			model.addObject("pageInfo", pageInfo);
			model.setViewName("movie/movieList");
			
		} else if(sort.equals("b")) {
			System.out.println("b if문");
			
			List<Movie> list = null;
			PageInfo pageInfo = new PageInfo(page, 10, service.getMovieCount(), 10);
			
			list=service.selectMovieRecent(pageInfo);
			
			System.out.println(list);
			System.out.println("sort: "+sort);
			
			model.addObject("list",list);
			model.addObject("pageInfo", pageInfo);
			model.setViewName("movie/movieList");
			
		} else if(sort.equals("c")){
			System.out.println("c if문");
			
			List<Review> list = null;
			PageInfo pageInfo = new PageInfo(page, 10, service.getMovieCount(), 10);
			
			list=service.selectMovieVote(pageInfo);
			
			System.out.println(list);
			System.out.println("sort: "+sort);
			
			model.addObject("list",list);
			model.addObject("pageInfo", pageInfo);
			model.setViewName("movie/movieList");
		}
			
			return model;
		}
		

	@GetMapping("/view")
	public ModelAndView view(ModelAndView model,
			@RequestParam("no") int movieNo) {
		List<Review> list = null;
		
		Movie movie = service.findByNo(movieNo);
		PageInfo pageInfo = new PageInfo(1, 1, Rservice.getReviewCount(movieNo), 2);
		list = Rservice.getReviewList(pageInfo, movieNo);
		
		System.out.println(movie);
		System.out.println(model);
		System.out.println(list);
		
		
		model.addObject("movie",movie);
		model.addObject("pageInfo", pageInfo);
		model.addObject("list",list);
		model.setViewName("movie/movieView");

		
		return model;
	}
	
	// review controller 
	
	
	
	

}
