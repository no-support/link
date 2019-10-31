package kr.co.link.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.link.service.SearchService;

@Controller
public class HomeController {
	
	@Autowired
	private SearchService searchService;
	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Model model) {
		// 인기 검색 순위
		List<String> popWords = searchService.getWordByCount();
		model.addAttribute("popWords",popWords);
		
		
		return "home";
	}  
	
}