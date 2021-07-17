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
	
	private int movieNo; /*영화번호(1부터 들어갔어요)*/
	
	private Date last_update; /*마지막업뎃일 왜있는지모르곘지만 일단들어있어요...*/
	
	private String title; /*영화 제목*/
	
	private String title_kor; /*영화 한글 제목*/
		
	private int product_year; /*영화 제작년도*/
	
	private Date open_date; /*영화 개봉일*/
	
	private String country; /*영화 제작 국가*/
	
	private String genre; /*영화 장르 */
	
	private String director; /* 감독 */
	
	private int vote; /* 평점 */
	
	private int adult; /* 성인여부 성인물아니면0 성인물인경우1*/
	
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