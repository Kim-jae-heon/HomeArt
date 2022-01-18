package com.homeart.controller.picShare;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.homeart.domain.picShare.picBoardVO;
import com.homeart.domain.picShare.picPageInfoVO;
import com.homeart.service.picShare.picBoardService;

import lombok.Setter;

@Controller
@RequestMapping("/picShare")
public class picBoardController {
	
	@Setter(onMethod_ = @Autowired)
	private picBoardService service;
	
	@GetMapping("/list")
	public void list(@RequestParam(value="page", defaultValue="1") Integer page, Model model) {
		
		// 한 페이지의 card 수
		Integer numberPerPage = 24;
		
		List<picBoardVO> list = service.getListPage(page, numberPerPage);
		picPageInfoVO picPageInfo = service.getPageInfo(page, numberPerPage);
		
		// 값이 잘 들어오는지 확인.
		for(picBoardVO lists : list) {
			System.out.println(lists);
		}
		System.out.println("");
		
		model.addAttribute("list", list);
		model.addAttribute("picPageInfo", picPageInfo);
		
		// views 다음 폴더부터 적어주면 됨
		// jsp:path : /WEB-INF/views/picShare/picShareBoard/list.jsp
	}
	
	// picBoard/get?id=몇인지 적어줘야 페이지 나타남. (페이지끼리 연결 필요)
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("id") Integer id, Model model) {

		picBoardVO board = service.get(id);
		
		model.addAttribute("board", board);
		
	}
	
	@PostMapping("/modify")
	public String modify(picBoardVO board) {
		
		service.modify(board);
		
		return "redirect:/picShare/list";
		
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(picBoardVO board, MultipartFile file) throws Exception {
		
		if (file != null) {
			System.out.println(file.getSize());
			System.out.println(file.getOriginalFilename());
			System.out.println(board.getWriter());
			System.out.println(board.getNickName());
		}
		
		board.setFile_name(file.getOriginalFilename());
		
		service.register(board, file);
		
		return "redirect:/picShare/list";
	}
	
	
	@PostMapping("/remove")
	public String remove(Integer id, MultipartFile file) {
		
		service.remove(id, file);
		
		return "redirect:/picShare/list";
	}
	
	
	
}
