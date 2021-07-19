package com.kh.moyoung.notice.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	private int no; /* 공지글 번호 */
	
	private int writerNo; /* 작성자 회원번호 */
	
	private String writerId; /* 작성자 아이디 */
	
	private String title; /* 제목 */
	
	private String content; /* 내용 */
	
	private String status; /* 상태 */ 
	
	private Date createDate; /* 작성일*/
	
}