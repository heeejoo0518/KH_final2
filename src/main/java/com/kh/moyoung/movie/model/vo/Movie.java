package com.kh.moyoung.movie.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Movie {
	private int movieNo;
	
	private Date last_update;
	
	private String title;
	
	private String title_kor;
		
	private int product_year;
	
	private Date open_date;
	
	private String country;
	
	private String genre;
	
	private String director;
	
	private int vote;
	
	private int adult;
	
	private int run_time;
	
	private String m_poster;
	
	private String netflix;
	
	private String watcha;
	
	private String tving;
	
	private String wavve;
	
	private String story;
	
	private String actor;
	
	private String viewing_age;
	
	private String trailer;
	
	}