package com.kh.moyoung.notice.model.service;

import java.util.List;

import com.kh.moyoung.notice.model.vo.Notice;
import com.kh.moyoung.common.util.PageInfo;

public interface NoticeService {
	int save(Notice notice);

	int getNoticeCount();

	List<Notice> getNoticeList(PageInfo pageInfo);

	Notice findByNo(int noticeNo);

	
}
