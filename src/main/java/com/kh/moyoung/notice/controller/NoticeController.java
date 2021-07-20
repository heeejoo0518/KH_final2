package com.kh.moyoung.notice.controller;

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
import com.kh.moyoung.notice.model.service.NoticeService;
import com.kh.moyoung.notice.model.vo.Notice;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@GetMapping("/list")
	public ModelAndView list(ModelAndView model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		
		List<Notice> list = null;

		PageInfo pageInfo = new PageInfo(page, 10, service.getNoticeCount(), 10);

		list = service.getNoticeList(pageInfo);

		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("notice/list");

		return model;
	}
	
	@GetMapping("/view")
	public ModelAndView view(ModelAndView model,
			@RequestParam("no") int noticeNo) {
		
		Notice notice = service.findByNo(noticeNo);
		
		model.addObject("notice",notice);
		model.setViewName("notice/view");
		
		return model;
	}

	@GetMapping("/update")
	public ModelAndView updateView(ModelAndView model,
			@SessionAttribute(name = "signinMember", required = false) Member signinMember,
			@RequestParam("no") int noticeNo) {
		
		Notice notice = service.findByNo(noticeNo);
		
			model.addObject("notice", notice);
			model.setViewName("notice/update");
		
		return model;
	}
	
	@PostMapping("/update")
	public ModelAndView update(ModelAndView model,
			@SessionAttribute(name = "signinMember", required = false) Member signinMember,
			HttpServletRequest request,
			@ModelAttribute Notice notice) {
		
		int result = 0;
		
			result = service.save(notice);
			
				model.addObject("msg", "게시글이 정상적으로 수정되었습니다.");
				model.addObject("location", "/notice/view?no=" + notice.getNo());
			
		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/write")
	public void wirteView() {
		log.info("게시글 작성 페이지 요청");
	}

	@PostMapping("/write")
	public ModelAndView write(ModelAndView model, HttpServletRequest request,
			@SessionAttribute(name = "signinMember", required = false) Member signinMember,
			@ModelAttribute Notice notice) {
		int result = 0;

		log.info("게시글 작성 요청");

		
		if (signinMember.getU_id().equals(notice.getWriterId())) {
			notice.setWriterNo(signinMember.getU_no());

			result = service.save(notice);

			if (result > 0) {
				model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
				model.addObject("location", "/notice/list");
			} else {
				model.addObject("msg", "게시글 등록을 실패하였습니다.");
				model.addObject("location", "/");
			}
		} else {
			model.addObject("msg", "잘못된 접근입니다");
			model.addObject("location", "/");
		}

		model.setViewName("common/msg");

		return model;
	}
	
	
	@GetMapping("/delete")
	public ModelAndView deleteNotice(ModelAndView model,
			@SessionAttribute(name = "signinMember", required = false) Member signinMember,
			@ModelAttribute Notice notice) {
		
		int result = service.deleteNotice(notice.getNo());
		
		if(result > 0) {
			model.addObject("msg", "정상적으로 삭제되었습니다.");
			model.addObject("location", "/notice/list");
		} else {
			model.addObject("msg", "글 삭제를 실패하였습니다.");
			model.addObject("location", "/notice/list");
		}	
	
		
		model.setViewName("common/msg");
		
		return model;
	}
//	

//	@GetMapping("/delete")
//	public void deleteView() {
//		log.info("게시글 삭제 페이지 요청");
//	}
//
//	@PostMapping("/delete")
//	public ModelAndView delete(ModelAndView model, HttpServletRequest request,
//			@SessionAttribute(name = "signinMember", required = false) Member signinMember,
//			@ModelAttribute Notice notice) {
//		int result = 0;
//
//		log.info("게시글 삭제 요청");
//		
//		if (signinMember.getU_id().equals(notice.getWriterId())) {
//			notice.setWriterNo(signinMember.getU_no());
//
//			result = service.delete(notice);
//
//			if (result > 0) {
//				model.addObject("msg", "게시글이 정상적으로 삭제되었습니다.");
//				model.addObject("location", "/notice/list");
//			} else {
//				model.addObject("msg", "게시글 삭제를 실패하였습니다.");
//				model.addObject("location", "/");
//			}
//		} else {
//			model.addObject("msg", "잘못된 접근입니다");
//			model.addObject("location", "/");
//		}
//
//		model.setViewName("common/msg");
//
//		return model;
//	}
	
//	@GetMapping("/delete")
//	public ModelAndView deleteNotice(ModelAndView model,
//			@SessionAttribute(name = "signinMember", required = false) Member signinMember,
//			@RequestParam("no") int noticeNo) {
//		
//			Notice notice = service.findByNo(noticeNo);
//		
//			model.addObject("notice", notice);
//			model.setViewName("notice/delete");
//		
//		return model;
//	}
//	
//	@PostMapping("/delete")
//	public ModelAndView deleteNotice(ModelAndView model,
//			@SessionAttribute(name = "signinMember", required = false) Member signinMember,
//			HttpServletRequest request,
//			@ModelAttribute Notice notice) {
//		
//			int result = 0;
//		
//			result = service.save(notice);
//			
//			model.addObject("msg", "게시글이 정상적으로 삭제되었습니다.");
//			model.addObject("location", "/notice/list");
//			
//		model.setViewName("common/msg");
//		
//		return model;
//	}
	
	
}
