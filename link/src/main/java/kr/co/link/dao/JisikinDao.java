package kr.co.link.dao;

import java.util.List;

import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.co.link.vo.Jisikin;
import kr.co.link.vo.JisikinAnswer;

@Repository
public interface JisikinDao {

	public void addJisikin(Jisikin jisikin);
	public int getJisikinSeq();
	
	// 전체or카테고리별 질문수
	public int countJiskinBycategory(int categoryNo);
	
	// 페이징 글 리스트
	public List<Jisikin> pagingJiskinBycategory(Map<String, Object> map);
	
	// 오늘의 질문과 답변
	public int countTodayJisikin();
	public int countTodayAnswer();
	// 누적답변수
	public int countAnswer();

	public Jisikin getJisikinByNo(int jisikinNo);
	
	//카테소리별 키워드 검색
	public List<Jisikin> searchJisikinsByCategory(Map<String, Object> map);
	
	// 추천, 조회, 마감
	public void updateJisikinByNo(Jisikin jisikin);
	
	// 조회순 질문리스트
	public List<Jisikin> getJisikinByView();
	
	// 성지글
	public List<Jisikin> getJisikinByrecommend();
	
	// 나의 질문, 답변
	public List<Jisikin> getMyJisikin(String userId);
	public List<JisikinAnswer> getMyAnswer(String userId);
	
	
	// 프로필에 들어갈 수치들
	
	// 전체답변
	public int countAllAnswerById(String userId);
	// 채택답변
	public int countSelectById(String userId);
	// 내공순위
	public int rankMentalPointById(String userId);
	// 전체질문
	public int countAllJisikinById(String userId);
	// 답변받은 질문
	public int countJisikinSelectById(String userId);
	// 전체 마감률
	public Double deadLineById(String userId);
	// 받은 추천수
	public int recommendById(String userId);
	// 도움받은 사람 수
	public int countHelpUserById(String userId);
	// 최초답변일
	public String firstAnswerById(String userId);
	
	
	// 메인화면
	// 오늘의 질문
	public List<Jisikin> todayJisikin3();
	
	// 오늘 남성 답변수
	public int getMaleToday();
	// 오늘 여성 답변수
	public int getFemaleToday();
	
	// 카테고리별 정렬 답변리스트
	public List<Jisikin> getSortByCategory(Map<String, Object> map);
}