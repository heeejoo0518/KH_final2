package com.kh.moyoung.review.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.moyoung.review.model.vo.Review;

@Mapper
public interface ReviewMapper {


	int selectReviewCount(int movieNo);

	List<Review> selectReviewList(RowBounds rowBounds, int movieNo);

	List<Review> selectReviewHighRateList(RowBounds rowBounds, int movieNo);

	List<Review> selectReviewLowRateList(RowBounds rowBounds, int movieNo);

	int insertReview(Review review);

	int deleteReview(int reviewNo);

	int selectMyReviewCount(@Param("u_no") int u_no);

    List<Review> selectMyReviewList(RowBounds rowBounds, @Param("u_no") int u_no);

}
