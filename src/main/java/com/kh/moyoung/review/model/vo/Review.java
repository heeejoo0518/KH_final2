package com.kh.moyoung.review.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Review {
	private int reviewNo; /* 게시글 고유 번호 */

	private int movieNo; /* 영화 고유 번호 */

	private int rate; /* 평점 */

	private int spoiler; /* 스포일러 포함 여부(0:미포함, 1:포함) */

	private int likeCount; /* 좋아요 수 */

	private int u_no; /* 유저 고유 번호 */

	/*private String sort;  정렬 */

	private String content; /* 리뷰 내용 */

	/*private String writerId;  게시글 작성자 */

	private String nickname; /* 게시글 작성자 닉네임 */

	private String sort; /* 정렬 */

	private Date writeDate; /* 게시글 작성일 */

	private String movieTitle_kor; /* 영화 제목 */


}
