package com.homeart.controller.mypage;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.homeart.domain.member.GuestbookCommentVO;
import com.homeart.domain.member.GuestbookVO;
import com.homeart.domain.member.MemberVO;
import com.homeart.service.member.MemberService;
import com.homeart.service.mypage.GuestbookService;

import lombok.Setter;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Setter(onMethod_ = @Autowired)
	private GuestbookService guestbookService;
	
	@Setter(onMethod_ = @Autowired)
	private MemberService memberService;
	
	@RequestMapping("")
	public String mypage(String member_id, Model model) {
		
		HashMap<String, Object> commentList = new HashMap<>();
		
		List<GuestbookVO> list = guestbookService.getList(member_id);
		model.addAttribute("list", list);
		
		for(int i=0; i<list.size(); i++) {
			String guestbook_id = list.get(i).getGuestbook_id();
			List<GuestbookCommentVO> cList = guestbookService.getlistCommentByGuestbookId(member_id, guestbook_id);
			commentList.put(guestbook_id, cList);
			model.addAttribute("commentList", commentList);
		}
		
		MemberVO member = memberService.read(member_id);
		model.addAttribute("member", member);
	
		return "/mypage/mypage";
	}
	
	/* 방명록 */
	@PostMapping("/guestbook")
	public String guestbook(Model model) {
		
		return "redirect:/mypage/mypage";
	}
	
	/* 내 활동 */
	@RequestMapping("/my_picture")
	public String mypic() {
		return "/mypage/mypageMypic";
	}
	
	@RequestMapping("/favorite_picture")
	public String fpic() {
		return "/mypage/mypageFavpic";
	}
	
	@RequestMapping("/my_post")
	public String mypost() {
		return "/mypage/mypageMypost";
	}
	
	@RequestMapping("/my_reply")
	public String myreply() {
		return "/mypage/mypageMyreply";
	}

}
