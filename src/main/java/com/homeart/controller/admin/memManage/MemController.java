package com.homeart.controller.admin.memManage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.homeart.domain.admin.AdminCriteria;
import com.homeart.domain.admin.AdminPageDTO;
import com.homeart.service.admin.member.AdminMemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/adminPage/adminMemManage")
@Log4j
public class MemController {
	
	@Autowired
	private final AdminMemberService service;
	
	@GetMapping("/AdminMemManage")
	private void read(String member_id,AdminCriteria cri, Model model) {
		log.info("manage read page............");
		
		model.addAttribute("list1", service.get(member_id));
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new AdminPageDTO(cri, 123));
	}
	
}
