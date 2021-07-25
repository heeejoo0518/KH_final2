package com.kh.moyoung.common.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.moyoung.member.model.service.MemberService;
import com.kh.moyoung.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class SigninInterceptor extends HandlerInterceptorAdapter{
	@Autowired
	private MemberService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("SigninInterceptor, request URI: {}", request.getRequestURI());
		
		HttpSession session = request.getSession();
		if(session.getAttribute("signinMember") != null) return true;
		
		Cookie[] cookies = request.getCookies();
		if(cookies == null) return true;
		
		for(Cookie cookie:cookies) {
			if(cookie.getName().equals("saveId")) {
				Member signinMember =  service.findById(cookie.getValue());
				session.setAttribute("signinMember", signinMember);
			}
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

}
