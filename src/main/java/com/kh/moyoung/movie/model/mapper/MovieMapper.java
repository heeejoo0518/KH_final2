package com.kh.moyoung.movie.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.moyoung.movie.model.vo.Movie;

@Mapper
public interface MovieMapper {
	int selectBoardCount();	

	Movie selectBoardByNo(@Param("MovieNo") int movieNo);
	
	List<Movie> selectMovieList(RowBounds rowBounds);
	
	int insertBoard(Movie movie);

	int updateBoard(Movie movie);
}
