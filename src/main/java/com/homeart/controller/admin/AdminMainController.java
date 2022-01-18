package com.homeart.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/adminPage")
@RequiredArgsConstructor
@Log4j
public class AdminMainController {
	
	@GetMapping("/AdminMain")
	public void main() {
		log.info("main page.....");
	}

}
