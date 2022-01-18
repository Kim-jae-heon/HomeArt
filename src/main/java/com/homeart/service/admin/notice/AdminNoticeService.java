package com.homeart.service.admin.notice;

import java.util.List;

import com.homeart.domain.admin.AdminNoticeVO;

public interface AdminNoticeService {
	//생성
	public void register(AdminNoticeVO notice);
	
	//읽기
	public AdminNoticeVO get(Long admin_no);
	
	//수정
	public boolean modify(AdminNoticeVO notice);
	
	//삭제
	public boolean remove(Long admin_no);
	
	//리스트
	public List<AdminNoticeVO> getList();
}
