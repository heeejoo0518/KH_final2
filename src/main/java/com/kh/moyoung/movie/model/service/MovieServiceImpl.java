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
import org.springframework.web.multipart.MultipartFile;

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
		
		if(movie.getNo() != 0) {
			result = mapper.updateBoard(movie);
		} else {
			result = mapper.insertBoard(movie);
		}
		
		return result;
	}

	@Override
	public String saveFile(MultipartFile upfile, String savePath) {
		String renameFileName = null;
		String renamePath = null;
		String originalFileName = upfile.getOriginalFilename();
				
		log.info("SAVE PATH : {}", savePath );
		
		// savePath가 실제로 존재하지 않으면 폴더를 생성하는 로직
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		renameFileName = 
				LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS")) + 
				originalFileName.substring(originalFileName.lastIndexOf("."));
		renamePath = savePath + "/" + renameFileName;
		
		try {
			// 업로드한 파일 데이터를 지정한 파일에 저장한다.
			upfile.transferTo(new File(renamePath));
		} catch (IOException e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
			e.printStackTrace();
		}
		
		return renameFileName;
	}

	@Override
	public int getMovieCount() {

		return mapper.selectBoardCount();
	}
	
	@Override
	public List<Movie> getMovieList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());	
		
		return mapper.selectMovieList(rowBounds);
	}

	@Override
	public Movie findByNo(int movieNo) {

		return mapper.selectBoardByNo(movieNo);
	}

	@Override
	public void deleteFile(String filePath) {
		
		log.info("FILE PATH : {}", filePath );
		
		File file = new File(filePath);
		
		if(file.exists()) {
			file.delete(); //실제 물리적인 위치에 저장된 파일이 삭제된다.
		}
	}


	
	
	
	
	
	
}
