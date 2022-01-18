package com.homeart.service.member;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homeart.domain.member.MemberVO;
import com.homeart.mapper.member.MemberMapper;

import lombok.Setter;

@Service
public class MemberService {
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	public MemberVO read(String member_id) {
		return mapper.select(member_id);
	}
	
	public boolean register(MemberVO member) {
		
		try {
			return mapper.insert(member) == 1;			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean modify(MemberVO member) {
		return mapper.update(member) == 1;
	}
	
	public boolean remove(String member_id) {
		return mapper.delete(member_id) == 1;
	}
	
	public List<MemberVO> getList() {
		return mapper.list();
	}
}
