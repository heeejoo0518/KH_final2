package com.kh.moyoung.common.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kh.moyoung.member.model.service.MemberService;
import com.kh.moyoung.member.model.vo.Member;

@Service
public class UserMailSendService {
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MemberService memberService;
	
	private boolean lowerCheck;
	private int size;
	
	// 이메일 난수 만들기
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;
			do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}
			} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}
	
	// 난수를 이용한 키 생성
	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}
	
	//아이디 찾기 위한 인증번호 발급
	public String mailSendWithId(String email, HttpServletRequest request) {
		String key = getKey(false, 6);
		
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요</h2><br><br>" 
				+ "<p>아이디 찾기를 위한 인증번호를 발급해드렸습니다. </p>"
				+ "<p>인증번호는 <h2 style='color : blue'>'" + key +"'</h2>이며 3분 안에 입력해주시면 됩니다.</p><br>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		try {
			mail.setSubject("[모두의 영화] 아이디 인증번호가 발급되었습니다", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(email));
			mailSender.send(mail);
		} catch (MessagingException e) { 
			e.printStackTrace();
		}
		
		return key;
	}
	
	//임시 비밀번호 발급 및 변경
	public int mailSendWithPassword(Member mem, HttpServletRequest request) {
		// 비밀번호는 6자리로 보내고 데이터베이스 비밀번호를 바꿔준다
		String key = getKey(false, 6);
		
		// 회원 이름 꺼내는 코드
		Member member = new Member();
		member.setU_no(mem.getU_no());
		String name = mem.getNickname();
				
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 '"+ name +"' 님</h2><br><br>" 
				+ "<p>비밀번호 찾기를 신청해주셔서 임시 비밀번호를 발급해드렸습니다.</p>"
				+ "<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>'" + key +"'</h2>이며 로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p><br>"
				+ "<h3><a href='http://localhost:8088/moyoung/signin'>모두의 영화 홈페이지 접속</a></h3><br><br>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		try {
			mail.setSubject("[모두의 영화] 임시 비밀번호가 발급되었습니다", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(mem.getEmail()));
			mailSender.send(mail);
		} catch (MessagingException e) { 
			e.printStackTrace();
		}
		
		member.setU_pwd(key);
		return memberService.save(member);
	}
	
}
