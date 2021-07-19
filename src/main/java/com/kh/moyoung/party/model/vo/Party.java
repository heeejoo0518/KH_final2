package com.kh.moyoung.party.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Party {
	
	private int party_no; /* 파티 고유번호 */
	
	private Date create_date; /*작성일*/

	private String writer_id; /*작성자*/	
	
	private String name; /*파티 제목*/
	
	private String content; /*내용*/
	
	private String link; /*오픈채팅방 링크*/
		
	private String ott_type; /*OTT 타입*/ 

	private String status;
}

