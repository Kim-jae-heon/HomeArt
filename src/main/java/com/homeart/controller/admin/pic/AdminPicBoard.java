package com.homeart.controller.admin.pic;

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
import com.homeart.domain.admin.AdminPicVO;
import com.homeart.service.admin.Pic.AdminPicService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/adminPage/adminPic")
@AllArgsConstructor
public class AdminPicBoard {
	
	@Setter(onMethod_ = @Autowired)
	private AdminPicService service;
	
	@GetMapping("/AdminPicBoard")
	public void list(Long masterpiece_id, Model model,@RequestParam(value="page", defaultValue = "1") Integer page) {
		Integer numberPerPage = 3;
		
		List<AdminPicVO> list = service.getList(page, numberPerPage);
		AdminPageInfoVO infoVo = service.getPageInfo(page, numberPerPage);
		
		for(AdminPicVO lists: list) {
			System.out.println(lists);
		}
		
		System.out.println("");
		
		model.addAttribute("list", list);
		model.addAttribute("infoVo", infoVo);
		model.addAttribute("pic", service.get(masterpiece_id));
	}
	
	@PostMapping("/remove")
	public String remove(Long masterpiece_id, MultipartFile file) {
		log.info("remove......." + masterpiece_id);
		
		service.remove(masterpiece_id, file);
		
		return "redirect:/adminPage/adminPic/AdminPicBoard";
	}
}
