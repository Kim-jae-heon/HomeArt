package com.homeart.controller.admin.notice;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.homeart.domain.admin.AdminNoticeVO;
import com.homeart.service.admin.notice.AdminNoticeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/adminPage/adminNotice")
@AllArgsConstructor
public class AdminNoticeCUD {
	private AdminNoticeService service;
	
	@GetMapping("/AdminNoticeCUD")
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list", service.getList());
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(Model model, Long admin_no) {
		log.info("get or modify");
		model.addAttribute("notice", service.get(admin_no));
	}
	
	@PostMapping("/modify")
	public String modify(AdminNoticeVO notice, RedirectAttributes rttr) {
		log.info("modify: " + notice);
		if(service.modify(notice)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/adminPage/adminNotice/AdminNoticeCUD";
	}
	
	@GetMapping("/register") 
	public void register(){
		
	}
	
	@PostMapping("/register")
	public String register(AdminNoticeVO notice, RedirectAttributes rttr) {
		log.info("register: " + notice);
		
		service.register(notice);
		
		rttr.addFlashAttribute("result", notice.getAdmin_no());
		
		return "redirect:/adminPage/adminNotice/AdminNoticeCUD";
	}
	
	@PostMapping("/remove")
	public String remove(Long admin_no, RedirectAttributes rttr) {
		log.info("remove..." + admin_no);
		if(service.remove(admin_no)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/adminPage/adminNotice/AdminNoticeCUD";
	}
}
