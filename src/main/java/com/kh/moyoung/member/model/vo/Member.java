package com.kh.moyoung.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int u_no;				/* 유저번호 */
	
	private String u_id;			/* 아이디 */
	
	private String u_pwd;			/* 비밀번호 */
	
	private String nickname;		/* 닉네임 */
	
	private String email;			/* 이메일 */
	
	private String birth;				/* 생일 */
	
	private Date account_locked;	/* 계정 LOCK 종료 날짜 */
	
	private int u_validate;			/* 본인인증여부(0:인증안됨, 1:인증됨) */
	
	private int u_role;				/* 유저유형 (0:일반회원, 1:관리자, 2:탈퇴회원, 3:정지회원) */
	
	private int signup_type;		/* 가입유형 (0:일반, 1:네이버, 2:..) */
}
