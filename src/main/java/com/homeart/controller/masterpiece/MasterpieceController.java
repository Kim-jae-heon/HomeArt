package com.homeart.controller.masterpiece;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.homeart.domain.masterpiece.MasterpieceVO;
import com.homeart.domain.masterpiece.PageInfoVO;
import com.homeart.service.masterpiece.MasterpieceService;

import lombok.Setter;

@Controller
@RequestMapping("/masterpiece")
public class MasterpieceController {

	@Setter(onMethod_ = @Autowired)
	private MasterpieceService service;

	@GetMapping("/list")
	public void list(@RequestParam(value = "page", defaultValue = "1") Integer page, Model model) {

		Integer numberPerPage = 10; // 한 페이지의 row 수

		// 3. business logic
		// 게시물(Board) 목록 조회
//		List<BoardVO> list = service.getList();
		List<MasterpieceVO> list = service.getListPage(page, numberPerPage);
		PageInfoVO pageInfo = service.getPageInfo(page, numberPerPage);

		// 4. add attribute
		model.addAttribute("list", list);
		model.addAttribute("pageInfo", pageInfo);

		// 5. forward / redirect
		// jsp path : /WEB-INF/views/board/list.jsp
	}

	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("id") Integer id, Model model) {
		MasterpieceVO masterpiece = service.get(id);

		model.addAttribute("Masterpiece", masterpiece);
	}
	

	@GetMapping("/register")
	public void register() {

	}

	@PostMapping("/register")
	public String register(MasterpieceVO Masterpiece, MultipartFile file) throws Exception {

		Masterpiece.setFile_name(file.getOriginalFilename());
		
		service.register(Masterpiece, file);
		
	

		// 5. forward / redirect
		// 책: 목록으로 redirect
		return "redirect:/masterpiece/list";
	}



}
