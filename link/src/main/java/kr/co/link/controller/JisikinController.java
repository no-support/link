package kr.co.link.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.link.form.JisikinForm;
import kr.co.link.service.JisikinAnswerService;
import kr.co.link.service.JisikinCategoryService;
import kr.co.link.service.JisikinService;
import kr.co.link.service.JisikinTagService;
import kr.co.link.service.UserService;
import kr.co.link.vo.Jisikin;
import kr.co.link.vo.JisikinAnswer;
import kr.co.link.vo.JisikinCategory;
import kr.co.link.vo.JisikinPagination;
import kr.co.link.vo.JisikinRank;
import kr.co.link.vo.JisikinTag;
import kr.co.link.vo.User;

@Controller
@RequestMapping("/jisikin")
public class JisikinController {

	@Autowired
	private JisikinCategoryService categoryService;
	
	@Autowired
	private JisikinService jisikinService;
	
	@Autowired
	private JisikinTagService tagService;
	
	@Autowired
	private JisikinAnswerService answerService;
	
	@Autowired
	private UserService userService;
	
	
	public void setMenu(Model model) {
		model.addAttribute("navMenu","jisikin");
	}
	// 지식인 메인
	@RequestMapping("/main.do")
	public String main(HttpSession session, @RequestParam(required = false, value = "sort", defaultValue = "1")int sort, 
					   @RequestParam(required = false, value = "categoryNo", defaultValue ="0")Integer categoryNo,
					   Model model) {
		setMenu(model);
		
		// 세션갱신
		if(session.getAttribute("LOGIN_USER") != null) {
			User user = (User) session.getAttribute("LOGIN_USER");
			session.setAttribute("LOGIN_USER", userService.getUserById(user.getId()));
		}
		
		// 카테고리별 정렬 답변리스트
		Map<String, Object> sortMap = new HashMap<String, Object>();
		if(categoryNo == 0) {
			categoryNo = null;
		}
		sortMap.put("sort", sort);
		sortMap.put("categoryNo", categoryNo);
		
		List<Jisikin> sortJisikin = jisikinService.getSortByCategory(sortMap);
		model.addAttribute("sortJisikin", sortJisikin);
		
		// 오늘의 질문, 답변, 누적 답변수
		int countToday = jisikinService.countTodayJisikin();
		int countTodayAnswer = jisikinService.countTodayAnswer();
		model.addAttribute("countToday", countToday);
		model.addAttribute("countTodayAnswer",countTodayAnswer);
		model.addAttribute("countAnswer",jisikinService.countAnswer());
		
		// 오늘의 랜덤질문 3개
		List<Jisikin> todayJisikin = jisikinService.todayJisikin3();
		model.addAttribute("todayJisikin", todayJisikin);
		
		// 조회순 질문리스트
		List<Jisikin> JisikinByView = jisikinService.getJisikinByView();
		model.addAttribute("JisikinByView", JisikinByView);
		
		// 인기 태그
		List<JisikinTag> toptag = tagService.getPopularTagTop10();
		model.addAttribute("toptag", toptag);
		
		// 오늘 성별 답변
		Map<String, Integer> map = jisikinService.getGenderToday();
		int male = map.get("male");
		int female = map.get("female");
		
		model.addAttribute("male", male);
		model.addAttribute("female", female);
		
		return "jisikin/jisikinMain";
	}
	
	// Q&A							값이 없어도되는      변수명과 값일치      required=false일때 기본값
	@RequestMapping("/qna.do")
	public String qna(@RequestParam(required = false, value = "categoryNo", defaultValue = "0")int categoryNo, 
					  @RequestParam(value="page", required = false, defaultValue = "1") int page,
					  Model model) {
		setMenu(model);
		
		// 페이징
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("categoryNo", categoryNo);
		
		int records = jisikinService.countJiskinBycategory(categoryNo);
		JisikinPagination pagination = new JisikinPagination(page, 10, records);
		model.addAttribute("pagination", pagination);
		
		map.put("beginIndex", (page - 1)*10 + 1);
		map.put("endIndex", page*10);
		
		List<Jisikin> allJisikin = jisikinService.pagingJiskinBycategory(map);
		model.addAttribute("allJisikin", allJisikin);

		// 상위 카테고리
		List<JisikinCategory> categoriesParent = categoryService.getParentCategory();
		model.addAttribute("categoriesParent", categoriesParent);
		
		// 인기 태그
		List<JisikinTag> toptag = tagService.getPopularTagTop10();
		model.addAttribute("toptag", toptag);
		
		// 오늘의 질문, 답변, 누적 답변수
		int countToday = jisikinService.countTodayJisikin();
		model.addAttribute("countToday", countToday);
		model.addAttribute("countTodayAnswer",jisikinService.countTodayAnswer());
		model.addAttribute("countAnswer",jisikinService.countAnswer());
		
		return "jisikin/jisikinQna";
	}
	
	
	// 질문 상세
	@RequestMapping(value= "/questionDetail.do", method = RequestMethod.GET)
	public String questionDetail(@RequestParam(value= "jisikinNo")int jisikinNo, Model model) {
		setMenu(model);
		Jisikin jisikin = jisikinService.getJisikinByNo(jisikinNo);
		
		User questionUser = userService.getUserById(jisikin.getUserId()); 
		model.addAttribute("questionUser", questionUser);
		
		// 조회수 증가
		jisikinService.updateJisikinViewCntByNo(jisikinNo);
		
		// 태그들 지식인에 담기
		List<JisikinTag> tags = tagService.getTagByJisikin(jisikinNo);
		jisikin.setTags(tags);
		
		model.addAttribute("jisikin", jisikin);
		
		
		// 답변 뿌리기
		List<JisikinAnswer> answers = answerService.getAnswersByJisikinNo(jisikinNo);
		
		for(JisikinAnswer a : answers) {
			User answerUser = userService.getUserById(a.getUserId()); 
			a.setUser(answerUser);
		}
		
		model.addAttribute("answers", answers);
		
		return "jisikin/jisikinQuestion";
	}
	
	@RequestMapping(value= "/questionDetail.do", method = RequestMethod.POST)
	public String questionDetail(JisikinAnswer jisikinAnswer, HttpSession session, Model model) {
		setMenu(model);
		JisikinAnswer answer = new JisikinAnswer();
		
		
		User user = (User) session.getAttribute("LOGIN_USER");
		BeanUtils.copyProperties(jisikinAnswer, answer);
		// 작성자 아이디 넣기
		answer.setUserId(user.getId());
		
		// 답변시 내공 10점 부여
		jisikinService.addMentalPoint(user, 10);
		
		System.out.println(answer.getUserId()+"이 답변을 등록하였습니다!");
		
		answerService.addAnswer(answer);
		
		return "redirect:/jisikin/questionDetail.do?jisikinNo="+jisikinAnswer.getJisikinNo()+"";
	}

	// 카테고리별 검색
	@RequestMapping(value="/byKeywordCategory.do")
	public @ResponseBody List<Jisikin> byKeywordCategory(HttpSession session, int categoryNo, String keyword){
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("no", categoryNo);
		map.put("keyword", keyword);
		
		return jisikinService.searchJisikinsByCategory(map);
	}
	
	// 질문폼
	@RequestMapping(value= "/questionform.do", method = RequestMethod.GET)
	public String form(Model model, HttpSession session) {
		setMenu(model);
		model.addAttribute("jisikinForm", new JisikinForm());
		List<JisikinCategory> categories = categoryService.getParentCategory();
		model.addAttribute("categories", categories);
		
		return "jisikin/jisikinQuestionForm";
	}
	
	
	// 질문폼 기입
	@RequestMapping(value= "/questionform.do", method = RequestMethod.POST)
	public String addform(JisikinForm jisikinForm, HttpSession session, Model model) {
		setMenu(model);
		User user = (User) session.getAttribute("LOGIN_USER");
		Jisikin jisikin = new Jisikin();
		// 폼객체를 지식인과 태그에 복사
		BeanUtils.copyProperties(jisikinForm, jisikin);
		
		// 카테고리 객체화 해서 담기
		JisikinCategory category = new JisikinCategory();
		category.setNo(jisikinForm.getCategoryNo());
		jisikin.setCategory(category);
		
		// 만들어질 지식인 번호
		int jisikinNo = jisikinService.getJisikinSeq();
		
		// 폼객체에 없는 지식인 필드 추가
		jisikin.setNo(jisikinNo);
		jisikin.setUserId(user.getId());
		jisikinService.addJisikin(jisikin);

		
		// 여러 태그들 추가하기
		List<String> tags = jisikinForm.getTags();
		for (String tagName : tags ) {
			JisikinTag tag = new JisikinTag();
			
			tag.setTagName(tagName);
			tag.setJisikinNo(jisikinNo);
			tagService.addTag(tag);
		}
		
		// 내공 처리
		int mentalp = (-jisikinForm.getMentalPoint());
		jisikinService.addMentalPoint(user, mentalp);
		
		return "redirect:/jisikin/questionDetail.do?jisikinNo="+jisikinNo+"";
	}
	
	// 자녀 카테고리 띄우기
	@RequestMapping("subCategory.do")
	public @ResponseBody List<JisikinCategory> subCategory(int parentNo){
		return categoryService.getSubCategoryByParent(parentNo);
	}
	
	
	// 답변하기 메뉴
	@RequestMapping("/answer.do")
	public String answer(@RequestParam(required = false, value = "categoryNo", defaultValue = "0")int categoryNo, 
						 @RequestParam(value="page", required = false, defaultValue = "1") int page,
						 Model model) {
		setMenu(model);
		
		// 페이징
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("categoryNo", categoryNo);
		
		int records = jisikinService.countJiskinBycategory(categoryNo);
		JisikinPagination pagination = new JisikinPagination(page, 3, records);
		model.addAttribute("pagination", pagination);
		
		map.put("beginIndex", (page - 1)*3 + 1);
		map.put("endIndex", page*3);
		
		List<Jisikin> allJisikin = jisikinService.pagingJiskinBycategory(map);
		model.addAttribute("allJisikin", allJisikin);
		
		// 인기 태그
		List<JisikinTag> toptag = tagService.getPopularTagTop10();
		model.addAttribute("toptag", toptag);
		
		// 오늘의 질문, 답변, 누적 답변수
		int countToday = jisikinService.countTodayJisikin();
		model.addAttribute("countToday", countToday);
		model.addAttribute("countTodayAnswer",jisikinService.countTodayAnswer());
		model.addAttribute("countAnswer",jisikinService.countAnswer());
		
		
		return "jisikin/jisikinAnswer";
	}
	

	// 프로필
	@RequestMapping("/profile.do")
	public String profile(String userId , Model model) {
		setMenu(model);
		List<JisikinAnswer> myAnswer = jisikinService.getMyAnswer(userId);
		List<Jisikin> myJisikin = jisikinService.getMyJisikin(userId);
		
		// 프로필
		User profileUser = userService.getUserById(userId);
		model.addAttribute("profileUser", profileUser);
		
		// 답변으로 질문정보 구하기
		List<Jisikin> myAnswerQuestion = new ArrayList<Jisikin>();
		for (JisikinAnswer a : myAnswer) {
			Jisikin j = jisikinService.getJisikinByNo(a.getJisikinNo());
			myAnswerQuestion.add(j);
		}
		
		model.addAttribute("myAnswerQuestion", myAnswerQuestion);
		model.addAttribute("myJisikin", myJisikin);
		model.addAttribute("myAnswer", myAnswer);
		
		Map<String, Object> result = jisikinService.getMyProfile(userId);
		
		// 프로필 수치
		// 채택률 계산
		Double countAllAnswer = Double.parseDouble(result.get("countAllAnswerById").toString());
		Double countSelectById = Double.parseDouble(result.get("countSelectById").toString());
		
		Double selectPercent = (countSelectById / countAllAnswer);
		
		
		model.addAttribute("countAllAnswerById", result.get("countAllAnswerById"));
		model.addAttribute("countSelectById", result.get("countSelectById"));
		model.addAttribute("selectPercent", selectPercent);
		model.addAttribute("rankMentalPointById", result.get("rankMentalPointById"));
		model.addAttribute("countAllJisikinById", result.get("countAllJisikinById"));
		model.addAttribute("countJisikinSelectById", result.get("countJisikinSelectById"));
		model.addAttribute("deadLineById", result.get("deadLineById"));
		model.addAttribute("recommendById", result.get("recommendById"));
		model.addAttribute("countHelpUserById", result.get("countHelpUserById"));
		model.addAttribute("firstAnswerById", result.get("firstAnswerById"));
		
		return "jisikin/jisikinProfile";
	}
	
	
	// 명예의 전당
	@RequestMapping("/rank.do")
	public String rank(Model model) {
		setMenu(model);
		// 인기 태그
		List<JisikinTag> toptag = tagService.getPopularTagTop10();
		model.addAttribute("toptag", toptag);
		
		// 채택왕
		List<JisikinRank> ranks = answerService.getRank();
		model.addAttribute("ranks", ranks);
		
		// 성지글
		List<Jisikin> bestJisikin = jisikinService.getJisikinByrecommend();
		model.addAttribute("bestJisikin", bestJisikin);
		
		return "jisikin/jisikinRank";
	}
	
	// 추천하기
	@RequestMapping("/addRecommend.do")
	public String addRecommend(@RequestParam(value= "jisikinNo")int jisikinNo, Model model) {
		setMenu(model);
		// 추천
		jisikinService.updateJisikinRecommendByNo(jisikinNo);
		
		// 추천시 질문자 내공 2점부여
		Jisikin recomJisikin = jisikinService.getJisikinByNo(jisikinNo);
		User recomUser = userService.getUserById(recomJisikin.getUserId());
		jisikinService.addMentalPoint(recomUser, 2);
		
		return "redirect:/jisikin/questionDetail.do?jisikinNo="+jisikinNo+"";
	}
	
	// 채택하기
	@RequestMapping("/selected.do")
	public String selected(@RequestParam(value="jno")int jno,
						   @RequestParam(value="ano")int ano) {
		jisikinService.updateDeadlineYn(jno);
		answerService.updateAnswerByNo(ano);
		
		return "redirect:/jisikin/questionDetail.do?jisikinNo="+jno+"";
	}
}
