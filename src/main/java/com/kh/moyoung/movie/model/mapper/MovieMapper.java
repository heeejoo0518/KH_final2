package com.kh.moyoung.movie.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.moyoung.movie.model.vo.Movie;

@Mapper
public interface MovieMapper {
	
	int selectMovieCount();
	
	int insertMovie(Movie movie);
	
	List<Movie> selectMovieList(RowBounds rowBounds);
	
	Movie selectMovieByNo(@Param("movieNo") int movieNo);

}
