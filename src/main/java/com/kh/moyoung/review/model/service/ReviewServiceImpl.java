package com.kh.moyoung.review.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.moyoung.common.util.PageInfo;
import com.kh.moyoung.review.model.mapper.ReviewMapper;
import com.kh.moyoung.review.model.service.ReviewServiceImpl;
import com.kh.moyoung.review.model.vo.Review;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewMapper mapper;
	
	@Override
	public int getReviewCount() {
		
		return mapper.selectReviewCount();
	}

	@Override
	public List<Review> getReviewList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectReviewList(rowBounds);	
	}
	
	@Override
	public List<Review> selectReviewHighRateList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectReviewHighRateList(rowBounds);
	}
	
	@Override
	public List<Review> selectReviewLowRateList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectReviewLowRateList(rowBounds);
	}

	@Override
	@Transactional
	public int save(Review review) {
		int result= 0;
		
		result = mapper.insertReview(review);
		/*if(review.getReviewNo() == 0) {
		 
		}*/
		
		return result;
	}

	@Override
	public int getMyReviewCount(int u_no) {
		return mapper.selectMyReviewCount(u_no);
	}

	@Override
	public List<Review> getMyReviewList(PageInfo pageInfo, int u_no) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectMyReviewList(rowBounds,u_no);
	}




}
