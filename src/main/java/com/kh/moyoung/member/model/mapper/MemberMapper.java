package com.kh.moyoung.member.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kh.moyoung.member.model.vo.Member;

// @Repository
@Mapper
public interface MemberMapper {
	Member selectMember(@Param("u_id") String u_id);
	
	Member selectMemberByNickname(@Param("nickname") String nickname);

	int insertMember(Member member);

	int updateMember(Member member);

	int deleteMember(@Param("u_no") int u_no);

	
}
