package com.kh.moyoung.notice.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.moyoung.notice.model.vo.Notice;

@Mapper
public interface NoticeMapper {
	
	int selectNoticeCount();	

	Notice selectNoticeByNo(@Param("noticeNo") int noticeNo);
	
	List<Notice> selectNoticeList(RowBounds rowBounds);
	
	int insertNotice(Notice notice);

	int updateNotice(Notice notice);
	
	int deleteNotice(int no);
}
