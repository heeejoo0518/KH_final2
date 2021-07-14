package com.kh.moyoung.review.model.service;

import java.util.List;

import com.kh.moyoung.common.util.PageInfo;
import com.kh.moyoung.review.model.vo.Review;

public interface ReviewService {

	int getReviewCount(); /* 리뷰 개수 카운팅 */ 

	List<Review> getReviewList(PageInfo pageInfo);

	int save(Review review); /* 리뷰 작성하기 */

}
