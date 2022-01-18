package com.homeart.service.admin.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homeart.domain.admin.AdminNoticeVO;
import com.homeart.mapper.admin.AdminNoticeMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AdminNoticeServiceImpl implements AdminNoticeService {
	
	@Setter(onMethod_ = @Autowired)
	private AdminNoticeMapper mapper;

	@Override
	public void register(AdminNoticeVO notice) {

		log.info("register....." + notice);
		
		mapper.insert(notice);		
	}

	@Override
	public AdminNoticeVO get(Long admin_no) {
		log.info("get......" + admin_no);
		
		return mapper.read(admin_no);
	}

	@Override
	public boolean modify(AdminNoticeVO notice) {
		log.info("modify......" + notice);
		
		return mapper.update(notice) == 1;
	}

	@Override
	public boolean remove(Long admin_no) {
		log.info("remove...." + admin_no);
		
		return mapper.delete(admin_no) == 1;
	}

	@Override
	public List<AdminNoticeVO> getList() {
		log.info("getList.....");

		return mapper.getList();
	}
}
