package com.kh.moyoung.movie.model.service;

import java.util.List;

import com.kh.moyoung.movie.model.vo.Movie;
import com.kh.moyoung.common.util.PageInfo;

public interface MovieService {

	int getMovieCount();

	List<Movie> getMovieList(PageInfo pageInfo);

	int save(Movie movie);

	Movie findByNo(int movieNo);
	
}
