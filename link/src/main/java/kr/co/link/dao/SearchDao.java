package kr.co.link.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.co.link.vo.BandHomeContent;
import kr.co.link.vo.BlogBoard;
import kr.co.link.vo.Jisikin;
import kr.co.link.vo.SearchWord;
import kr.co.link.vo.SeriesVod;
import kr.co.link.vo.Tv;

@Repository
public interface SearchDao {
	// 검색어데이터 추가
	public void addSearchWord(String wordName);
	
	// 검색어 카운트
	public void addCountWord(SearchWord word);
	
	// 검색어 존재여부
	public SearchWord getWordByName(String wordName);
	
	// 자동완성검색
	public List<String> autoComplete(String wordName);
	
	// 인기검색순위
	public List<String> getWordByCount();
	
	
	// 각 분야 검색
	// 지식인
	public List<Map<String, Object>> searchJisikin(String word);
	
	// BLOG
	public List<Map<String, Object>> searchBlog(String word);
	
	// BAND
	public List<Map<String, Object>> searchBand(String word);
	
	// VOD
	public List<SeriesVod> searchVod(String word);
	
	// TV
	public List<Tv> searchTv(String word);
	
}