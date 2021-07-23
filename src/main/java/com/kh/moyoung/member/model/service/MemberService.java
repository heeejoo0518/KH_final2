package com.kh.moyoung.member.model.service;

import com.kh.moyoung.member.model.vo.Member;

public interface MemberService {
	Member login(String u_id, String u_pwd);
	
	Member autoLogin(String u_id);

	int save(Member member);

	boolean validate(String u_id);
	
	boolean validateNickname(String nickname);

	Member findById(String u_id);

	Member findByNickname(String nickname);
	
	int delete(int u_no);

}
