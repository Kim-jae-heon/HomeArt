package com.homeart.mapper.admin;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.homeart.domain.admin.AdminNoticeVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AdminNoticeMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private AdminNoticeMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(notice -> log.info(notice));
	}
	
	@Test
	public void testInsert() {
		AdminNoticeVO notice = new AdminNoticeVO();
		notice.setAdmin_title("안녕하세요");
		notice.setAdmin_content("두 번째 게시물의 내용물");
		notice.setAdmin_id("12");
		
		mapper.insert(notice);
		
		log.info(notice);
	}
	
	@Test
	public void testRead() {
		AdminNoticeVO notice = mapper.read(2L);
		
		log.info(notice);
	}
	
	@Test
	public void testDelte() {
		log.info("DELETE Count:" + mapper.delete(2L));
	}
	
	@Test
	public void testUpdate() {
		AdminNoticeVO notice = new AdminNoticeVO();
		
		notice.setAdmin_no(1L);
		notice.setAdmin_title("수정된 제목");
		notice.setAdmin_content("수정된 내용");
		notice.setAdmin_id("123");
		
		int count = mapper.update(notice);
		log.info("UPDATE COUNT:" + count);
	}
}
