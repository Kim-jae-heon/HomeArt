package com.homeart.service.admin.member;

import java.util.List;

import org.springframework.stereotype.Service;

import com.homeart.domain.admin.AdminCriteria;
import com.homeart.domain.admin.AdminMemberVO;
import com.homeart.mapper.admin.AdminMemberMapper;

import lombok.RequiredArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@Service //컨트롤러처럼 동작하여 bean으로 등록됨.
//아이콘에 s가 붙어야한다. 이 패키지를 스캔해야지만 이 클래스가 interface타입
//으로 바라볼수 있게 되기 때문.
//interface를 쓰는 이유는 실제 객체가 무엇인지 모르게하게끔하기 위하여.
//실제 객체가 뭔지 몰라도 타입만 보아도 무엇인지 알 수 있게끔하기 위하여. DI를
//이용하여 유연하게 만드는 것!
@Log4j
@RequiredArgsConstructor //원래는 여기에 allargscontructor를 썼었다. 
//그러나 생성자를 final로 하기위해 주입 방법을 다른 것으로 사용!
@ToString //주입되었는지를 확인하기 위함
public class AdminMemberServiceImpl implements AdminMemberService{
	//Service는 Mapper가 없으면 동작을 하지 못한다. Mapper에 의존적이다.
	private final AdminMemberMapper mapper;

	@Override
	public AdminMemberVO get(String member_id) {
		// TODO Auto-generated method stub
		
		return mapper.read(member_id);
	}

	@Override
	public int modify(AdminMemberVO member_id) {
		// TODO Auto-generated method stub
		return mapper.update(member_id);
	}

	@Override
	public List<AdminMemberVO> getList(AdminCriteria cri) {
		// TODO Auto-generated method stub
		return mapper.getListWithPaging(cri);
	}
}
