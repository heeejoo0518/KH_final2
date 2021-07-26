package com.kh.moyoung.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.moyoung.common.util.PageInfo;
import com.kh.moyoung.member.model.service.MemberService;
import com.kh.moyoung.member.model.vo.Member;
import com.kh.moyoung.movie.model.service.MovieService;
import com.kh.moyoung.movie.model.vo.Movie;
import com.kh.moyoung.review.model.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("signinMember")
public class MypageController {
   @Autowired
   private MemberService memberService;
   
   @Autowired
   private MovieService movieService;
   
   @Autowired
   private ReviewService reviewService;
   
   @Autowired
   private BCryptPasswordEncoder passwordEncoder;
   
   @GetMapping(value={"/mypage/update","/mypage"})
   public String updateMemberView(HttpServletRequest request, @SessionAttribute(value="checkPw", required=false)String checkPw) {
      
      log.info("{}", checkPw);
      
      if(checkPw==null || !checkPw.equals("true")) return "redirect:/mypage/checkpw";
      
      //세션삭제
      HttpSession session = request.getSession();
      session.removeAttribute("checkPw");
      
      return "/mypage/update";
   }
   
   @RequestMapping(value="/mypage/update", method={RequestMethod.POST})
   public ModelAndView updateMember(ModelAndView model, HttpServletRequest request,
         @SessionAttribute(name = "signinMember")Member signinMember,
         @RequestParam(value="u_pwd", required = false)String pw, @RequestParam(value="nickname", required = false)String nickname, 
         @RequestParam(value="email", required = false)String email, @RequestParam(value="birth", required = false)String birth) {
      
      Member updateMember = new Member();
      updateMember.setU_no(signinMember.getU_no());
      
      if(pw!=null && !pw.equals("")) updateMember.setU_pwd(pw);
      if(nickname!=null && !nickname.equals("") && !nickname.equals(signinMember.getNickname())) updateMember.setNickname(nickname);
      if(email!=null && !email.equals("")) updateMember.setEmail(email);
      if(birth!=null && !birth.equals("")) updateMember.setBirth(birth);
      
      log.info("{}",updateMember);
      
      int result = memberService.save(updateMember);
      
      if(result>0) {
         model.addObject("msg","회원정보가 정상적으로 변경되었습니다.");
         signinMember = memberService.findById(signinMember.getU_id());
         model.addObject("signinMember",signinMember);
         
      }else {
         model.addObject("msg","회원정보가 업데이트되지 않았습니다.");
      }
      
      model.addObject("location","/mypage");
      model.setViewName("common/msg");
      
      return model;
   }
   
   @GetMapping("/mypage/checkpw")
   public String checkPwView() {
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
   
   @GetMapping("/mypage/myreview")
   public ModelAndView myreviewView(ModelAndView model, 
         @SessionAttribute(name = "signinMember", required = false) Member signinMember,
         @RequestParam(value="page", required=false, defaultValue="1")int pageNo) {
      PageInfo pageInfo = new PageInfo(pageNo,5, reviewService.getMyReviewCount(signinMember.getU_no()), 10);
      
      model.addObject("myReviewList",reviewService.getMyReviewList(pageInfo, signinMember.getU_no()));
      model.addObject("pageInfo",pageInfo);
      
      model.setViewName("/mypage/myreview");
   
      return model;
   }
   
   @GetMapping("/mypage/mylike")
   public ModelAndView mylikeView(ModelAndView model, 
         @SessionAttribute(name = "signinMember", required = false) Member signinMember) {

      PageInfo pageInfo = new PageInfo(1,1, movieService.getLikeCount(signinMember.getU_no()), 20);

      model.addObject("mylikeList", movieService.getLikeList(pageInfo, signinMember.getU_no()));
      model.addObject("pageInfo", pageInfo);
      
      model.setViewName("mypage/mylike");
      
      return model;
   }
   
   @PostMapping("/mypage/mylikeList")
   public ResponseEntity<Map<String,Object>> mylikeList(@SessionAttribute(name = "signinMember", required = false) Member signinMember,
         @RequestParam(value="pageNo", required=false, defaultValue="1")int pageNo) {
      log.info("mylikeList controller");
      log.info("pageNo : {}", pageNo);
      log.info("signinMember : {}", signinMember);
      Map<String,Object> map = new HashMap<>();

      PageInfo pageInfo = new PageInfo(pageNo,1, movieService.getLikeCount(signinMember.getU_no()), 20);

      map.put("mylikeList", movieService.getLikeList(pageInfo, signinMember.getU_no()));
      map.put("pageInfo", pageInfo);
      
      log.info("mylikeList : {}",map.get("mylikeList"));
      log.info("like list count",pageInfo.getListCount());
      
   
      return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
   }
}