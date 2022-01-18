package com.homeart.mapper.admin;

import java.util.List;

import com.homeart.domain.admin.AdminCriteria;
import com.homeart.domain.admin.AdminMemberVO;

public interface AdminMemberMapper {
	
	List<AdminMemberVO> getList();
	
	List<AdminMemberVO> getListWithPaging(AdminCriteria cri);
	
	AdminMemberVO read(String member_id);
	//return 타입은 AdminMemeberVO이며 read로 이름으로 만들고, 
	//member_id 값이 전달이 되면 정보를 보여줄 수 있게끔.
	
	int update(AdminMemberVO member_id);
}
