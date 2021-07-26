package com.kh.moyoung.movie.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.moyoung.movie.model.vo.Movie;
import com.kh.moyoung.review.model.vo.Review;

@Mapper
public interface MovieMapper {
	
	int selectMovieCount();
	
	int insertMovie(Movie movie);
	
	List<Movie> selectMovieList(RowBounds rowBounds);
	
	Movie selectMovieByNo(@Param("movieNo") int movieNo);

	List<Movie> selectMovieRecent(RowBounds rowBounds);

	List<Review> selectMovieVote(RowBounds rowBounds);

	int selectLikeCount(@Param("u_no") int u_no);
	
	List<Movie> selectLikeList(RowBounds rowBounds, @Param("u_no") int u_no);

	List<Movie> top5List();

	int selectPlatformCount();

	List<Movie> selectNetflixList(RowBounds rowBounds);

	List<Movie> selectWatchaList(RowBounds rowBounds);

	List<Movie> selectTvingList(RowBounds rowBounds);

	List<Movie> selectWavveList(RowBounds rowBounds);

}
