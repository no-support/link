package kr.co.link.service;

import java.util.HashMap;
import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.link.vo.JisikinAnswer;
import kr.co.link.dao.JisikinDao;
import kr.co.link.dao.UserDao;
import kr.co.link.vo.Jisikin;
import kr.co.link.vo.JisikinTag;
import kr.co.link.vo.User;

@Service
public class JisikinServiceImpl implements JisikinService {

	@Autowired
	private JisikinDao jisikinDao;
	
	@Autowired
	private JisikinTagService tagService;
	
	@Autowired
	private UserDao userDao;
	
	// 전체or카테고리별 질문수
	@Override
	public int countJiskinBycategory(int categoryNo) {
		return jisikinDao.countJiskinBycategory(categoryNo);
	}
	
	// 페이징 글 리스트
	@Override
	public List<Jisikin> pagingJiskinBycategory(Map<String, Object> map){
		List<Jisikin> allJisikin = jisikinDao.pagingJiskinBycategory(map);
		
		// 태그들 각 지식인질문에 담기
		for (Jisikin j : allJisikin) {
			List<JisikinTag> tags = tagService.getTagByJisikin(j.getNo());
			j.setTags(tags);
		}
		
		return allJisikin;
	}
	
	@Override
	public int getJisikinSeq() {
		return jisikinDao.getJisikinSeq();
	}
	
	@Override
	public void addJisikin(Jisikin jisikin) {
		jisikinDao.addJisikin(jisikin);
	}
	
	
	@Override
	public int countTodayJisikin() {
		return jisikinDao.countTodayJisikin();
	}
	
	@Override
	public int countTodayAnswer() {
		return jisikinDao.countTodayAnswer();
	}
	
	@Override
	public int countAnswer() {
		return jisikinDao.countAnswer();
	}
	
	@Override
	public Jisikin getJisikinByNo(int jisikinNo) {
		return (Jisikin)jisikinDao.getJisikinByNo(jisikinNo);
	}
	
	//카테소리별 키워드 검색
	@Override
	public List<Jisikin> searchJisikinsByCategory(Map<String, Object> map) {
		List<Jisikin> allJisikin = jisikinDao.searchJisikinsByCategory(map);
		// 태그들 각 지식인질문에 담기
		for (Jisikin j : allJisikin) {
			List<JisikinTag> tags = tagService.getTagByJisikin(j.getNo());
			j.setTags(tags);
		}
		
		return allJisikin;
	}
	
	// 추천
	@Override
	public void updateJisikinRecommendByNo(int jisikinNo) {

		// 추천수 +1
		Jisikin jisikin = getJisikinByNo(jisikinNo);
		int recommend = jisikin.getRecommend();
		recommend = recommend + 1;
		jisikin.setRecommend(recommend);
		
		jisikinDao.updateJisikinByNo(jisikin);
	}
	
	// 조회
	public void updateJisikinViewCntByNo(int jisikinNo) {

		// 추천수 +1
		Jisikin jisikin = getJisikinByNo(jisikinNo);
		int viewCnt = jisikin.getViewCnt();
		viewCnt = viewCnt + 1;
		jisikin.setViewCnt(viewCnt);
		
		jisikinDao.updateJisikinByNo(jisikin);
	}
	
	// 마감
	@Override
	public void updateDeadlineYn(int jno) {
		Jisikin updateJisikin = jisikinDao.getJisikinByNo(jno);
		updateJisikin.setDeadLineYn("Y");
		jisikinDao.updateJisikinByNo(updateJisikin);
	}
	
	// 조회순 질문리스트
	public List<Jisikin> getJisikinByView(){
		return jisikinDao.getJisikinByView();
	}
	
	
	// 성지글
	@Override
	public List<Jisikin> getJisikinByrecommend() {
		return jisikinDao.getJisikinByrecommend();
	}
	
	// 나의 질문, 답변
	
	@Override
	public List<Jisikin> getMyJisikin(String userId){
		return jisikinDao.getMyJisikin(userId);
	}
	
	@Override
	public List<JisikinAnswer> getMyAnswer(String userId){
		return jisikinDao.getMyAnswer(userId);
	}
	
	@Override
	public Map<String, Object> getMyProfile(String userId) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("countAllAnswerById", jisikinDao.countAllAnswerById(userId));
		result.put("countSelectById", jisikinDao.countSelectById(userId));
		result.put("rankMentalPointById", jisikinDao.rankMentalPointById(userId));
		result.put("countAllJisikinById", jisikinDao.countAllJisikinById(userId));
		result.put("countJisikinSelectById", jisikinDao.countJisikinSelectById(userId));
		result.put("deadLineById", jisikinDao.deadLineById(userId));
		result.put("recommendById", jisikinDao.recommendById(userId));
		result.put("countHelpUserById", jisikinDao.countHelpUserById(userId));
		result.put("firstAnswerById", jisikinDao.firstAnswerById(userId));

		return result;
	}
	
	// 메인화면
	// 오늘의 질문
	@Override
	public List<Jisikin> todayJisikin3(){
		return jisikinDao.todayJisikin3();
	}
	
	// 오늘 성별 답변수
	@Override
	public Map<String, Integer> getGenderToday(){
		Map<String, Integer> map = new HashMap<String, Integer>();
		 map.put("female", jisikinDao.getFemaleToday());
		 map.put("male", jisikinDao.getMaleToday());
		
		 return map;
	}
	
	@Override
	// 카테고리별 정렬 답변리스트
	public List<Jisikin> getSortByCategory(Map<String, Object> map) {
		return jisikinDao.getSortByCategory(map);
	}
	
	
	
	// 내공 부여하기
	@Override
	public void addMentalPoint(User user, int point) {
		User pointUser = userDao.getUserById(user.getId());
		
		// 부여받은 내공점수 넣기
		int presentPoint = pointUser.getMentalPoint();
		presentPoint = (presentPoint+point);
		pointUser.setMentalPoint(presentPoint);
		
		userDao.updateUser(pointUser);
	}
}
