package kr.co.link.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.link.service.JisikinService;
import kr.co.link.service.SearchService;
import kr.co.link.vo.BandHomeContent;
import kr.co.link.vo.BlogBoard;
import kr.co.link.vo.Jisikin;
import kr.co.link.vo.SearchWord;
import kr.co.link.vo.SeriesVod;
import kr.co.link.vo.Tv;

@Controller
public class SearchController {

	@Autowired
	private SearchService searchService;
	
	@RequestMapping("/search.do")
	public String search(@RequestParam(required = false, value="word", defaultValue = "")String word, Model model) {
		// 검색어 추가
		searchService.addSearchWord(word);
		
		// 검색어 존재시 카운트
		SearchWord countWord = new SearchWord();
		countWord.setName(word);
		searchService.addCountWord(countWord);
		
		// 연관 검색어
		List<String> words = searchService.autoComplete(word);
		model.addAttribute("words", words);
		
		// 인기 검색 순위
		List<String> popWords = searchService.getWordByCount();
		model.addAttribute("popWords",popWords);
		
		
		// 지식인 검색내용
		List<Map<String, Object>> resultJisikin = searchService.searchJisikin(word);
		List<Map<String, Object>> resultBlog = searchService.searchBlog(word);
		List<Map<String, Object>> resultBand = searchService.searchBand(word);
		List<Tv> resultTv = searchService.searchTv(word);
		List<SeriesVod> resultVod = searchService.searchVod(word);
		
		model.addAttribute("resultJisikin", resultJisikin);
		model.addAttribute("resultBlog", resultBlog);
		model.addAttribute("resultBand", resultBand);
		model.addAttribute("resultTv", resultTv);
		model.addAttribute("resultVod", resultVod);
		

		return "search/searchMain";
	}
	
	@RequestMapping("/autoComplete.do")
	public @ResponseBody List<String> autoComplete(String word){
		List<String> words = searchService.autoComplete(word);
		if (words.size() <= 10) {
			return words;
		}
		return words.subList(0, 10);
	}
}
