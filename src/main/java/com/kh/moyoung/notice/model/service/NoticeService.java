package com.kh.moyoung.notice.model.service;

import java.util.List;

import com.kh.moyoung.notice.model.vo.Notice;
import com.kh.moyoung.common.util.PageInfo;

public interface NoticeService {
	
	int save(Notice notice); /* 공지작성 */

	int getNoticeCount(); /* 공지개수 카운팅*/	

	List<Notice> getNoticeList(PageInfo pageInfo);

	Notice findByNo(int noticeNo);

	
}
