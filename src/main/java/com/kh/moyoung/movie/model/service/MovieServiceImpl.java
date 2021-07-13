package com.kh.moyoung.movie.model.service;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.moyoung.movie.model.mapper.MovieMapper;
import com.kh.moyoung.movie.model.vo.Movie;
import com.kh.moyoung.common.util.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service // 스프링에서 관리하는 빈으로 등록이 됨
public class MovieServiceImpl implements MovieService {
	@Autowired
	private MovieMapper mapper;

	@Override
	@Transactional
	public int save(Movie movie) {
		int result = 0;
		if(movie.getMovie_id() != 0) {
			result = mapper.updateMovie(movie);
		} else {
			result = mapper.insertMovie(movie);
		}

		return result;
	}

	@Override
	public int getMovieCount() {
		return mapper.selectMovieCount();
	}

	@Override
	public List<Movie> getMovieList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());

		return mapper.selectMovieList(rowBounds);
	}

	@Override
	public Movie findByNo(int movie_id) {
		return mapper.selectMovieByNo(movie_id);
	}

}
