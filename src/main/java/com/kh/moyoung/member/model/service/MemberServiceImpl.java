package com.kh.moyoung.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.moyoung.member.model.mapper.MemberMapper;
import com.kh.moyoung.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	

	@Override
	public Member login(String u_id, String u_pwd) {
		Member member = this.findById(u_id);
		
		return member != null && 
				passwordEncoder.matches(u_pwd, member.getU_pwd()) ? member : null;
	}
	
	@Override
	@Transactional
	public int save(Member member) {
		int result = 0;
		
		if(member.getU_no() != 0) {
			if(member.getU_pwd()!=null) member.setU_pwd(passwordEncoder.encode(member.getU_pwd()));
			result = mapper.updateMember(member);
		} else {
			member.setU_pwd(passwordEncoder.encode(member.getU_pwd()));
			result = mapper.insertMember(member);
		}
		
		return result;
	}

	@Override
	public boolean validate(String u_id) {				
		return this.findById(u_id) != null;
	}
	
	
	@Override
	public boolean validateNickname(String nickname) {
		return this.findByNickname(nickname) != null;
	}

	@Override
	public Member findById(String u_id) {
		return mapper.selectMember(u_id);
	}
	
	@Override
	public Member findByNickname(String nickname) {
		return mapper.selectMemberByNickname(nickname);
	}
	
	@Override
	public int delete(int u_no) {
		
		return mapper.deleteMember(u_no);
	}
}
