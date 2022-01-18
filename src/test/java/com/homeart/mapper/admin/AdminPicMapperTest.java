package com.homeart.mapper.admin;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.homeart.domain.admin.AdminPicVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AdminPicMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private AdminPicMapper mapper;

	@Test
	public void testGetList() {
		mapper.getList().forEach(pic -> log.info(pic));
	}
	
	@Test
	public void testRead() {
		List<AdminPicVO> pic = mapper.read(140L);
		
		log.info(pic);
	}
	
	@Test
	public void testDelete() {
		log.info("Delete Count: " + mapper.delete(144L));
	}
}
