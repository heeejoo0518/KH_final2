package com.kh.moyoung.movie.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.moyoung.movie.model.vo.Movie;

@Mapper
public interface MovieMapper {
	int selectMovieCount();	

	Movie selectMovieByNo(@Param("Movie_id") int movie_id);
	
	List<Movie> selectMovieList(RowBounds rowBounds);

	int updateMovie(Movie movie);
	
}
