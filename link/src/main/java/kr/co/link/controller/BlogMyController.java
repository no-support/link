package kr.co.link.controller;

import java.awt.Color;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import kr.co.link.service.BlogBoardService;
import kr.co.link.service.BlogCategoryService;
import kr.co.link.service.BlogNeighborService;
import kr.co.link.service.BlogService;
import kr.co.link.service.BlogSubCategoryService;
import kr.co.link.service.UserService;
import kr.co.link.vo.Blog;
import kr.co.link.vo.BlogBoard;
import kr.co.link.vo.BlogCategory;
import kr.co.link.vo.BlogSubCategory;
import kr.co.link.vo.User;

@Controller
@RequestMapping("/blog")
public class BlogMyController {
	@Autowired
	private BlogService blogService;
	@Autowired
	private BlogSubCategoryService blogSubCategoryService;
	@Autowired
	private BlogCategoryService blogCategoryService;
	@Autowired
	private BlogBoardService blogBoardService;
	@Autowired
	private UserService userService;
	@Autowired
	private BlogNeighborService blogNeighborService;

	public List<BlogSubCategory> getBlogSubCategories(HttpSession session, Integer blogNo, Model model, Integer categoryNo, Integer pno,
			Integer pno10) {
		Blog blog = blogService.getBlogByBlogNo(blogNo);
		String blogColor = blog.getBackgroundColor();
		Color color = Color.decode(blogColor);
		String r = Integer.toString(color.getRed());
		String g = Integer.toString(color.getGreen());
		String b = Integer.toString(color.getBlue());
		String rgb = r + "," + g + "," + b;
		blog.setBackgroundColor(rgb);
		// 블로그 주인 아이디
		String userId = blog.getUserId();
		// 블로그 주인 유저 찾기
		User user = userService.getUserById(userId);
		User loginUser = (User) session.getAttribute("LOGIN_USER");
		int blogCount = blogBoardService.countBoardsByCategoryId(categoryNo);
		model.addAttribute("blogCount", blogCount);

		List<BlogSubCategory> blogSubCategories = blogSubCategoryService.getBlogSubCategoriesByuserId(userId);
		model.addAttribute("user", user);

		model.addAttribute("blog", blog);
		if (categoryNo == null) {
			BlogSubCategory blogSubCategory = blogSubCategoryService.getOneSubCategoryByBlogNo(blogNo);
			int subCatNo = blogSubCategory.getNo();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("subCatNo", subCatNo);
			map.put("blogNo", blogNo);
			BlogCategory blogCategory = blogCategoryService.getOneCategoryByOrder(map);

			// 페이지네이션 시작
			Map<String, Object> rangeMap = new HashMap<String, Object>();
			int howMany = 5;
			int begin = (pno - 1) * howMany + 1;
			int end = pno * howMany;
			rangeMap.put("begin", begin);
			rangeMap.put("end", end);
			rangeMap.put("categoryNo", blogCategory.getNo());
			List<BlogBoard> blogboards = blogBoardService.getBoardsByRange(rangeMap);

			int totalCount = blogBoardService.getBoardsCountByCategoryNo(blogCategory.getNo());
			totalCount = (int) Math.ceil((double) totalCount / howMany);

			model.addAttribute("blogboardsByRange", blogboards);
			model.addAttribute("pno", pno);
			model.addAttribute("totalCount", totalCount);
			
			// 12개 시작
			howMany = 12;
			begin = (pno10 - 1) * howMany + 1;
			end = pno10 * howMany;
			rangeMap.put("begin", begin);
			rangeMap.put("end", end);
			rangeMap.put("categoryNo", blogCategory.getNo());
			List<BlogBoard> blogboards10 = blogBoardService.getBoardsByRange(rangeMap);
			for(BlogBoard blogBoard : blogboards10) {
				int commentsCount = blogBoardService.getCommentsCountByBoardNo(blogBoard.getNo());
				blogBoard.setCommentsCount(commentsCount);
			}
			totalCount = blogBoardService.getBoardsCountByCategoryNo(blogCategory.getNo());
			totalCount = (int) Math.ceil((double) totalCount / howMany);

			model.addAttribute("blogboardsByRange10", blogboards10);
			model.addAttribute("pno10", pno10);
			model.addAttribute("totalCount10", totalCount);
			// 페이지네이션 끝
		} else {
			BlogCategory blogCategory = blogCategoryService.getCategoryByCategoryNo(categoryNo);
			model.addAttribute("category", blogCategory);
			List<BlogBoard> blogBoards = blogBoardService.getBoardByCategory(blogCategory.getNo());
			model.addAttribute("blogBoards", blogBoards);
			// 페이지네이션 시작
			Map<String, Object> rangeMap = new HashMap<String, Object>();
			int howMany = 5;
			int begin = (pno - 1) * howMany + 1;
			int end = pno * howMany;
			rangeMap.put("begin", begin);
			rangeMap.put("end", end);
			rangeMap.put("categoryNo", categoryNo);
			List<BlogBoard> blogboards = blogBoardService.getBoardsByRange(rangeMap);

			int totalCount = blogBoardService.getBoardsCountByCategoryNo(categoryNo);
			totalCount = (int) Math.ceil((double) totalCount / howMany);

			model.addAttribute("blogboardsByRange", blogboards);
			model.addAttribute("pno", pno);
			model.addAttribute("totalCount", totalCount);

			// 12개 시작
			howMany = 12;
			begin = (pno10 - 1) * howMany + 1;
			end = pno10 * howMany;
			rangeMap.put("begin", begin);
			rangeMap.put("end", end);
			rangeMap.put("categoryNo", blogCategory.getNo());
			List<BlogBoard> blogboards10 = blogBoardService.getBoardsByRange(rangeMap);
			for(BlogBoard blogBoard : blogboards10) {
				int commentsCount = blogBoardService.getCommentsCountByBoardNo(blogBoard.getNo());
				blogBoard.setCommentsCount(commentsCount);
			}
			totalCount = blogBoardService.getBoardsCountByCategoryNo(blogCategory.getNo());
			totalCount = (int) Math.ceil((double) totalCount / howMany);

			model.addAttribute("blogboardsByRange10", blogboards10);
			model.addAttribute("pno10", pno10);
			model.addAttribute("totalCount10", totalCount);
			// 페이지네이션 끝
		}
		if (blog.getUserId().equals(loginUser.getId())) {
			model.addAttribute("isMyBlog", "mine");
		} else {
			model.addAttribute("isMyBlog", "others");
		}
		return blogSubCategories;
	}

	@RequestMapping("/mydetail.do")
	public String detail(Model model, HttpSession session, @RequestParam(value = "pno", required = false, defaultValue = "1") Integer pno,
			@RequestParam(value = "pno10", required = false, defaultValue = "1") Integer pno10) {
		User user = (User) session.getAttribute("LOGIN_USER");
		Blog blog = blogService.getBlogByUserId(user.getId());
		
		// 이웃 블로그수 전해주기
		int neighborCounts = blogNeighborService.getNeighborCountsByBlogNo(blog.getNo());
		model.addAttribute("neighborCounts", neighborCounts);
		// 끝

		BlogSubCategory blogSubCategory = blogSubCategoryService.getOneSubCategoryByBlogNo(blog.getNo());
		int subCatNo = blogSubCategory.getNo();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("subCatNo", subCatNo);
		map.put("blogNo", blog.getNo());
		BlogCategory blogCategory = blogCategoryService.getOneCategoryByOrder(map);

		Integer categoryNo = blogCategory.getNo();

		Integer blogNo = blog.getNo();
		List<BlogSubCategory> blogSubCategories = getBlogSubCategories(session, blogNo, model, categoryNo, pno, pno10);
		model.addAttribute("subCategories", blogSubCategories);
		if (blog.getLayout() == 1) {
			return "blog/detail/detail";
		}
		if (blog.getLayout() == 2) {
			return "blog/detail/detail2";
		}
		if (blog.getLayout() == 3) {
			return "blog/detail/detail3";
		} else {
			return "blog/detail/detail4";
		}
	}

	@RequestMapping("/mydetail2.do")
	public String detail2(Model model, HttpSession session, @RequestParam(value = "pno", required = false, defaultValue = "1") Integer pno,
			@RequestParam(value = "pno10", required = false, defaultValue = "1") Integer pno10) {
		User user = (User) session.getAttribute("LOGIN_USER");
		Blog blog = blogService.getBlogByUserId(user.getId());
		// 이웃 블로그수 전해주기
		int neighborCounts = blogNeighborService.getNeighborCountsByBlogNo(blog.getNo());
		model.addAttribute("neighborCounts", neighborCounts);
		// 끝
		BlogSubCategory blogSubCategory = blogSubCategoryService.getOneSubCategoryByBlogNo(blog.getNo());
		int subCatNo = blogSubCategory.getNo();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("subCatNo", subCatNo);
		map.put("blogNo", blog.getNo());
		BlogCategory blogCategory = blogCategoryService.getOneCategoryByOrder(map);
		Integer blogNo = blog.getNo();
		Integer categoryNo = blogCategory.getNo();
		List<BlogSubCategory> blogSubCategories = getBlogSubCategories(session, blogNo, model, categoryNo, pno, pno10);
		model.addAttribute("subCategories", blogSubCategories);
		return "blog/detail/detail2";
	}

	@RequestMapping("/layoutDetail.do")
	public String layoutDetail1(Model model, HttpSession session, Integer layOutNo,
			@RequestParam(value = "pno", required = false, defaultValue = "1") Integer pno,
			@RequestParam(value = "pno10", required = false, defaultValue = "1") Integer pno10) {
		User user = (User) session.getAttribute("LOGIN_USER");
		Blog blog = blogService.getBlogByUserId(user.getId());
		BlogSubCategory blogSubCategory = blogSubCategoryService.getOneSubCategoryByBlogNo(blog.getNo());
		int subCatNo = blogSubCategory.getNo();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("subCatNo", subCatNo);
		map.put("blogNo", blog.getNo());
		BlogCategory blogCategory = blogCategoryService.getOneCategoryByOrder(map);
		Integer blogNo = blog.getNo();
		Integer categoryNo = blogCategory.getNo();
		List<BlogSubCategory> blogSubCategories = getBlogSubCategories(session, blogNo, model, categoryNo, pno, pno10);
		model.addAttribute("subCategories", blogSubCategories);
		// 이웃 블로그수 전해주기
		int neighborCounts = blogNeighborService.getNeighborCountsByBlogNo(blog.getNo());
		model.addAttribute("neighborCounts", neighborCounts);
		// 끝
		// 레이아웃 초기 화면 미리보기 설정
		if (session.getAttribute("firstCol") == null) {
			session.setAttribute("firstCol", blog.getFirstCol());
		}

		if (session.getAttribute("secondCol") == null) {
			session.setAttribute("secondCol", blog.getSecondCol());
		}

		if (session.getAttribute("thirdCol") == null) {
			session.setAttribute("thirdCol", blog.getThirdCol());
		}
//		레이아웃 초기 화면 미리보기 설정 끝

		String firstCol = (String) session.getAttribute("firstCol");
		String secondCol = (String) session.getAttribute("secondCol");
		String thirdCol = (String) session.getAttribute("thirdCol");

		model.addAttribute("firstCol", firstCol);
		model.addAttribute("secondCol", secondCol);
		model.addAttribute("thirdCol", thirdCol);

		session.removeAttribute("firstCol");
		session.removeAttribute("secondCol");
		session.removeAttribute("thirdCol");

		if (layOutNo == 1) {
			model.addAttribute("layout", 1);
			return "blog/beautify/layoutDetail";
		}
		if (layOutNo == 2) {
			model.addAttribute("layout", 2);
			return "blog/beautify/layoutDetail2";
		}
		if (layOutNo == 3) {
			model.addAttribute("layout", 3);
			return "blog/beautify/layoutDetail3";
		} else {
			model.addAttribute("layout", 4);
			return "blog/beautify/layoutDetail4";
		}

	}

	@RequestMapping("/colordetail.do")
	public String colordetail1(Model model, HttpSession session,
			@RequestParam(value = "pno", required = false, defaultValue = "1") Integer pno,
			@RequestParam(value = "pno10", required = false, defaultValue = "1") Integer pno10) {
		User user = (User) session.getAttribute("LOGIN_USER");
		Blog blog = blogService.getBlogByUserId(user.getId());
		// 이웃 블로그수 전해주기
		int neighborCounts = blogNeighborService.getNeighborCountsByBlogNo(blog.getNo());
		model.addAttribute("neighborCounts", neighborCounts);
		// 끝
		Integer blogNo = blog.getNo();
		BlogSubCategory blogSubCategory = blogSubCategoryService.getOneSubCategoryByBlogNo(blogNo);
		int subCatNo = blogSubCategory.getNo();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("subCatNo", subCatNo);
		map.put("blogNo", blogNo);
		BlogCategory blogCategory = blogCategoryService.getOneCategoryByOrder(map);
		Integer categoryNo = blogCategory.getNo();
		List<BlogSubCategory> blogSubCategories = getBlogSubCategories(session, blogNo, model, categoryNo, pno, pno10);

		model.addAttribute("subCategories", blogSubCategories);
		if (blog.getLayout() == 1) {
			return "blog/beautify/colordetail1";
		}
		if (blog.getLayout() == 2) {
			return "blog/beautify/colordetail2";
		}
		if (blog.getLayout() == 3) {
			return "blog/beautify/colordetail3";
		} else {
			return "blog/beautify/colordetail4";
		}
	}

	@RequestMapping(value = "/mywrite.do", method = RequestMethod.GET)
	public String writePage(Model model, HttpSession session,
			@RequestParam(value = "pno", required = false, defaultValue = "1") Integer pno,
			@RequestParam(value = "pno10", required = false, defaultValue = "1") Integer pno10) {
		User user = (User) session.getAttribute("LOGIN_USER");
		Blog blog = blogService.getBlogByUserId(user.getId());
		// 이웃 블로그수 전해주기
		int neighborCounts = blogNeighborService.getNeighborCountsByBlogNo(blog.getNo());
		model.addAttribute("neighborCounts", neighborCounts);
		// 끝
		Integer blogNo = blog.getNo();
		BlogSubCategory blogSubCategory = blogSubCategoryService.getOneSubCategoryByBlogNo(blogNo);
		int subCatNo = blogSubCategory.getNo();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("subCatNo", subCatNo);
		map.put("blogNo", blogNo);
		BlogCategory blogCategory = blogCategoryService.getOneCategoryByOrder(map);
		Integer categoryNo = blogCategory.getNo();
		List<BlogSubCategory> blogSubCategories = getBlogSubCategories(session, blogNo, model, categoryNo, pno, pno10);
		model.addAttribute("subCategories", blogSubCategories);
		
		if (blog.getLayout() == 1) {
			return "blog/detail/write";
		}
		if (blog.getLayout() == 2) {
			return "blog/detail/write2";
		}
		if (blog.getLayout() == 3) {
			return "blog/detail/write3";
		} else {
			return "blog/detail/write4";
		}
	}
}