package com.kh.moyoung.admin.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class adminController {
	
	@RequestMapping(value = "/css/admin.css", method = {RequestMethod.GET} )
	public String adminPage() {
		
		return "css/admin.css";
	}
	
	@RequestMapping(value = "/admin/adminMember", method = {RequestMethod.GET})
	public String adminMember() {
		
		return "admin/adminMember";
	}
	
	@RequestMapping(value = "/admin/adminMovie", method = {RequestMethod.GET})
	public String adminMovie() {
		
		return "admin/adminMovie";
	}
	@RequestMapping(value = "/admin/adminReport", method = {RequestMethod.GET})
	public String adminReport() {
		
		return "admin/adminReport";
	}
	
	@RequestMapping(value = "/admin/adminReview", method = {RequestMethod.GET})
	public String adminReview() {
		
		return "admin/adminReview";
	}
	
}
