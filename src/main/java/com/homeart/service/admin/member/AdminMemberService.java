package com.homeart.service.admin.member;

import java.util.List;

import com.homeart.domain.admin.AdminCriteria;
import com.homeart.domain.admin.AdminMemberVO;

public interface AdminMemberService { //business 계층이기 때문에 의사소통에
//용이한 용어를 쓴다.
	AdminMemberVO get(String member_id); //mapper에서 read의 기능

	int modify(AdminMemberVO member_id);
	
	List<AdminMemberVO> getList(AdminCriteria cri);
}
