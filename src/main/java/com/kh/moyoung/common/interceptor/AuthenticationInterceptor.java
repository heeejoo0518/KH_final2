package com.kh.moyoung.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.moyoung.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AuthenticationInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("preHandle");
		log.info("request URI: {}", request.getRequestURI());
		
		HttpSession session = request.getSession();
		Member signinMember = (Member) session.getAttribute("signinMember");
		if(signinMember == null) {
			response.sendRedirect("/moyoung/signin");
			return false;
		}

		//return super.preHandle(request, response, handler);
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.info("postHandle");
		super.postHandle(request, response, handler, modelAndView);
	}

}
