package com.kh.moyoung.review.model.service;

import java.util.List;

import com.kh.moyoung.common.util.PageInfo;
import com.kh.moyoung.review.model.vo.Review;

public interface ReviewService {

	int getReviewCount();

	List<Review> getReviewList(PageInfo pageInfo);

}
