package com.kh.moyoung.party.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.moyoung.common.util.PageInfo;
import com.kh.moyoung.party.model.vo.Party;

@Mapper
public interface PartyMapper {

	int selectPartyCount();
	
	Party selectPartyByNo(@Param("party_no") int party_no);

	List<Party> selectPartyList();
	
	int insertParty(Party party);

	int updateParty(Party party);

	 boolean deleteParty(int party_no);

}
