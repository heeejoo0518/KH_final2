package com.kh.moyoung.notice.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.moyoung.common.util.PageInfo;
import com.kh.moyoung.notice.model.mapper.NoticeMapper;
import com.kh.moyoung.notice.model.vo.Notice;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeMapper mapper;

	@Override
	public int getNoticeCount() {

		return mapper.selectNoticeCount();
	}
	
	
	@Override
	public List<Notice> getNoticeList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());	
		
		return mapper.selectNoticeList(rowBounds);
	}

	@Override
	public Notice findByNo(int noticeNo) {

		return mapper.selectNoticeByNo(noticeNo);
	}

	@Override
	@Transactional
	public int save(Notice notice) {
		int result = 0;
	
		if(notice.getNo() != 0) {
			result = mapper.updateNotice(notice);
		} else {
			result = mapper.insertNotice(notice);
		}
		
		return result;
	}

	
}
