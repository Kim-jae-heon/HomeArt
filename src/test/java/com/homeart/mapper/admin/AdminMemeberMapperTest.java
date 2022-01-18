package com.homeart.mapper.admin;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.homeart.controller.admin.AdminMainController;
import com.homeart.domain.admin.AdminMemberVO;
import com.homeart.mapper.admin.AdminMemberMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AdminMemeberMapperTest {
	
	@Autowired
	private AdminMemberMapper adminMemberMapper;
	
	@Test
	public void testGetList() {
		
		log.info("-------작동 good--------");
		adminMemberMapper.getList();
		
	}
	
	@Test
	public void testRead() {
		
		AdminMemberVO vo = adminMemberMapper.read("member_id");
		log.info(vo);
		
	}
	
	@Test
	public void testUpdate() {
		AdminMemberVO vo = new AdminMemberVO();
		vo.setMember_id("id3");
		vo.setMember_name("김재헌");
		vo.setNickName("치킨");
		vo.setCountry("Korea");
		
		log.info("수정횟수:" + adminMemberMapper.update(vo));
	}
}
