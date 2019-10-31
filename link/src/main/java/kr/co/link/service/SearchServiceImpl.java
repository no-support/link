package kr.co.link.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.link.dao.SearchDao;
import kr.co.link.vo.BandHomeContent;
import kr.co.link.vo.BlogBoard;
import kr.co.link.vo.Jisikin;
import kr.co.link.vo.SearchWord;
import kr.co.link.vo.SeriesVod;
import kr.co.link.vo.Tv;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SearchDao searchDao;
	
	// 검색어 데이터 추가
	@Override
	public void addSearchWord(String wordName) {
		
		// 검색어가 존재하지 않으면 검색어 데이터 추가
		SearchWord existYn = new SearchWord();
		existYn = searchDao.getWordByName(wordName);
		if(existYn == null) {
			searchDao.addSearchWord(wordName);
		}
	}
	
	// 검색어 카운트
	@Override
	public void addCountWord(SearchWord word) {
		
		// 검색어가 존재할 경우 검색어 데이터를 추가하지 않고, 카운트만 증가
		SearchWord existYn = new SearchWord();
		existYn = searchDao.getWordByName(word.getName());
		if(existYn.getName() != null) {
			existYn.setCount(existYn.getCount()+1);
			searchDao.addCountWord(existYn);
		}
	}
	
	// 자동완성검색
	@Override
	public List<String> autoComplete(String wordName) {
		return searchDao.autoComplete(wordName);
	}
	
	// 인기검색순위
	@Override
	public List<String> getWordByCount(){
		return searchDao.getWordByCount();
	}
	
	
	
	// 각 분야 검색
	// 지식인
	@Override
	public List<Map<String, Object>> searchJisikin(String word){
		return searchDao.searchJisikin(word);
	}
	
	// BLOG
	@Override
	public List<Map<String, Object>> searchBlog(String word){
		return searchDao.searchBlog(word);
	}
	
	// BAND
	@Override
	public List<Map<String, Object>> searchBand(String word){
		return searchDao.searchBand(word);
	}
	
	// VOD
	@Override
	public List<SeriesVod> searchVod(String word){
		return searchDao.searchVod(word);
	}
	
	// TV
	@Override
	public List<Tv> searchTv(String word){
		return searchDao.searchTv(word);
	}
}
