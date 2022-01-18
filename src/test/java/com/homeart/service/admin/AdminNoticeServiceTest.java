package com.homeart.service.admin;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.homeart.domain.admin.AdminNoticeVO;
import com.homeart.service.admin.notice.AdminNoticeService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AdminNoticeServiceTest {
	
	@Setter(onMethod_ = @Autowired)
	private AdminNoticeService service;
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		AdminNoticeVO notice = new AdminNoticeVO();
		notice.setAdmin_title("새로 작성하는 글");
		notice.setAdmin_content("새로 작성한 내용");
		notice.setAdmin_id("12");
		
		service.register(notice);
	}
	
	@Test
	public void testGetList() {
		service.getList().forEach(notice -> log.info(notice));
	}
	
	@Test
	public void testGet() {
		log.info(service.get(1L));
	}
	
	@Test
	public void testDelete() {
		log.info("REMOVE RESULT: " + service.remove(2L));
	}
	
	@Test
	public void testUpdate() {
		AdminNoticeVO notice = service.get(1L);
		
		if(notice == null) {
			return;
		}
		
		notice.setAdmin_title("제목 수정합니다");
		log.info("MODIFY RESULT: " + service.modify(notice));
	}
}
