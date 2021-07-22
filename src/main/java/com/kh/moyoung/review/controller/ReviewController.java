package com.kh.moyoung.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.kh.moyoung.common.util.PageInfo;
import com.kh.moyoung.member.model.vo.Member;
import com.kh.moyoung.movie.model.vo.Movie;
import com.kh.moyoung.review.model.service.ReviewService;
import com.kh.moyoung.review.model.vo.Review;

import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

@Slf4j
@Controller
@RequestMapping("/review")
public class ReviewController {
	@Autowired
	private ReviewService service;
	
	 /* movie_no 받아서 넘겨줘야함 
	Review review = service.findByNo(movieNo);
	*/
	@GetMapping("/list")
	public ModelAndView list(ModelAndView model,
			@RequestParam(value="page", required = false, defaultValue = "1")int page,
			@RequestParam(value="sort", required = false, defaultValue = "a")String sort,
			@RequestParam(value="no", required = false)int no,
			@ModelAttribute Review review,
			HttpServletRequest request){
		
		log.info("리뷰 게시판 페이지 요청");
		System.out.println("movieNo: " + no);
		System.out.println("sort: " + sort);
		System.out.println("page: " + page);
		
		
		List<Review> list = null;
		PageInfo pageInfo = new PageInfo(page, 10, service.getReviewCount(no), 5);
		
		if(sort.equals("a")) {
			System.out.println("a if문");
			
			list=service.getReviewList(pageInfo, no);
			
			System.out.println(list);
			
		} else if(sort.equals("b")) {
			System.out.println("b if문");
			
			list=service.selectReviewHighRateList(pageInfo, no);
			
			System.out.println(list);
			
		} else if(sort.equals("c")){
			System.out.println("c if문");
			
			list=service.selectReviewLowRateList(pageInfo, no);
			
			System.out.println(list);
		}
			model.addObject("sort",sort);
			model.addObject("no",no);
			model.addObject("page", page);
			model.addObject("list",list);
			model.addObject("pageInfo", pageInfo);
			
			model.setViewName("review/list");
			
			return model;
		}
	
	@GetMapping("/write")
	public ModelAndView writeView(ModelAndView model,
			@ModelAttribute Movie movie,
			@ModelAttribute Review review,
			@RequestParam(value="no")int no) {
		
		log.info("게시글 작성 페이지 요청");
		System.out.println(no);
		
		
		model.addObject("no", no);
		model.setViewName("review/write");
		
		return model;
	}

	
	
	@PostMapping("/write")
	public ModelAndView write(ModelAndView model,
			@SessionAttribute(name="signinMember", required=false)Member loginMember,
			@RequestParam(value="content", required = false) String content,
			@RequestParam(value="spoiler", required = false, defaultValue = "0") int spoiler,
			@RequestParam(value="star-input", required = false, defaultValue = "0")int rate,
			@RequestParam(value="nickname")String nickname,
			@RequestParam(value="no")int no,
 			@ModelAttribute Review review) {
		
		int result=0;
		System.out.println("전 movieNo: "+no);
		/*
		System.out.println(rate);
		*/
		review.setRate(rate);
		review.setNickname(nickname);
		review.setMovieNo(no);
		
		System.out.println("후 movieNo: "+no);
		System.out.println(loginMember.getU_id());
		System.out.println(loginMember.getNickname());
		System.out.println(loginMember.getU_no());
		System.out.println(review.getNickname());
		System.out.println(review.getU_no());
		
		log.info("리뷰 작성 요청");
		
		if(loginMember.getNickname().equals(review.getNickname())){
			review.setU_no(loginMember.getU_no());
			
			
			System.out.println(review);
			
			result = service.save(review);
			
			if(result > 0) {
				model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
				model.addObject("location", "/review/list?no="+no);
			} else {
				model.addObject("msg", "게시글 등록을 실패하였습니다.");
				model.addObject("location", "/");
			}
		} else {
			model.addObject("msg","잘못된 접근입니다.");
			model.addObject("location","/");
		}
		
		
		model.setViewName("common/msg");
		return model;
	}
	
			
}
