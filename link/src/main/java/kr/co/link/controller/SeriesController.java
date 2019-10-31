package kr.co.link.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.link.dao.SeriesCartDao;
import kr.co.link.service.SeriesCartService;
import kr.co.link.service.SeriesCategoryService;
import kr.co.link.service.SeriesEpisodeService;
import kr.co.link.service.SeriesLikeService;
import kr.co.link.service.SeriesNoticeService;
import kr.co.link.service.SeriesOrderService;
import kr.co.link.service.SeriesReviewReputationService;
import kr.co.link.service.SeriesReviewService;
import kr.co.link.service.SeriesVodService;
import kr.co.link.service.UserService;
import kr.co.link.view.FileDownloadView;
import kr.co.link.vo.SeriesCart;
import kr.co.link.vo.SeriesCategory;
import kr.co.link.vo.SeriesEpisode;
import kr.co.link.vo.SeriesLike;
import kr.co.link.vo.SeriesNotice;
import kr.co.link.vo.SeriesOrder;
import kr.co.link.vo.SeriesPagination;
import kr.co.link.vo.SeriesReview;
import kr.co.link.vo.SeriesVod;
import kr.co.link.vo.User;

@Controller
@RequestMapping("/series")
public class SeriesController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private SeriesCartService seriesCartService;
	@Autowired
	private SeriesCategoryService seriesCategoryService;
	@Autowired
	private SeriesEpisodeService seriesEpisodeService;
	@Autowired
	private SeriesLikeService seriesLikeService;
	@Autowired
	private SeriesNoticeService seriesNoticeService;
	@Autowired
	private SeriesOrderService seriesOrderService;
	@Autowired
	private SeriesReviewReputationService seriesReviewReputationService;
	@Autowired
	private SeriesReviewService seriesReviewService;
	@Autowired
	private SeriesVodService seriesVodService;
	

	@RequestMapping("/home.do")
	public String home(Model model) {
		List<SeriesVod> likesVods = seriesVodService.getsomeLikesVods();
		model.addAttribute("likesVods", likesVods);
		
		List<SeriesVod> brandNewVods = seriesVodService.get4BrandNewVods();
		model.addAttribute("brandNewVods", brandNewVods);
		 
		List<Map<String, Object>> ranks = seriesVodService.get3DailyOrderVod();
		model.addAttribute("ranks", ranks);
		
		List<SeriesNotice> notices = seriesNoticeService.get3Notices();
		model.addAttribute("notices", notices);
		
		return "series/home";
	}
	
	@RequestMapping("/category.do")
	public String category(@RequestParam(value="cat", required = false, defaultValue = "0") int categoryNo,
			@RequestParam(value="ing", required = false, defaultValue = "Y") String ing,
			@RequestParam(value="sort", required = false, defaultValue = "date") String sort,
			Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category_no", categoryNo);
		map.put("ing", ing);
		map.put("sort", sort);
		List<SeriesVod> vods = seriesVodService.getVodsBycategory(map);
		model.addAttribute("length", vods.size());
		model.addAttribute("vods", vods);
		return "series/category";
	}
	
	@RequestMapping("/toprank.do")
	public String topRank(Model model) {
		List<Map<String, Object>> dailyVods = seriesVodService.getDailyOrderVod();
		List<Map<String, Object>> weeklyVods = seriesVodService.getWeeklyOrderVod();
		List<Map<String, Object>> monthlyVods = seriesVodService.getMonthlyOrderVod();
		
		model.addAttribute("dailyVods", dailyVods);
		model.addAttribute("weeklyVods", weeklyVods);
		model.addAttribute("monthlyVods", monthlyVods);
		
		return "series/toprank";
	}
	
	@RequestMapping("/detail.do")
	public String detail(@RequestParam(value = "vodno", required = true) int vodno, 
			HttpSession session,
			Model model) {
		
		SeriesVod seriesVod = seriesVodService.getVodByVodNo(vodno);
		SeriesCategory category = seriesCategoryService.getCategoryByVodNo(vodno);
		List<SeriesEpisode> episodes = seriesEpisodeService.getEpisodesByVodNo(vodno);
		int countEpisodes = seriesEpisodeService.getCountEpisodesByNo(vodno);
		
		int countLikes = seriesLikeService.getCountLikesByVodNo(vodno);
		
		SeriesLike like = new SeriesLike();
		SeriesVod vod = new SeriesVod();
		
		vod.setNo(vodno);
		User user = (User) session.getAttribute("LOGIN_USER");
		like.setVod(vod);
		like.setUser(user);
		int isAlreadyHearted = seriesLikeService.getCountUserLikes(like);
		
		model.addAttribute("isAlreadyHearted", isAlreadyHearted);
		
		
		int countReviews = seriesReviewService.getCountReviewsByVodNo(vodno);
		List<SeriesReview> reviews = seriesReviewService.getReviewsByVodNo(vodno);
		
		//int countrepuLike  = seriesReviewReputationService.getCountReputationLikes(no);
		//int countrepuDislike = seriesReviewReputationService.getCountReputationDislike(no);
		
		model.addAttribute("seriesVod", seriesVod);
		model.addAttribute("category", category);
		model.addAttribute("episodes", episodes);
		model.addAttribute("countEpisodes", countEpisodes);
		model.addAttribute("countLikes", countLikes);
		model.addAttribute("countReviews", countReviews);
		model.addAttribute("reviews", reviews);
		//model.addAttribute("countrepuLike", countrepuLike);
		//model.addAttribute("countrepuDislike", countrepuDislike);
		
		return "series/detail";
	}
	
	
	@RequestMapping("/likeedit.do")
	public @ResponseBody Integer likeedit(@RequestParam(value = "vodno", required = true) int vodno, 
			@RequestParam(value = "gubun", required = true) String gubun,
			HttpSession session) {
		SeriesLike like = new SeriesLike();
		SeriesVod vod = new SeriesVod();
		vod.setNo(vodno);
		
		User user = (User) session.getAttribute("LOGIN_USER");
		like.setVod(vod);
		like.setUser(user);
		if (gubun.equals("plus")) {
			seriesLikeService.addLike(like);
		} else if (gubun.equals("minus")) {
			seriesLikeService.deleteLike(like);
		}
		
		return seriesLikeService.getCountLikesByVodNo(vodno);
	}
	
	@RequestMapping("/addReview.do")
	public String addReview(@RequestParam(value = "vodno", required = true) int vodno, 
			@RequestParam(value = "contents", required = true) String contents,
			HttpSession session) {
		SeriesReview review = new SeriesReview();
		SeriesVod vod = new SeriesVod();
		vod.setNo(vodno);
		User user = (User) session.getAttribute("LOGIN_USER");
		review.setUser(user);
		review.setVod(vod);
		review.setContents(contents);
		
		seriesReviewService.addReview(review);
		return "redirect:detail.do?vodno=" + vodno;
	}

	@RequestMapping("/mypage/addcart.do")
	public @ResponseBody Map<String, String> addCart (@RequestParam("chk")int[] episodeNos, HttpSession session){
		
		User user = (User) session.getAttribute("LOGIN_USER");
		seriesCartService.addCart(episodeNos, user.getId());
		
		Map<String, String> map = new HashMap<String, String>();
		// map.put("result", "success");
		map.put("ririririri", "ghghghghgh");
		return map;
	}
	
	@RequestMapping("/mypage/like.do")
	public String like(HttpSession session, Model model) {
		User user = (User) session.getAttribute("LOGIN_USER");
		List<Map<String, Object>> maps = seriesLikeService.getLikesById(user.getId());
		model.addAttribute("maps", maps);
		return "series/mypage/like";
	}

	@RequestMapping("/mypage/cart.do") 
	public String cart(HttpSession session,
			Model model) {
		User user = (User) session.getAttribute("LOGIN_USER");
		List<Map<String, Object>> carts = seriesCartService.getCartsById(user.getId());
		model.addAttribute("carts", carts);
		return "series/mypage/cart";
	}
	
	@RequestMapping("/mypage/order.do")													// 여기 할 차례
	public String order(int[] chk, HttpSession session) {
		User user = (User) session.getAttribute("LOGIN_USER");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", user.getId());
		
		seriesOrderService.addOrder(map, chk, user.getId());
		/*
		 * int mypoint = user.getPoint(); int price = 0;
		 * 
		 * for (int i = 0; i < chk.length; i++) { SeriesEpisode episode =
		 * seriesEpisodeService.getEpisodeByNo(chk[i]); price = episode.getPrice();
		 * 
		 * map.put("eno", chk[i]); seriesOrderService.addOrder(map);
		 * 
		 * user.setPoint(user.getPoint() - price); userService.updateUser(user);
		 * 
		 * seriesCartService.deleteCartByEpisodeNo(chk[i]); };
		 * 
		 * 
		 */
		
		return "redirect:orderlist.do";
	}
	
	// 이하 완료
	@RequestMapping("/mypage/orderlist.do")
	public String orderList(HttpSession session, Model model) {
		User user = (User) session.getAttribute("LOGIN_USER");
		
		List<Map<String, Object>> orders = seriesOrderService.getOrdersById(user.getId());
		
		user = userService.getUserById(user.getId());
		session.setAttribute("LOGIN_USER", user);
		
		model.addAttribute("orders", orders);
		return "series/mypage/orderlist";
	}
	
	@RequestMapping("/mypage/down.do")
	public ModelAndView down(int eno, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		SeriesEpisode episode = seriesEpisodeService.getEpisodeByNo(eno);

		mav.addObject("directory", "C:\\Users\\tk2ek\\git\\link\\link\\src\\main\\webapp\\resources\\images\\series\\episodes");
		mav.addObject("filename", episode.getContents());
		
		mav.setView(new FileDownloadView());
		return mav;
	}
	
	@RequestMapping("/noticelist.do")
	public String noticeList(@RequestParam(value="page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			Model model) {
		Map<String, Object> param = new HashMap<String, Object>();
		if (!keyword.isEmpty()) {
			param.put("keyword", keyword);
		}
		
		int records = seriesNoticeService.getNoticeCount(param);
		SeriesPagination pagination = new SeriesPagination(page, 5, records);
		model.addAttribute("pagination", pagination);
		
		param.put("beginIndex", (page - 1)*5 + 1);
		param.put("endIndex", page*5);
		List<SeriesNotice> noticeList = seriesNoticeService.getNoticesbyparam(param);
		
		model.addAttribute("notices", noticeList);
		
		return "series/noticelist";
	}
	
	@RequestMapping("/noticedetail.do")
	public String noticeDetail(Model model, int no) {
		SeriesNotice notice = seriesNoticeService.getNotice(no);
		model.addAttribute("notice", notice);
		return "series/noticedetail";
	}
	
	@RequestMapping("/noticeform.do")
	public String noticeForm(HttpSession session, Model model) {
		User user = (User) session.getAttribute("LOGIN_USER");
		if (user.getId().equals("admin")) {
			return "series/noticeform";
		} else {
			return "redirect:noticelist.do";
		}
	}
	
	@RequestMapping("/addnotice.do")
	public String add(Model model, String title, String contents) {
		SeriesNotice notice = new SeriesNotice();
		notice.setTitle(title);
		notice.setContents(contents);
		seriesNoticeService.addNotice(notice);
		return "redirect:noticelist.do";
	}
	
	@RequestMapping("/series.do")
	public String series(Model model) {
		return "series/series";
	}
	
}
