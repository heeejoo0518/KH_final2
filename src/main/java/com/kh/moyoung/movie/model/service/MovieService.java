package com.kh.moyoung.movie.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.moyoung.movie.model.vo.Movie;
import com.kh.moyoung.common.util.PageInfo;

public interface MovieService {

	int save(Movie movie);

	int getMovieCount();

	List<Movie> getMovieList(PageInfo pageInfo);

	Movie findByNo(int movieNo);
	
}
