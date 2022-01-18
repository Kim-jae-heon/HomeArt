package com.homeart.service.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homeart.domain.member.GuestbookCommentVO;
import com.homeart.domain.member.GuestbookVO;
import com.homeart.mapper.member.GuestbookMapper;

import lombok.Setter;


@Service
public class GuestbookService {
	@Setter(onMethod_ = @Autowired)
	private GuestbookMapper mapper;
	
	/* 방명록 */
	public boolean register(GuestbookVO vo) {
		
		try {
			return mapper.insert(vo) == 1;			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean remove(String guestbook_id) {
		return mapper.delete(guestbook_id) == 1;
	}
	
	public List<GuestbookVO> getList(String mypage_owner) {
		return mapper.list(mypage_owner);
	}
	
	/* 방명록 댓글 */
	public boolean registerComment(GuestbookCommentVO vo) {
		
		try {
			return mapper.insertComment(vo) == 1;			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean removeComment(String guestbook_comment_id) {
		return mapper.deleteComment(guestbook_comment_id) == 1;
	}
	
	public List<GuestbookCommentVO> getListComment(String guestbook_id) {
		return mapper.listComment(guestbook_id);
	}
	
	public List<GuestbookCommentVO> getlistCommentByGuestbookId(String mypage_owner, String guestbook_id){
		return mapper.listCommentByGuestbookId(mypage_owner, guestbook_id);
	}
}
