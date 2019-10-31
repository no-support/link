package kr.co.link.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.link.form.BlogUpdateForm;
import kr.co.link.form.ColorForm;
import kr.co.link.service.BlogBoardService;
import kr.co.link.service.BlogNeighborService;
import kr.co.link.service.BlogService;
import kr.co.link.service.BlogThemeService;
import kr.co.link.service.UserService;
import kr.co.link.util.DateUtils;
import kr.co.link.vo.Blog;
import kr.co.link.vo.BlogNeighbor;
import kr.co.link.vo.BlogSubCategory;
import kr.co.link.vo.BlogTheme;
import kr.co.link.vo.User;

@Controller
@RequestMapping("/blog")
public class BlogBeautyController {
	
	@Autowired
	private BlogService blogservice;
	@Autowired
	private BlogThemeService blogThemeService;
	@Autowired
	private UserService userService;
	@Autowired
	private BlogNeighborService blogNeighborService;
	@Autowired
	private BlogBoardService blogBoardService;
	
	// 기본 설정 시작
	@RequestMapping("/start.do")
	public String start(){
		return "blog/detail/start";
	}
	
	@RequestMapping(value="/beauty.do", method = RequestMethod.GET)
	public String beauty(Model model, Integer blogNo, HttpSession session) throws IOException {
		User user = (User) session.getAttribute("LOGIN_USER");
		Blog blog = blogservice.getBlogByUserId(user.getId());
		model.addAttribute("blog",blog);
		// 기본 설정을 파랗게
		model.addAttribute("column","updateProfile");
		// 블로그정보를 파랗게
		model.addAttribute("left","blogmain");
		return "blog/beautify/beautymain";
	}
	
	@RequestMapping(value="/beauty.do", method = RequestMethod.POST)
	public String beautyApply(Model model, Integer blogNo, BlogUpdateForm blogUpdateForm, HttpSession session) throws IOException {
		User user = (User) session.getAttribute("LOGIN_USER");
		Blog blog = blogservice.getBlogByUserId(user.getId());
		BeanUtils.copyProperties(blogUpdateForm, blog);
		user.setNickName(blogUpdateForm.getNickName());
		MultipartFile mf = blogUpdateForm.getMainImg();
		String profileImageSaveDirectory = blogservice.profileImageSaveDirectory();
		
		if (!mf.isEmpty()) {
			String filename = mf.getOriginalFilename();
			FileCopyUtils.copy(mf.getBytes(), new File(profileImageSaveDirectory, filename));
			blog.setMainImg(filename);
		}
		userService.updateUser(user);
		blogservice.updateBlogByBlogNo(blog);
		return "redirect:mydetail.do";
	}
	
	@RequestMapping(value="/beautyCategory.do", method = RequestMethod.GET)
	public String beautyCategory(Model model, HttpSession session, Integer categoryNo,
			@RequestParam(value = "pno", required = false, defaultValue = "1") Integer pno,
			@RequestParam(value = "pno10", required = false, defaultValue = "1" ) Integer pno10) throws IOException {
		User user = (User) session.getAttribute("LOGIN_USER");
		Blog blog = blogservice.getBlogByUserId(user.getId());
		Integer blogNo = blog.getNo();
		
		BlogDetailController blogDetailController = new BlogDetailController();
		List<BlogSubCategory> blogSubCategories = blogDetailController.getBlogSubCategories(session, blogNo, model, categoryNo,pno,pno10);
		
		model.addAttribute("subCategories", blogSubCategories);
		model.addAttribute("blog",blog);
		// 기본 설정을 파랗게
		model.addAttribute("column","menu");
		// 블로그정보를 파랗게
		model.addAttribute("left","menu");
		return "blog/beautify/beautyCategory";
	}
	
	@RequestMapping(value="/updateProfile.do", method = RequestMethod.GET)
	public String updateProfile(Model model, HttpSession session) {
		User user = (User) session.getAttribute("LOGIN_USER");
		model.addAttribute("user",user);
		// 기본 설정을 파랗게
		model.addAttribute("column","updateProfile");
		// 프로필정보를 파랗게
		model.addAttribute("left","updateProfile");
		return "blog/beautify/beautyUpdateProfile";
	}
	
	@RequestMapping(value="/updateProfile.do", method = RequestMethod.POST)
	public String updateProfileApply(Model model, HttpSession session, String nameVisibility, String genderVisibility,
									 MultipartFile mainImg) throws IOException {
		User user = (User) session.getAttribute("LOGIN_USER");
		user.setNameVisibility(nameVisibility);
		user.setGenderVisibility(genderVisibility);
		
		String profileImageSaveDirectory = blogservice.profileImageSaveDirectory();
		
		if (!mainImg.isEmpty()) {
			String filename = mainImg.getOriginalFilename();
			FileCopyUtils.copy(mainImg.getBytes(), new File(profileImageSaveDirectory, filename));
			user.setImg(filename);
		}
		userService.updateUser(user);
		// 기본 설정을 파랗게
		model.addAttribute("column","updateProfile");
		// 프로필정보를 파랗게
		model.addAttribute("left","updateProfile");
		return "redirect:updateProfile.do";
	}
	
	// 기본 설정(left) 끝
	
	//꾸미기 설정 시작 (left2)
	@RequestMapping(value = "/beautifyblog.do", method = RequestMethod.GET)
	public String beautifyBlog(Model model, HttpSession session){
		User user = (User) session.getAttribute("LOGIN_USER");
		Blog blog = blogservice.getBlogByUserId(user.getId());
		model.addAttribute("blog",blog);
		
		model.addAttribute("selected","first");
		// 꾸미기 설정을 파랗게
		model.addAttribute("column","beautifyblog");
		// 레이아웃 & 위젯 설정 파랗게
		model.addAttribute("left2","layout");
		return "blog/beautify/beautifyblog";
	}
	
	// 박스 옮길때 ajax로 적용
	@RequestMapping(value = "/beautifyblogApply.do", method = RequestMethod.GET)
	public @ResponseBody void beautifyBlogApply(Model model,HttpSession session, String firstCol, String secondCol, String thirdCol,Integer layNum){
		session.setAttribute("layNum", layNum);
		session.setAttribute("firstCol", firstCol);
		session.setAttribute("secondCol", secondCol);
		session.setAttribute("thirdCol", thirdCol);
	}
	
	@RequestMapping(value = "/beautifyblog2.do", method = RequestMethod.GET)
	public String beautifyBlog2(Model model, HttpSession session){
		User user = (User) session.getAttribute("LOGIN_USER");
		Blog blog = blogservice.getBlogByUserId(user.getId());
		model.addAttribute("blog",blog);
		
		model.addAttribute("selected","second");
		// 꾸미기 설정을 파랗게
		model.addAttribute("column","beautifyblog");
		// 레이아웃 & 위젯 설정 파랗게
		model.addAttribute("left2","layout");
		return "blog/beautify/beautifyblog2";
	}
	
	@RequestMapping(value = "/beautifyblog3.do", method = RequestMethod.GET)
	public String beautifyBlog3(Model model, HttpSession session){
		User user = (User) session.getAttribute("LOGIN_USER");
		Blog blog = blogservice.getBlogByUserId(user.getId());
		model.addAttribute("blog",blog);
		
		model.addAttribute("selected","third");
		// 꾸미기 설정을 파랗게
		model.addAttribute("column","beautifyblog");
		// 레이아웃 & 위젯 설정 파랗게
		model.addAttribute("left2","layout");
		return "blog/beautify/beautifyblog3";
	}
	
	@RequestMapping(value = "/beautifyblog4.do", method = RequestMethod.GET)
	public String beautifyBlog4(Model model, HttpSession session){
		User user = (User) session.getAttribute("LOGIN_USER");
		Blog blog = blogservice.getBlogByUserId(user.getId());
		model.addAttribute("blog",blog);
		
		model.addAttribute("selected","fourth");
		// 꾸미기 설정을 파랗게
		model.addAttribute("column","beautifyblog");
		// 레이아웃 & 위젯 설정 파랗게
		model.addAttribute("left2","layout");
		return "blog/beautify/beautifyblog4";
	}
	
	@RequestMapping(value = "/beautyLayoutApply.do", method = RequestMethod.GET)
	public String layoutApply(Model model, HttpSession session, Integer layNum, String firstCol, String secondCol, String thirdCol){
		User user = (User) session.getAttribute("LOGIN_USER");
		Blog blog = blogservice.getBlogByUserId(user.getId());
		blog.setFirstCol(firstCol);
		blog.setSecondCol(secondCol);
		blog.setThirdCol(thirdCol);
		blog.setLayout(layNum);
		
		blogservice.updateBlogByBlogNo(blog);
		if(layNum ==1) {
			return "redirect:beautifyblog.do";
		}
		if(layNum ==2) {
			return "redirect:beautifyblog2.do";
		}
		if(layNum ==3) {
			return "redirect:beautifyblog3.do";
		} else{
			return "redirect:beautifyblog4.do";
		}
	}
	
	// 테마
	@RequestMapping(value = "/blogtheme.do", method = RequestMethod.GET)
	public String blogTheme(Model model, HttpSession session){
		User user = (User) session.getAttribute("LOGIN_USER");
		// 블로그 얻어오기
		Blog blog = blogservice.getBlogByUserId(user.getId());
		
		// 테마 얻어오기
		List<BlogTheme> blogThemes = blogThemeService.getAllThemes();
		String blogTheme = blog.getTheme();
		model.addAttribute("blogTheme",blogTheme);
		
		model.addAttribute("blogThemes",blogThemes);
		// 테마 얻어오기 끝
		
		model.addAttribute("selected","second");
		// 꾸미기 설정을 파랗게
		model.addAttribute("column","beautifyblog");
		// 테마 설정 파랗게
		model.addAttribute("left2","theme");
		return "blog/beautify/blogtheme";
	}
	
	// 블로그 색상
	@RequestMapping(value = "/blogcolor.do", method = RequestMethod.GET)
	public String blogColor(Model model, HttpSession session){
		User user = (User) session.getAttribute("LOGIN_USER");
		// 블로그 얻어오기
		Blog blog = blogservice.getBlogByUserId(user.getId());
		
		model.addAttribute("blog",blog);
		model.addAttribute("selected","second");
		// 꾸미기 설정을 파랗게
		model.addAttribute("column","beautifyblog");
		// 컬러 설정 파랗게
		model.addAttribute("left2","color");
		return "blog/beautify/blogcolor";
	}
	
	@RequestMapping(value = "/blogcolor.do", method = RequestMethod.POST)
	public String blogColorApply(HttpSession session, ColorForm colorForm){
		User user = (User) session.getAttribute("LOGIN_USER");
		// 블로그 얻어오기
		Blog blog = blogservice.getBlogByUserId(user.getId());
	    BeanUtils.copyProperties(colorForm, blog);
	    blogservice.updateBlogByBlogNo(blog);
		return "redirect:blogcolor.do";
	}
	
	@RequestMapping(value="/blogthemeapply.do", method = RequestMethod.GET)
	public String applyTheme(String theme, HttpSession session) {
		User user = (User) session.getAttribute("LOGIN_USER");
		// 블로그 얻어오기
		Blog blog = blogservice.getBlogByUserId(user.getId());
		blog.setTheme(theme);
		blogservice.updateBlogByBlogNo(blog);
		return "redirect:blogtheme.do";
	}
	
	@RequestMapping(value="/eachNeighbor.do", method = RequestMethod.GET)
	public String eachNeighbor(HttpSession session, Model model) {
		User user = (User) session.getAttribute("LOGIN_USER");
		// 블로그 얻어오기
		Blog blog = blogservice.getBlogByUserId(user.getId());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("myBlogNo", blog.getNo());
		map.put("status", "applying");
		List<Map<String, Object>> neighbors = blogNeighborService.getNeighborNoByBlogNo(map);
		model.addAttribute("neighbors",neighbors);
		// 서로이웃 맺기 파랗게
		model.addAttribute("left","eachneighbor");
		// 기본 설정을 파랗게
		model.addAttribute("column","updateProfile");
		
		return "blog/beautify/eachNeighbor";
	}
	
	@RequestMapping(value="/eachNeighbor.do", method = RequestMethod.POST)
	public String eachNeighborRequest(HttpSession session, Model model,
										String neighborBlogNo,
										String reply) {
		User user = (User) session.getAttribute("LOGIN_USER");
		// 블로그 얻어오기
		Blog blog = blogservice.getBlogByUserId(user.getId());
		String[] neighborBlogNums = neighborBlogNo.split(",");
		// 수락시
		if(reply.equals("accept")) {
			for(int i=0; i<neighborBlogNums.length; i++) {
				int neighborBlogNum = Integer.parseInt(neighborBlogNums[i]);
				// 블로그 이웃 얻어오기
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("myBlogNo", blog.getNo());
				map.put("neighborBlogNo", neighborBlogNum);
				
				// 상태 변경
				BlogNeighbor blogNeighbor = blogNeighborService.getNeighborByMyBlogNo(map);
				blogNeighbor.setStatus("accept");
				blogNeighborService.updateBlogNeighbor(blogNeighbor);
				BlogNeighbor newBlogNeighbor = new BlogNeighbor();
				
				// 내 이웃에 추가
				newBlogNeighbor.setBlogNo(blog.getNo());
				newBlogNeighbor.setNo(neighborBlogNum);
				newBlogNeighbor.setStatus("accept");
				newBlogNeighbor.setType("All");
				blogNeighborService.addNewNeighborRequest(newBlogNeighbor);
				
			}
		} else if(reply.equals("deny")) {
			for(int i=0; i<neighborBlogNums.length; i++) {
				int neighborBlogNum = Integer.parseInt(neighborBlogNums[i]);
				// 블로그 이웃 얻어오기
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("myBlogNo", blog.getNo());
				map.put("neighborBlogNo", neighborBlogNum);
				BlogNeighbor blogNeighbor = blogNeighborService.getNeighborByMyBlogNo(map);
				blogNeighbor.setStatus("deny");
				blogNeighborService.updateBlogNeighbor(blogNeighbor);
			}
		}
		
		return "redirect:eachNeighbor.do";
	}
	@RequestMapping("sendNeighbor.do")
	public String sendNeighbor(HttpSession session, String neighborBlogNo){
		User user = (User) session.getAttribute("LOGIN_USER");
		String[] neighborBlogNums = neighborBlogNo.split(",");
		Blog blog = blogservice.getBlogByUserId(user.getId());
		
		for(int i=0; i<neighborBlogNums.length; i++) {
			int neighborBlogNum = Integer.parseInt(neighborBlogNums[i]);
			System.out.println("neighborBlogNum: "+neighborBlogNum);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("myBlogNo", blog.getNo());
			map.put("neighborBlogNo", neighborBlogNum);
			blogNeighborService.deleteNeighborByMyBlogNoNeighborBlogNo(map);
		}
		return "redirect:eachNeighbor.do";
	}
	@RequestMapping("neighborApplyAjax.do")
	public @ResponseBody List<Map<String, Object>> neighborApplyAjax(HttpSession session, String type) {
		User user = (User) session.getAttribute("LOGIN_USER");
		// 블로그 얻어오기
		Blog blog = blogservice.getBlogByUserId(user.getId());
		
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("myBlogNo", blog.getNo());
			map.put("status", "applying");
			List<Map<String, Object>> neighbors = new ArrayList<Map<String,Object>>();
			if(type.equals("applying")){
				neighbors = blogNeighborService.getNeighborNoByBlogNo(map);
			} else {
				neighbors = blogNeighborService.getMeApplyingNeighborNoByBlogNo(map);
			}
			for(Map<String, Object> neighbor : neighbors) {
				Date date = (Date) neighbor.get("CREATEDATE");
				String sDate = DateUtils.dateToString(date);
				neighbor.put("CREATEDATE", sDate);
			}
			
		return neighbors;
	}
	
	@RequestMapping(value="addMeNeighbor.do", method = RequestMethod.GET)
	public String addMeNeighbor(HttpSession session, Model model) {
		User user = (User) session.getAttribute("LOGIN_USER");
		// 내 블로그 얻어오기
		Blog blog = blogservice.getBlogByUserId(user.getId());
		List<Map<String, Object>> blogNeighbors = blogNeighborService.getNeighborIAdd(blog.getNo());
		model.addAttribute("blogNeighbors",blogNeighbors);
		// 추가한 이웃 파랗게
		model.addAttribute("left","addMeNeighbor");
		// 기본 설정을 파랗게
		model.addAttribute("column","updateProfile");
		
		return "blog/beautify/addMeNeighbor";
	}
	@RequestMapping(value="manageNeighbor.do", method = RequestMethod.GET)
	public String manageNeighbor(HttpSession session, Model model) {
		User user = (User) session.getAttribute("LOGIN_USER");
		// 내 블로그 얻어오기
		Blog blog = blogservice.getBlogByUserId(user.getId());
		List<Map<String, Object>> blogNeighbors = blogNeighborService.getNeighborIAdd(blog.getNo());
		model.addAttribute("blogNeighbors",blogNeighbors);
		// 이웃 관리 파랗게
		model.addAttribute("left","manageNeighbor");
		// 기본 설정을 파랗게
		model.addAttribute("column","updateProfile");
		
		return "blog/beautify/manageNeighbor";
	}
	
	@RequestMapping(value="manageNeighbor.do", method = RequestMethod.POST)
	public String manageNeighborApply(HttpSession session, Model model,
			String neighborBlogNo) {
		User user = (User) session.getAttribute("LOGIN_USER");
		// 블로그 얻어오기
		Blog blog = blogservice.getBlogByUserId(user.getId());
		String[] neighborBlogNums = neighborBlogNo.split(",");
		for(int i=0; i<neighborBlogNums.length; i++) {
			int neighborBlogNum = Integer.parseInt(neighborBlogNums[i]);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("myBlogNo", blog.getNo());
			map.put("neighborBlogNo", neighborBlogNum);
			blogNeighborService.deleteNeighborByMyBlogNoNeighborBlogNo(map);
		}
		return "redirect:manageNeighbor.do";
	}
	
	@RequestMapping(value="manageComment.do", method = RequestMethod.GET)
	public String manageComment(HttpSession session, Model model) {
		User user = (User) session.getAttribute("LOGIN_USER");
		// 내 블로그 얻어오기
		Blog blog = blogservice.getBlogByUserId(user.getId());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("myBlogNo", blog.getNo());
		map.put("myUserId", user.getId());
		List<Map<String, Object>> blogComments = blogBoardService.getBoardCommentsInMyBlog(map);
		model.addAttribute("blogComments",blogComments);
		// 이웃 관리 파랗게
		model.addAttribute("left3","manageComment");
		// 메뉴,글 관리
		model.addAttribute("column","menu");
		
		return "blog/category/manageComment";
	}
	
}
