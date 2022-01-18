package com.homeart.mapper.member;

import java.util.List;

import com.homeart.domain.member.MemberVO;

public interface MemberMapper {
	public int insert(MemberVO member);
	
	public MemberVO select(String member_id);
	
	public int update(MemberVO member);
	
	public int delete(String member_id);
	
	public List<MemberVO> list();

}
