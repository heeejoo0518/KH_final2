package com.kh.moyoung.party.model.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.moyoung.common.util.PageInfo;
import com.kh.moyoung.party.model.mapper.PartyMapper;
import com.kh.moyoung.party.model.vo.Party;

@Service
public class PartyServiceImpl implements PartyService {
	@Autowired
	private PartyMapper mapper;
	
	@Override
	@Transactional
	public int save(Party party) {
		int result = 0;
		
		if(party.getParty_no() != 0) {
		result=mapper.updateParty(party);
		} else {
		result = mapper.insertParty(party);
		}
		
		return result;
	}
	
	@Override
	public int getPartyCount() {
		
		return mapper.selectPartyCount();
	}
	
	

	@Override
	public List<Party> getPartyList(PageInfo pageInfo) {
				
		return mapper.selectPartyList();
	}


	@Override
	public Party findByNo(int party_no) {
		
		return mapper.selectPartyByNo(party_no);
	}

	@Override
	public boolean deleteParty(int party_no) {
		
		return mapper.deleteParty(party_no);
	}

	
}
