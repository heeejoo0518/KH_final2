package com.kh.moyoung.review.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Review {
	private int uid;
	private int movie_id;
	private int rate;
	private int spoiler;
	private int like;
	private String content;
	private String nickname;
}
