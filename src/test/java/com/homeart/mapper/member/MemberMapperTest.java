package com.homeart.mapper.member;

import static org.junit.Assert.*;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.homeart.domain.member.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberMapperTest {

	@Autowired
	public MemberMapper mapper;
	
	@Test
	public void insertAndSelectTest() {
		int ran = (int)(Math.random() * 1000) + 1;
		String member_id = "member" + ran;
		String member_name = "name" + ran;
		String password = "newpassword" + ran;
		String nickName = "nickName" + ran;
		String email = member_id + "@gmail.com";
		String country = "seoul" + ran;
		Integer isAdmin = 0;
		
		MemberVO vo = new MemberVO();
		vo.setMember_id(member_id);
		vo.setMember_name(member_name);
		vo.setPassword(password);
		vo.setNickName(nickName);
		vo.setCountry(country);
		vo.setEmail(email);
		vo.setIsAdmin(isAdmin);
		
		// insert test
		int cnt = mapper.insert(vo);
		assertEquals(1, cnt);
		
		// select test
		MemberVO s = mapper.select(member_id);
		
		assertEquals(member_id, s.getMember_id());
		assertEquals(member_name, s.getMember_name());
		assertEquals(password, s.getPassword());
		assertEquals(nickName, s.getNickName());
		assertEquals(country, s.getCountry());
		assertEquals(email, s.getEmail());
		assertEquals(isAdmin, s.getIsAdmin());
		
		// update test
		String newPassword = "newPassword";
		String newCountry = "newCountry";
		LocalDateTime inserted = s.getInserted();
		
		s.setPassword(newPassword);
		s.setCountry(newCountry);
		
		cnt = mapper.update(s);
		assertEquals(1, cnt);
		
		MemberVO t = mapper.select(member_id);
		assertEquals(member_id, t.getMember_id());
		assertEquals(member_name, t.getMember_name());
		assertEquals(newPassword, t.getPassword());
		assertEquals(nickName, t.getNickName());
		assertEquals(newCountry, t.getCountry());
		assertEquals(email, t.getEmail());
		assertEquals(inserted, t.getInserted());
		assertEquals(isAdmin, t.getIsAdmin());
		
		// list test1 - 지우기 전의 list.size
		List<MemberVO> list1 = mapper.list();
		int size1 = list1.size();
		for (MemberVO item : list1) {
			assertNotNull(item.getMember_id());
			assertNotNull(item.getMember_name());
			assertNotNull(item.getPassword());
			assertNotNull(item.getNickName());
			assertNotNull(item.getCountry());
			assertNotNull(item.getInserted());
			assertNotNull(item.getIsAdmin());
		}
			
		// delete test
		cnt = mapper.delete(member_id);
		assertEquals(1, cnt);
		
		assertNull(mapper.select(member_id));
		
		// list test2 - 지우고 난 후의 list.size
		List<MemberVO> list2 = mapper.list();
		int size2 = list2.size();
		
		assertEquals(size1-1, size2);
	}
}
