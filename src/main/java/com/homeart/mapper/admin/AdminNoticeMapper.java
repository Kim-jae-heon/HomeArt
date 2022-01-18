package com.homeart.mapper.admin;

import java.util.List;

import com.homeart.domain.admin.AdminNoticeVO;

public interface AdminNoticeMapper {
	public List<AdminNoticeVO> getList();
	
	public void insert(AdminNoticeVO notice);
	
	public AdminNoticeVO read(Long admin_no);
	
	public int delete(Long admin_no);
	
	public int update(AdminNoticeVO notice);
}
