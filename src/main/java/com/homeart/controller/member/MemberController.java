package com.homeart.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.homeart.domain.member.MemberVO;
import com.homeart.service.member.MemberService;

import lombok.Setter;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Setter(onMethod_ = @Autowired)
	private MemberService service;
	
	@GetMapping("/signup")
	public void signup() {
		
	}
	
	@PostMapping("/signup")
	public String signup(@ModelAttribute("member") MemberVO member, RedirectAttributes rttr, Model model) {
		
		MemberVO m = service.read(member.getMember_id());
		
		if(m == null) {
			boolean ok = service.register(member);
			
			if(ok) {
				rttr.addFlashAttribute("result", "회원가입이 완료되었습니다.");
				return "redirect:/";
			}
			else {
				return "redirect:/member/signup";
			}			
		}
		else {
			model.addAttribute("alertMessage", "중복된 아이디 입니다.");
			return null;
		}
		
	}
	
	@GetMapping("/login")
	public void login() {
		
	}
	
	@PostMapping("/login")
	public String login(String member_id, String password, HttpSession session, RedirectAttributes rttr) {
		
		// service 사용해서 아이디로 MemberVO 얻고
		MemberVO vo = service.read(member_id);
		
		
		// MemberVO가 null이거나 패스워드가 다르면 로그인 실패		
		if(vo == null) {
			// 로그인 실패
			return null;
		}
		
		// 얻어온 MemberVO의 패스워드와 입력한 패스워드가 같은지 확인
		boolean correctPassword = password.equals(vo.getPassword());
		
		if(!correctPassword) {
			// 로그인 실패
			return null;
		}
		
		// MemberVO가 null이 아니거나 패스워드가 같으면 로그인 성공
		// 로그인 성공
		rttr.addFlashAttribute("result", vo.getNickName() + "님 반갑습니다.");
		session.setAttribute("loggedInMember", vo);
		return "redirect:/";
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session, RedirectAttributes rttr) {
		// 세션 invalidate
		session.invalidate();
		rttr.addFlashAttribute("result", "로그아웃 했습니다.");

		// /board/list redirect
		return "redirect:/";
	}
}
