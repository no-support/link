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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.link.service.BlogBoardService;
import kr.co.link.service.BlogCategoryService;
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
public class BlogCategoryController {
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

	public List<BlogSubCategory> getAllBlogSubCategories(HttpSession session, Integer blogNo, Model model, Integer categoryNo) {
		Blog blog = blogService.getBlogByBlogNo(blogNo);
		// 배경색상 투명도 바꾸기
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

		List<BlogSubCategory> blogSubCategories = blogSubCategoryService.getAllBlogSubCategoriesByuserId(userId);
		model.addAttribute("user", user);
		model.addAttribute("blog", blog);
		if (categoryNo == null) {
			BlogSubCategory blogSubCategory = blogSubCategoryService.getOneSubCategoryByBlogNo(blogNo);
			int subCatNo = blogSubCategory.getNo();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("subCatNo", subCatNo);
			map.put("blogNo", blogNo);
			BlogCategory blogCategory = blogCategoryService.getOneCategoryByOrder(map);
			if(blogCategory !=null) {
				List<BlogBoard> blogBoards = blogBoardService.getBoardByCategory(blogCategory.getNo());
				model.addAttribute("blogBoards", blogBoards);
			}
			model.addAttribute("category", blogCategory);
			int blogCount = blogBoardService.countBoardsByCategoryId(blogCategory.getNo());
			model.addAttribute("blogCount", blogCount);
		} else {
			BlogCategory blogCategory = blogCategoryService.getAllCategoryByCategoryNo(categoryNo);
			model.addAttribute("category", blogCategory);
			List<BlogBoard> blogBoards = blogBoardService.getBoardByCategory(blogCategory.getNo());
			model.addAttribute("blogBoards", blogBoards);
			int blogCount = blogBoardService.countBoardsByCategoryId(categoryNo);
			model.addAttribute("blogCount", blogCount);
		}
		if (loginUser != null && blog.getUserId().equals(loginUser.getId())) {
			model.addAttribute("isMyBlog", "mine");
		} else {
			model.addAttribute("isMyBlog", "others");
		}
		return blogSubCategories;
	}

	@RequestMapping(value = "/alterCategory.do", method = RequestMethod.GET)
	public String alterCategory(Model model, HttpSession session, Integer categoryNo) {
		User user = (User) session.getAttribute("LOGIN_USER");
		Blog blog = blogService.getBlogByUserId(user.getId());
		Integer blogNo = blog.getNo();
		model.addAttribute("blog", blog);
		List<BlogSubCategory> blogSubCategories = getAllBlogSubCategories(session, blogNo, model, categoryNo);
		int categorySize = blogSubCategories.size();
		model.addAttribute("categorySize", categorySize);
		model.addAttribute("subCategories", blogSubCategories);
		model.addAttribute("selected", "first");
		// 꾸미기 설정을 파랗게
		model.addAttribute("column", "menu");
		// 레이아웃 & 위젯 설정 파랗게
		model.addAttribute("left3", "category");
		return "blog/category/category";
	}

	@RequestMapping(value = "/alterCategory.do", method = RequestMethod.POST)
	public String alterCategoryApply(Model model, HttpSession session, Integer categoryNo, String subCatNo, String subCatTitle,
		   String catSubCatNo, String catNo, String catTitle, String show) {

		User user = (User) session.getAttribute("LOGIN_USER");
		Blog blog = blogService.getBlogByUserId(user.getId());
		Integer blogNo = blog.getNo();

		// 서브카테고리 수정 or 추가
		String[] subCatNoArray = subCatNo.split(",");
		String[] subCatTitleArray = subCatTitle.split(",");
		// 카테고리 수정 or 추가
		String[] catSubCatNoArray = catSubCatNo.split(",");
		String[] catNoArray = catNo.split(",");
		String[] catTitleArray = catTitle.split(",");
//		String[] showArray = show.split(",");

		// 서브카테고리 번호 배열 조회
		for (int i = 0; i < subCatNoArray.length; i++){
			// 번호 숫자화
			int newSubCatNo = Integer.parseInt(subCatNoArray[i]);
			// 번호가 0보다 크면
			if (newSubCatNo > 0) {
				// 서브카테고리를 가져와서
				BlogSubCategory blogSubCategory = blogSubCategoryService.getAllSubCategoryBySubCatNo(newSubCatNo);
				// 서브카테고리 타이틀 i번째를 가져와서 적용
				blogSubCategory.setTitle(subCatTitleArray[i]);
				// 서브카테고리 업데이트
				blogSubCategoryService.updateSubCategory(blogSubCategory);

				// 카테고리의 서브카테고리 번호를 하나씩 가져와서
				for (int j = 0; j < catNoArray.length; j++) {
					int newCatSubCatNo = Integer.parseInt(catSubCatNoArray[j]);
					if (newCatSubCatNo == newSubCatNo) {
						int newCatNo = Integer.parseInt(catNoArray[j]);
						
						if (newCatNo > 0) {
							BlogCategory blogCategory = blogCategoryService.getAllCategoryByCategoryNo(newCatNo);
							blogCategory.setTitle(catTitleArray[j]);
							blogCategoryService.updateCategory(blogCategory);
						} else if (newCatNo < 0) {
							BlogCategory blogCategory = new BlogCategory();
							blogCategory.setTitle(catTitleArray[j]);
							blogCategory.setSubCategoryNo(newCatSubCatNo);
							blogCategoryService.addNewCategory(blogCategory);
						}
					}
				}

				// 서브카테고리 번호가 0보다 작으면
			} else if (newSubCatNo < 0) {
				// 추가할 번호를 가져옴
				int lastSubCatNo = blogSubCategoryService.getNextBlogSequence();
				// 서브카테고리를 새로 만들어서
				BlogSubCategory blogSubCategory = new BlogSubCategory();
				// blogNo를 정해주고
				blogSubCategory.setBlogNo(blogNo);
				// 서브카테고리 타이틀 i번째를 가져와서 적용
				blogSubCategory.setTitle(subCatTitleArray[i]);
				// 서브카테고리 번호 추가
				blogSubCategory.setNo(lastSubCatNo);
				// 서브카테고리 추가
				blogSubCategoryService.addNewSubCategoryWithNo(blogSubCategory);

				// 카테고리의 서브카테고리 번호를 하나씩 가져와서
				for (int j = 0; j < catSubCatNoArray.length; j++) {
					// 숫자화
					int newCatSubCatNo = Integer.parseInt(catSubCatNoArray[j]);
					// 카테고리의 서브카테고리 번호가 서브카테고리번호와 같으면
					if (newCatSubCatNo == newSubCatNo) {
						int newCatNo = Integer.parseInt(catNoArray[j]);
						if (newCatNo > 0) {
							BlogCategory blogCategory = blogCategoryService.getAllCategoryByCategoryNo(newCatNo);
							blogCategory.setTitle(catTitleArray[j]);
							blogCategoryService.updateCategory(blogCategory);
						} else if (newCatNo < 0) {
							BlogCategory blogCategory = new BlogCategory();
							blogCategory.setTitle(catTitleArray[j]);
							blogCategory.setSubCategoryNo(lastSubCatNo);
							blogCategoryService.addNewCategory(blogCategory);
						}
					}
				}
			}
		}

		return "redirect:alterCategory.do";
	}

	@RequestMapping("/changeCatPublic.do")
	public @ResponseBody void changeCatPublic(HttpSession session, String catNo, String subCatNo) {
		if (catNo != null) {
			Integer categoryNo2 = Integer.parseInt(catNo);
			BlogCategory blogCategory = blogCategoryService.getAllCategoryByCategoryNo(categoryNo2);
			blogCategory.setVisibility("Y");
			blogCategoryService.updateCategory(blogCategory);
		}
		if (subCatNo != null) {
			Integer subCatNo2 = Integer.parseInt(subCatNo);
			BlogSubCategory blogSubCategory = blogSubCategoryService.getAllSubCategoryBySubCatNo(subCatNo2);
			blogSubCategory.setVisibility("Y");
			blogSubCategoryService.updateSubCategory(blogSubCategory);
		}
	}

	@RequestMapping("/changeCatPrivate.do")
	public @ResponseBody void changeCatPrivate(HttpSession session, String catNo, String subCatNo) {
		if (catNo != null) {
			Integer categoryNo2 = Integer.parseInt(catNo);
			BlogCategory blogCategory = blogCategoryService.getAllCategoryByCategoryNo(categoryNo2);
			blogCategory.setVisibility("N");
			blogCategoryService.updateCategory(blogCategory);
		}
		if (subCatNo != null) {
			Integer subCatNo2 = Integer.parseInt(subCatNo);
			BlogSubCategory blogSubCategory = blogSubCategoryService.getAllSubCategoryBySubCatNo(subCatNo2);
			blogSubCategory.setVisibility("N");
			blogSubCategoryService.updateSubCategory(blogSubCategory);
		}
	}
	
	@RequestMapping("/deleteCategory.do")
	public String deleteCategory(HttpSession session, String catNo, String subCatNo) {
		if (catNo != null) {
			int categoryNo = Integer.parseInt(catNo);
			blogCategoryService.deleteCategory(categoryNo);
		}
		if (subCatNo != null) {
			int subCategoryNo = Integer.parseInt(subCatNo);
			blogSubCategoryService.deleteSubCategory(subCategoryNo);
		}
		return "redirect:alterCategory.do";
	}
	
}
