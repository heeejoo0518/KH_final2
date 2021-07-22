package com.kh.moyoung.party.model.service;

import java.util.List;

import com.kh.moyoung.common.util.PageInfo;
import com.kh.moyoung.party.model.vo.Party;

public interface PartyService {

	int save(Party party);

	int getPartyCount();

	List<Party> getPartyList(PageInfo pageInfo);

	Party findByNo(int party_no);
	
	boolean deleteParty(int party_no);

}
