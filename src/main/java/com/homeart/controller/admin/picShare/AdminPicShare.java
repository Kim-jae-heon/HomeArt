package com.homeart.controller.admin.picShare;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.homeart.domain.admin.AdminPageInfoVO;
import com.homeart.domain.admin.AdminPicShareVO;
import com.homeart.service.admin.picShare.AdminPicShareService;

import lombok.Setter;

@Controller
@RequestMapping("/adminPage/adminPicShare")
public class AdminPicShare {
	
	@Setter(onMethod_ = @Autowired)
	private AdminPicShareService service;
	
	@GetMapping("/AdminPicShare")
	public void list(@RequestParam(value="page", defaultValue="1") Integer page, Model model, Integer id) {
		
		// 한 페이지의 card 수
		Integer numberPerPage = 9;
		
		List<AdminPicShareVO> list = service.getListPage(page, numberPerPage);
		AdminPageInfoVO picPageInfo = service.getPageInfo(page, numberPerPage);
		
		// 값이 잘 들어오는지 확인.
		for(AdminPicShareVO lists : list) {
			System.out.println(lists);
		}
		System.out.println("");
		
		model.addAttribute("list", list);
		model.addAttribute("picPageInfo", picPageInfo);
		model.addAttribute("read", service.get(id));
	}
	
	@PostMapping("/remove")
	public String remove(Integer id, MultipartFile file) {
		
		service.remove(id, file);
		
		return "redirect:/adminPage/adminPicShare/AdminPicShare";
	}
}

