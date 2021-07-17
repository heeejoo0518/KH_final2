package com.kh.moyoung.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.servlet.ModelAndView;

import com.kh.moyoung.common.util.PageInfo;
import com.kh.moyoung.member.model.vo.Member;
import com.kh.moyoung.review.model.service.ReviewService;
import com.kh.moyoung.review.model.vo.Review;

import lombok.extern.slf4j.Slf4j;

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
			@ModelAttribute Review review,
			HttpServletRequest request){
		log.info("리뷰 게시판 페이지 요청");
		review.setSort(sort);
		System.out.println("if 전 sort: "+review.getSort());
		
		if(sort.equals("a")) {
			System.out.println("a if문");
			
			List<Review> list = null;
			PageInfo pageInfo = new PageInfo(page, 10, service.getReviewCount(), 5);
			
			list=service.getReviewList(pageInfo);
			
			System.out.println(list);
			System.out.println("sort: "+sort);
			
			model.addObject("list",list);
			model.addObject("pageInfo", pageInfo);
			model.setViewName("review/list");
		} else if(sort.equals("b")) {
			System.out.println("b if문");
			
			List<Review> list = null;
			PageInfo pageInfo = new PageInfo(page, 10, service.getReviewCount(), 5);
			
			list=service.selectReviewHighRateList(pageInfo);
			
			System.out.println(list);
			System.out.println("sort: "+sort);
			
			model.addObject("list",list);
			model.addObject("pageInfo", pageInfo);
			model.setViewName("review/list");
		} else if(sort.equals("c")){
			System.out.println("c if문");
			
			List<Review> list = null;
			PageInfo pageInfo = new PageInfo(page, 10, service.getReviewCount(), 5);
			
			list=service.selectReviewLowRateList(pageInfo);
			
			System.out.println(list);
			System.out.println("sort: "+sort);
			
			model.addObject("list",list);
			model.addObject("pageInfo", pageInfo);
			model.setViewName("review/list");
		}
			
			return model;
		}
		
		
	
	
	@GetMapping("/write")
	public void writeView() {
		log.info("리뷰 작성 페이지 요청");
		
		//return "review/write";
	}
	
	@PostMapping("/write")
	public ModelAndView write(ModelAndView model,
			@SessionAttribute(name="signinMember", required=false)Member loginMember,
			@RequestParam(value="content", required = false) String content,
			@RequestParam(value="spoiler", required = false, defaultValue = "0") int spoiler,
			@RequestParam(value="star-input", required = false, defaultValue = "0")int rate,
			@RequestParam(value="nickname")String nickname,
 			@ModelAttribute Review review) {
		
		int result=0;
		/*
		System.out.println(rate);
		*/
		review.setRate(rate);
		review.setNickname(nickname);
		
		System.out.println(loginMember.getU_id());
		System.out.println(loginMember.getNickname());
		System.out.println(loginMember.getU_no());
		System.out.println(review.getNickname());
		System.out.println(review.getU_no());
		
		log.info("리뷰 작성 요청");
		
		if(loginMember.getNickname().equals(review.getNickname())){
			review.setU_no(loginMember.getU_no());
			/* ++++++++ 나중에 상세페이지 합치면 movie_no 를 review 객체에 추가하고 insert 해야함 */
			
			
			System.out.println(review);
			/*
			System.out.println(content);
			System.out.println(spoiler);
			System.out.println(rate);
			*/
			
			// 2. 데이터 베이스에 저장
			result = service.save(review);
			
			if(result > 0) {
				model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
				model.addObject("location", "/");
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
