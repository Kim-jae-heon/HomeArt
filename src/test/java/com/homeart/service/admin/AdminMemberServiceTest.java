package com.homeart.service.admin;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.homeart.service.admin.member.AdminMemberService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
//interface만 바라보고 설계를 해주는 것이 좋다.
public class AdminMemberServiceTest {
	@Autowired
	private AdminMemberService service;
	
	@Test
	public void testPrint() {
		log.info(service);
	}
	
	@Test
	public void testGetList() {
		
		service.getList().forEach(member_id -> log.info(member_id));
		
	}
}
