package com.kh.moyung.party;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Party {
	
	private int party_no;
	
	private Date createDate;

	private String id;
	
	private String name;
	
	private String content;
	
	private String link;
	
	private String hashtag;
	
	private int ottType; 

}

