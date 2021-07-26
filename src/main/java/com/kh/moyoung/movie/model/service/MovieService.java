package com.kh.moyoung.movie.model.service;

import java.util.List;

import com.kh.moyoung.movie.model.vo.Movie;
import com.kh.moyoung.review.model.vo.Review;
import com.kh.moyoung.common.util.PageInfo;

public interface MovieService {

	int save(Movie movie);

	int getMovieCount(String title);

	int getMovieCount();

	List<Movie> getMovieList(PageInfo pageInfo, String title);

	List<Movie> getMovieList(PageInfo pageInfo);

	Movie findByNo(int movieNo);

	List<Movie> selectMovieRecent(PageInfo pageInfo, String title);

	List<Review> selectMovieVote(PageInfo pageInfo, String title);

	int getLikeCount(int u_no);
	
	List<Movie> getLikeList(PageInfo pageInfo, int u_no);

	List<Movie> top5List(PageInfo pageInfo);

	int getPlatformCount();

	List<Movie> getNetflixList(PageInfo pageInfo);

	List<Movie> getWatchaList(PageInfo pageInfo);

	List<Movie> getTvingList(PageInfo pageInfo);

	List<Movie> getWavveList(PageInfo pageInfo);

	//List<Movie> getLikeList(PageInfo pageInfo);
}
