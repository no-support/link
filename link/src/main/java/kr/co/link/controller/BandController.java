package kr.co.link.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.CustomEditorConfigurer;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.link.service.BandService;
import kr.co.link.vo.Band;
import kr.co.link.vo.BandHistory;
import kr.co.link.vo.BandHomeContent;
import kr.co.link.vo.BandJoin;
import kr.co.link.vo.BandLogoImg;
import kr.co.link.vo.BandNbbang;
import kr.co.link.vo.BandTodo;
import kr.co.link.vo.User;
import kr.co.link.vo.BandVote;
import kr.co.link.vo.BandWritePhoto;

@Controller
@RequestMapping("/band")
public class BandController {

	@Autowired
	private BandService bandService;

	// 밴드 리스트, 메인
	@RequestMapping("/main.do")
	public String main(Model model, HttpSession session) {
		User user = (User) session.getAttribute("LOGIN_USER");
		boolean loginYn = true;

		if (user == null) {
			loginYn = false;
			model.addAttribute("loginYn", loginYn);
			return "band/bandMain";
		}

		List<Band> band = bandService.bandJoinList(user.getId());
		List<Band> notJoinbands = bandService.getNotJoinBandByUserId(user.getId());

		model.addAttribute("bands", band);
		model.addAttribute("loginYn", loginYn);
		model.addAttribute("notJoinBands", notJoinbands);
		return "band/bandMain";
	}

	// 밴드 추가 페이지
	@RequestMapping(value = "/addBand.do", method = RequestMethod.GET)
	public String addBand(Model model, @RequestParam(value = "begin", required = false, defaultValue = "1") int begin,
			@RequestParam(value = "end", required = false, defaultValue = "8") int end) {

		List<BandLogoImg> logoimgs = bandService.getAllLogoImg(begin, end);
		model.addAttribute("logoImgs", logoimgs);
		return "band/bandAdd";
	}

	// 밴드 추가 기능
	@RequestMapping(value = "/addBand.do", method = RequestMethod.POST)
	public String addBand(Band band, HttpSession session) {
		User user = (User) session.getAttribute("LOGIN_USER");
		band.setUser(user);
		
		bandService.addBand(band);

		return "redirect:main.do";
	}

	// 밴드추가 이미지 변경
	@RequestMapping(value = "/changeLogo.do", method = RequestMethod.GET)
	@ResponseBody
	public List<BandLogoImg> changeLogo(int begin, int end) {
		List<BandLogoImg> logoimgs = bandService.getAllLogoImg(begin, end);
		return logoimgs;
	}

	// 밴드 추가에서 중복확인
	@RequestMapping(value = "/overlapName.do", method = RequestMethod.GET)
	@ResponseBody
	public String overlapName(String bandName) {

		if (bandService.getBandByName(bandName) != null) {
			return "Y";
		} else {
			return "N";
		}

	}

	// 밴드 홈페이지 정보불러오기
	@RequestMapping("/bandhome.do")
	public String bandHome(int bandNo, Model model, HttpSession session) {
		User user = (User) session.getAttribute("LOGIN_USER");
		Band band = bandService.getBandByNo(bandNo);
		model.addAttribute("bandInfo", band);
		
		if(user == null) {
			return "band/bandHome";
		} else {
			String joinYn = bandService.getJoinYn(user.getId(), bandNo);
			model.addAttribute("joinYn", joinYn);
			return "band/bandHome";
		}
	}

	// 밴드 홈페이지 center 메인 컨텐츠
	@RequestMapping("/bandHomeMainContents.do")
	public String bandHomeMainContents(HttpSession session, Model model, int bandNo) {
		
		List<BandHomeContent> writes = bandService.getBandHomeWriteByBandNo(bandNo);
		model.addAttribute("writes", writes);
		
		return "band/bandHome-mainText";
	}
	
	// 밴드 메인 홈페이지 멤버정보 가져오기
	@RequestMapping(value="/bandNbbMember.do", method = RequestMethod.GET)
	@ResponseBody
	public List<User> bandNbbMember(int bandNo){
		
		List<User> nbbMember = bandService.getJoinMembers(bandNo);
		
		 return nbbMember; 
	}
	
	// 밴드 엔빵 회원 이름으로 검색
	@RequestMapping(value="/bandNbbNameSearch.do", method = RequestMethod.GET)
	@ResponseBody
	public List<User> bandNbbNameSearch(int bandNo, String userName){
		List<User> nbbMember = bandService.getJoinMemberByNameAndBandNo(userName, bandNo);
		return nbbMember;
	} 
	
	// 밴드 홈에서 엔빵 추가하기
	@RequestMapping(value="/bandAddNbbang.do", method=RequestMethod.GET)
	@ResponseBody
	public int bandAddNbbang(int writeNo) {
		int bandSeq = bandService.addNbbangStart(writeNo);
		return bandSeq;
	}
	
	// 삭제버튼 클릭시 엔빵 삭제
	@RequestMapping(value="/bandDelNbbangStart.do", method=RequestMethod.GET)
	@ResponseBody
	public void bandDelNbbangStart(int nbbSeq) {
		bandService.bandWriteDelOnlyNbbang(nbbSeq);
	}
	
	// 밴드 엔빵 items 추가하기
	@RequestMapping(value="/bandAddNbbItemsStart.do", method = RequestMethod.GET)
	@ResponseBody
	public BandNbbang bandAddNbbItemsStart(BandNbbang nbbang) {
		return bandService.addNbbangItemsStart(nbbang);
	}
	
	// 밴드 엔빵 업데이트로 인한 등록
	@RequestMapping(value="/bandWriteUpdateStart.do", method = RequestMethod.GET)
	@ResponseBody
	public BandNbbang bandWriteUpdateStart(int nbbNo, int price) {
		return bandService.addUpdateNbbang(nbbNo, price);
	}

	// 밴드 홈페이지 center 사진첩
	@RequestMapping("/bandHomePhoto.do")
	public String bandHomePhoto() {
		return "band/bandHome-photo";
	}

	// 밴드 홈페이지 center 사진첩
	@RequestMapping("/bandHomeMember.do")
	public String bandHomeMember() {
		return "band/bandHome-member";
	}
	
	// 밴드 글등록
	@RequestMapping(value="/bandHomeContentAdd.do", method = RequestMethod.POST)
	public String bandHomeContentAdd(HttpSession session, Integer bandNo, String noticeYn, Integer rowNum, String contentType  ) {
		Map<String, Object> bandMap = new HashMap<String, Object>();
		
		User user = (User) session.getAttribute("LOGIN_USER");
		
		
		return "redirect:bandhome.do";
	}
	
	// 밴드 글등록에서 투표 작성
	@RequestMapping(value="/bandAddVote.do", method = RequestMethod.POST)
	@ResponseBody
	public BandVote bandAddVote(BandVote vote) {
		BandVote banvote = bandService.addVoteStart(vote);
		
		return banvote;
	}
	
	// 밴드 write 등록
	@RequestMapping(value="/bandContentAdd.do", method = RequestMethod.GET)
	@ResponseBody
	public int bandContentAdd(int bandNo, HttpSession session) {
		BandHomeContent write = new BandHomeContent();
		User user = (User) session.getAttribute("LOGIN_USER");
		write.setUser(user);
		write.setBandNo(bandNo);
		int writeNum = bandService.addWrite(write);
		return writeNum;
	}
	
	// 밴드 글쓰기 취소시 삭제
	@RequestMapping(value="/bandCancelDel.do", method= RequestMethod.GET)
	@ResponseBody
	public void bandCancelDel(int bandNo) {
		bandService.delWriteCancel(bandNo);
	}
	
	// 밴드 글쓰기에서 투표삭제
	@RequestMapping(value="/bandWriteDelVote", method = RequestMethod.GET)
	@ResponseBody
	public void bandWriteDelVote(int voteNo) {
		bandService.bandWriteDelVote(voteNo);
	}
	
	// 밴드 글등록에서 Todo 등록
	@RequestMapping(value="/bandAddTodo.do", method = RequestMethod.POST)
	@ResponseBody
	public BandTodo bandAddTodo(BandTodo bandTodo) {
		
		BandTodo todo = bandService.addTodoStart(bandTodo);
		
		return todo;
	}
	
	// 밴드 글쓰기에서 Todo삭제 버튼 클릭
	@RequestMapping(value="/bandWriteDelTodo.do", method = RequestMethod.GET)
	@ResponseBody
	public void bandWriteDelTodo(int todoNo) {
		bandService.bandWriteDelTodo(todoNo);
	}
	
	// 밴드 글등록에서 join 등록
	@RequestMapping(value="/bandAddJoin.do", method = RequestMethod.POST)
	@ResponseBody
	public BandJoin bandAddJoin(BandJoin bandJoin) {
		
		BandJoin join = bandService.addJoinStart(bandJoin);
		
		return join;
	}
	
	// 밴드 글쓰기에서 join삭제 버튼 클릭
	@RequestMapping(value="/bandWriteDelJoin.do", method = RequestMethod.GET)
	@ResponseBody
	public void bandWriteDelJoin(int joinNo) {
		bandService.bandWriteDelJoin(joinNo);
	}
	
	// 밴드 글쓰기 완료 버튼시 진짜 저장
	@RequestMapping(value="/addBandHomeWrite.do", method = RequestMethod.POST)
	public String addBandHomeWrite(BandHomeContent bandHomeContent) {
		bandService.updateBandHomeWriteByWriteNoToStart(bandHomeContent);
		
		Document doc = Jsoup.parse(bandHomeContent.getContents());
		
		Elements imgElements = doc.select("img");
		for (Element element : imgElements) {
			String path = element.attr("src");
			String filename = path.substring(path.lastIndexOf("/") + 1);
			bandService.addBandWritePhoto(bandHomeContent.getWriteNo(), filename, bandHomeContent.getBandNo());
		}
		
		BandHomeContent homeContent = bandService.getBandHomeWriteByWriteNo(bandHomeContent.getWriteNo());
		
		return "redirect:bandhome.do?bandNo="+homeContent.getBandNo();
	}
	
	// 밴드 가입하기
	@RequestMapping(value="/bandJoin.do", method=RequestMethod.POST)
	public String bandJoin(int bandNo, HttpSession session) {
		User user = (User) session.getAttribute("LOGIN_USER");
		
		bandService.bandJoin(bandNo, user.getId());
		return "redirect:bandhome.do?bandNo="+bandNo;
	}
	
	// 밴드 글쓰기에서 nbbang삭제 버튼 클릭
	@RequestMapping(value="/bandWriteDelNbbang.do", method = RequestMethod.GET)
	@ResponseBody
	public void bandWriteDelNbb(int nbbNo) {
		bandService.bandWriteDelNbbang(nbbNo);
	}
	
	// 데이터 실제 보기
	@RequestMapping(value="/bandContentDetailView.do", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> bandContentDetailView(String type, int no) {
		return bandService.bandContentDetailView(type, no);
	}
	
	// 밴드 사진첩 사진 가져오기
	@RequestMapping(value="/bandWriteContentPhoto.do", method=RequestMethod.GET)
	@ResponseBody
	public List<BandWritePhoto> bandWriteContentPhoto (int bandNo) {
		return bandService.getbandWritePhotoByBandNo(bandNo);
	}

	// 데이터 포맷팅
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}
	
}