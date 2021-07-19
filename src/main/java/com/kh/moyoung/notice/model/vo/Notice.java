package com.kh.moyoung.notice.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	private int no;
	
	private int writerNo;
	
	private String writerId;
	
	private String title;
	
	private String content;
	
	private String status;
	
	private Date createDate;
	
}