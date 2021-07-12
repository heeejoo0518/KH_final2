package com.kh.moyoung.review.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.moyoung.common.util.PageInfo;
import com.kh.moyoung.review.model.service.ReviewService;
import com.kh.moyoung.review.model.vo.Review;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/review")
public class ReviewController {
	@Autowired
	private ReviewService service;
	
	@GetMapping("/list")
	public ModelAndView list(ModelAndView model,
			@RequestParam(value="page", required = false, defaultValue = "1")int page) {
		
		List<Review> list=null;
		PageInfo pageInfo = new PageInfo(page, 10, service.getReviewCount(), 10);
		
		list=service.getReviewList(pageInfo);
		
		model.addObject("list",list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("review/list");
		
		return model;
	}
	
	@GetMapping("/write")
	public void writeView() {
		log.info("리뷰 작성 페이지 요청");
		
		//return "review/write";
	}
	
	@PostMapping("/write")
	public ModelAndView write(ModelAndView model,
			@ModelAttribute Review review) {
		log.info("리뷰 작성 요청");
		
		System.out.println(review);
		
		model.setViewName("review/write");
		return model;
	}

}
