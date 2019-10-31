package kr.co.link.controller;

import java.awt.Color;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import kr.co.link.form.BlogBoardForm;
import kr.co.link.form.BlogForm;
import kr.co.link.service.BlogBoardService;
import kr.co.link.service.BlogCategoryService;
import kr.co.link.service.BlogNeighborService;
import kr.co.link.service.BlogService;
import kr.co.link.service.BlogSubCategoryService;
import kr.co.link.service.UserService;
import kr.co.link.vo.Blog;
import kr.co.link.vo.BlogBoard;
import kr.co.link.vo.BlogBoardComment;
import kr.co.link.vo.BlogBoardLikes;
import kr.co.link.vo.BlogCategory;
import kr.co.link.vo.BlogNeighbor;
import kr.co.link.vo.BlogSubCategory;
import kr.co.link.vo.Pagination;
import kr.co.link.vo.User;

@Controller
@RequestMapping("/blog")
public class BlogDetailController {
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
		
		// 이웃 블로그수 전해주기
		int neighborCounts = blogNeighborService.getNeighborCountsByBlogNo(blogNo);
		model.addAttribute("neighborCounts",neighborCounts);
		
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
		
		List<BlogSubCategory> blogSubCategories = blogSubCategoryService.getBlogSubCategoriesByuserId(userId);
		model.addAttribute("user", user);
		model.addAttribute("blog", blog);
		
		// 블로그 이웃인지
		User me = (User) session.getAttribute("LOGIN_USER");
		if(me !=null) {
			Blog myblog = blogService.getBlogByUserId(me.getId());
			if(myblog != null) {
				Map<String, Object> isNeighborMap = new HashMap<String, Object>();
				isNeighborMap.put("myBlogNo", myblog.getNo());
				isNeighborMap.put("neighborhoodNo",blog.getNo());
				Integer isNeighbor = blogNeighborService.isNeighbor(isNeighborMap);
				if(isNeighbor == null) {
					model.addAttribute("isNeighbor","N");
				} else if(isNeighbor != null) {
					model.addAttribute("isNeighbor","Y");
				}
			}
		}
		if (categoryNo == null) {

			BlogSubCategory blogSubCategory = blogSubCategoryService.getOneSubCategoryByBlogNo(blogNo);
			int subCatNo = blogSubCategory.getNo();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("subCatNo", subCatNo);
			map.put("blogNo", blogNo);
			BlogCategory blogCategory = blogCategoryService.getOneCategoryByOrder(map);

			// 페이지네이션 시작
			// 5개 시작
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

			model.addAttribute("category", blogCategory);
			if (blogCategory != null) {
				List<BlogBoard> blogBoards = blogBoardService.getBoardByCategory(blogCategory.getNo());
				model.addAttribute("blogBoards", blogBoards);
				int blogCount = blogBoardService.countBoardsByCategoryId(blogCategory.getNo());
				model.addAttribute("blogCount", blogCount);
			}
		} else {
			BlogCategory blogCategory = blogCategoryService.getCategoryByCategoryNo(categoryNo);
			model.addAttribute("category", blogCategory);
			List<BlogBoard> blogBoards = blogBoardService.getBoardByCategory(categoryNo);
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
			int blogCount = blogBoardService.countBoardsByCategoryId(categoryNo);
			model.addAttribute("blogCount", blogCount);
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
		if (loginUser != null && blog.getUserId().equals(loginUser.getId())) {
			model.addAttribute("isMyBlog", "mine");
		} else {
			model.addAttribute("isMyBlog", "others");
		}
		return blogSubCategories;
	}

	@RequestMapping("/main.do")
	public String main(Model model, HttpSession session,
					   @RequestParam(value="pno", required = false, defaultValue = "1") Integer pno,
					   @RequestParam(value="blogType", required = false, defaultValue = "all") String blogType,
					   @RequestParam(value="pno", required=false, defaultValue="1") int pageNo) throws ParseException {
		
		User user = (User) session.getAttribute("LOGIN_USER");
		
		// 캐러샐 시작
		Map<String, Object> blogMap = new HashMap<String, Object>();
		blogMap.put("begin",1);
		blogMap.put("end", 3);
		
		List<Blog> blogs = blogService.get3BlogByVisits(blogMap);
		model.addAttribute("blogsByVisit", blogs);
		model.addAttribute("caroselLength", blogs.size());
		//끝
		
		List<Blog> allBlogs = blogService.getAllblogs();
		
		Map<String, Object> topicMap = new HashMap<String, Object>();
		if(user != null) {
			topicMap.put("userId", user.getId());
		}
		topicMap.put("blogType", blogType);
		
		// 페이지네이션 시작
		int howMany = 4;
		int begin = (pno - 1) * howMany + 1;
		int end = pno * howMany;
		topicMap.put("begin", begin);
		topicMap.put("end", end);
		Integer totalPages = blogService.getBlogsCountByType(topicMap);
		int totalBlocks = (int) Math.ceil((double) totalPages / howMany);
		model.addAttribute("totalBlocks",totalBlocks);
		
		List<Map<String, Object>> blogsList = blogService.getAllBlogsByType(topicMap);
		blogsList = blogService.dateChange(blogsList);
		for (Map<String, Object> blog : blogsList) {
			String contents = (String) blog.get("CONTENTS");
			blog.put("CONTENTS", contents.replaceAll("\\<.*?>",""));
		}
		
		model.addAttribute("blogsList", blogsList);
		model.addAttribute("pno", pno);
		
		if (user != null) {
			Blog blog = blogService.getBlogByUserId(user.getId());
				model.addAttribute("myblog",blog);
			if (blog == null) {
				model.addAttribute("isHaveBlog", "no");
			} else {
				int myBlogNo = blog.getNo();
				
				// 블로그 이웃인지
				for(Map<String, Object> blogByType : blogsList) {
					int neighborBlogNo = ((BigDecimal)blogByType.get("NO")).intValue();
					Map<String, Object> isNeighborMap = new HashMap<String, Object>();
					isNeighborMap.put("myBlogNo", blog.getNo());
					isNeighborMap.put("neighborhoodNo",neighborBlogNo);
					Integer isNeighbor = blogNeighborService.isNeighbor(isNeighborMap);
					
					if(isNeighbor == null) {
						blogByType.put("isNeighbor","N");
					} else if(isNeighbor != null) {
						blogByType.put("isNeighbor","Y");
					}
					
				}
				
				// 이웃 블로그 페이지네이션 시작
				Map<String, Object> param = new HashMap<String, Object>();
				int howManyRows = 3;
				param.put("myBlogNo",myBlogNo);
				param.put("beginIndex", (pageNo - 1)*howManyRows + 1);
				param.put("endIndex", pageNo*howManyRows);
				List<Map<String, Object>> blogLists = blogNeighborService.getPaginationByMap(param);
				blogLists = blogService.dateChange(blogLists);
				
				int records = blogNeighborService.getPaginationByMapRows(myBlogNo);
				Pagination pagination = new Pagination(pageNo, howManyRows, records);
				
				model.addAttribute("blogList",blogLists);
				model.addAttribute("pagination", pagination);
				// 끝
				
				// 이웃 블로그 원래 있던 코드
//				List<Map<String, Object>> blogLists = blogNeighborService.getNeighborBlogMap(myBlogNo);
//				model.addAttribute("blogList", blogLists);
				model.addAttribute("isHaveBlog", "yes");
				// 끝
				
				// 이웃 요청 리스트 전해주기
				Map<String, Object> map3 = new HashMap<String, Object>();
				map3.put("myBlogNo", myBlogNo);
				map3.put("status", "applying");
				List<Map<String, Object>> blogNeighbors = blogNeighborService.getNeighborRequest(map3);
				model.addAttribute("requestList",blogNeighbors);
				// 끝
			}
		}
		
		model.addAttribute("allBlogs", allBlogs);
		
		
		return "blog/main";
	}
	@RequestMapping("neighborAjax.do")
	public @ResponseBody Map<String,Object> neighborAjax(HttpSession session, Integer pageNo){
		Map<String, Object> neighborMap = new HashMap<String, Object>();
		User user = (User) session.getAttribute("LOGIN_USER");
		Blog blog = blogService.getBlogByUserId(user.getId());
		int myBlogNo = blog.getNo();
		
		// 표시할 줄 갯수
		int howManyRows = 3;
		neighborMap.put("myBlogNo",myBlogNo);
		neighborMap.put("beginIndex", (pageNo - 1)*howManyRows + 1);
		neighborMap.put("endIndex", pageNo*howManyRows);
		List<Map<String, Object>> blogLists = blogNeighborService.getPaginationByMap(neighborMap);
		blogLists = blogService.dateChange(blogLists);
		int records = blogNeighborService.getPaginationByMapRows(myBlogNo);
		Pagination pagination = new Pagination(pageNo, howManyRows, records);
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("pagination", pagination);
		param.put("blogLists", blogLists);
		return param;
	}
	@RequestMapping("topicAjax.do")
	public @ResponseBody Map<String, Object> topicAjax(HttpSession session, String blogType, Integer pno){
		Map<String, Object> topicMap = new HashMap<String, Object>();
		User user = (User) session.getAttribute("LOGIN_USER");
		if(user != null) {
			topicMap.put("userId", user.getId());
		}
		topicMap.put("blogType", blogType);
		
		// 페이지네이션 시작
		int howMany = 4;
		int begin = (pno - 1) * howMany + 1;
		int end = pno * howMany;
		topicMap.put("begin", begin);
		topicMap.put("end", end);
		Integer totalPages = blogService.getBlogsCountByType(topicMap);
		
		int totalBlocks = (int) Math.ceil((double) totalPages / howMany);
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> blogsList = blogService.getAllBlogsByType(topicMap);
		blogsList = blogService.dateChange(blogsList);
		
		map.put("blogsList", blogsList);
		map.put("totalBlocks", totalBlocks);
		map.put("pno", pno);
		return map;
	}
	
	@RequestMapping("paginationAjax.do")
	public @ResponseBody Map<String, Object> paginationAjax(Model model, HttpSession session, Integer blogNo, Integer categoryNo,
			@RequestParam(value = "pno", required = false, defaultValue = "1") Integer pno,
			@RequestParam(value = "pno10", required = false, defaultValue = "1") Integer pno10) {
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
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("blogboardsByRange", blogboards);
		map.put("pno", pno);

		return map;
	}

	@RequestMapping("paginationAjax10.do")
	public @ResponseBody Map<String, Object> paginationAjax10(Model model, HttpSession session, Integer blogNo, Integer categoryNo,
			@RequestParam(value = "pno", required = false, defaultValue = "1") Integer pno,
			@RequestParam(value = "pno10", required = false, defaultValue = "1") Integer pno10) {
		// 페이지네이션 시작
		Map<String, Object> rangeMap = new HashMap<String, Object>();
		int howMany = 12;
		int begin = (pno10 - 1) * howMany + 1;
		int end = pno10 * howMany;
		rangeMap.put("begin", begin);
		rangeMap.put("end", end);
		rangeMap.put("categoryNo", categoryNo);
		List<BlogBoard> blogboards = blogBoardService.getBoardsByRange(rangeMap);

		int totalCount = blogBoardService.getBoardsCountByCategoryNo(categoryNo);
		totalCount = (int) Math.ceil((double) totalCount / howMany);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("blogboardsByRange10", blogboards);
		map.put("pno10", pno10);

		return map;
	}

	@RequestMapping("/detail.do")
	public String detail(Model model, HttpSession session, Integer blogNo, Integer categoryNo,
			@RequestParam(value = "pno", required = false, defaultValue = "1") Integer pno,
			@RequestParam(value = "pno10", required = false, defaultValue = "1") Integer pno10) {
		
		List<BlogSubCategory> blogSubCategories = getBlogSubCategories(session, blogNo, model, categoryNo, pno, pno10);
		// 방문횟수 증가
		Blog blog = blogService.getBlogByBlogNo(blogNo);
		blog.setVisits(blog.getVisits()+1);
		blogService.updateBlogByBlogNo(blog);
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

	@RequestMapping("/board.do")
	public String board(Model model, HttpSession session, Integer boardNo, Integer blogNo, Integer categoryNo,
			@RequestParam(value = "pno", required = false, defaultValue = "1") Integer pno,
			@RequestParam(value = "pno10", required = false, defaultValue = "1") Integer pno10) {
		List<BlogSubCategory> blogSubCategories = getBlogSubCategories(session, blogNo, model, categoryNo, pno, pno10);
		Blog blog = blogService.getBlogByBlogNo(blogNo);
		BlogBoard board = blogBoardService.getBoardByboardNo(boardNo);
		// 공감 기능
		// 공감 리스트
		List<Map<String, Object>> blogBoardLikesMap = blogBoardService.getBlogsWhoLikeBoard(boardNo);
		for(Map<String, Object> blogBoardlike : blogBoardLikesMap) {
			int neighborBlogNo = ((BigDecimal) blogBoardlike.get("BLOGNO")).intValue();
			blogBoardlike.put("BLOGNO", neighborBlogNo);
			Map<String, Object> isNeighborMap = new HashMap<String, Object>();
			
			// 블로그 이웃인지
			User me = (User) session.getAttribute("LOGIN_USER");
			if(me !=null) {
				Blog myBlog = blogService.getBlogByUserId(me.getId());
				if(myBlog != null) {
					isNeighborMap.put("myBlogNo", myBlog.getNo());
					isNeighborMap.put("neighborhoodNo",neighborBlogNo);
					Integer isNeighbor = blogNeighborService.isNeighbor(isNeighborMap);
					if(isNeighbor == null) {
						blogBoardlike.put("isNeighbor","N");
					} else if(isNeighbor != null) {
						blogBoardlike.put("isNeighbor","Y");
					}
				}
			}
		}
		model.addAttribute("blogBoardLikes",blogBoardLikesMap);
		
		Integer boardLikes = blogBoardService.getBoardLikesCount(boardNo);
		model.addAttribute("boardLikes",boardLikes);
		// 공감 리스트 끝
		
		// 내가 공감 했는지
		User user = (User) session.getAttribute("LOGIN_USER");
		if(user != null) {
			Blog myBlog = blogService.getBlogByUserId(user.getId());
			if(myBlog!=null) {
				model.addAttribute("myBlog",myBlog);
				int myBlogNo = myBlog.getNo();
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("boardNo", boardNo);
				map.put("myBlogNo", myBlogNo);
				model.addAttribute("myBlogNo",myBlogNo);
				BlogBoardLikes isBlogBoardLikes = blogBoardService.getisLikedBoardByBloardNoMyBlogNo(map);
				if(isBlogBoardLikes == null) {
					model.addAttribute("isLiked","N");
				} else {
					model.addAttribute("isLiked","Y");
				}
			}
		}
		// 끝
		
		// 댓글 시작
		Map<String, Object> parentMap = new HashMap<String, Object>();
		parentMap.put("boardNo", boardNo);
		// 댓글 목록 가져오기
		List<Map<String, Object>> blogBoardComments = blogBoardService.getBoardCommentByBoardNoParentCno(parentMap);
		// 댓글 수 전해주기
		int commentsCount = blogBoardService.getCommentsCountByBoardNo(boardNo);
		model.addAttribute("commentsCount",commentsCount);
		
		Map<String, Object> sunMap = new HashMap<String, Object>();
		for (Map<String, Object> comment : blogBoardComments) {
			int commentNo = ((BigDecimal) comment.get("NO")).intValue();
			sunMap.put("boardNo", boardNo);
			sunMap.put("parentCommentNo", commentNo);
			List<Map<String, Object>> sunComments = blogBoardService.getBoardCommentReplies(sunMap);
			comment.put("replies", sunComments);
		}
		
		model.addAttribute("blogBoardComments",blogBoardComments);
		// 댓글 끝
		model.addAttribute("board", board);
		model.addAttribute("subCategories", blogSubCategories);

		if (blog.getLayout() == 1) {
			return "blog/detail/board";
		}
		if (blog.getLayout() == 2) {
			return "blog/detail/board2";
		}
		if (blog.getLayout() == 3) {
			return "blog/detail/board3";
		} else {
			return "blog/detail/board4";
		}

	}
	@RequestMapping(value="addNewComment.do", method = RequestMethod.POST)
	public String addNewComment(HttpSession session, Integer boardNo, Integer categoryNo, Integer blogNo,
								String contents, Integer parentCommentNo) {
		User user = (User) session.getAttribute("LOGIN_USER");
		BlogBoardComment blogBoardComment = new BlogBoardComment();
		blogBoardComment.setUserId(user.getId());
		blogBoardComment.setBoardNo(boardNo);
		blogBoardComment.setContents(contents);
		blogBoardComment.setParentCommentNo(parentCommentNo);
		blogBoardService.addNewComment(blogBoardComment);
		
		return "redirect:board.do?boardNo="+boardNo+"&categoryNo="+categoryNo+"&blogNo="+blogNo;
	}
	@RequestMapping("deleteBoard.do")
	public String deleteBoard(HttpSession session, Integer boardNo,Integer categoryNo, Integer blogNo) {
		blogBoardService.deleteBoardByBoardNo(boardNo);
		return "redirect:detail.do?blogNo="+blogNo+"&categoryNo="+categoryNo;
	}
	
	@RequestMapping("addNewBlogLike.do")
	public String addNewBlogLike(HttpSession session, Integer boardNo, Integer categoryNo, Integer blogNo, String action) {
		User user = (User) session.getAttribute("LOGIN_USER");
		Blog blog = blogService.getBlogByUserId(user.getId());
		int myBlogNo = blog.getNo();
		
		if(action.equals("add")) {
			BlogBoardLikes blogBoardLikes = new BlogBoardLikes();
			blogBoardLikes.setBlogNo(myBlogNo);
			blogBoardLikes.setBoardNo(boardNo);
			blogBoardService.addNewBlogLikes(blogBoardLikes);
		} else if(action.equals("cancel")) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("boardNo", boardNo);
			map.put("myBlogNo", myBlogNo);
			blogBoardService.deleteBlogLikes(map);
		}
		return "redirect:board.do?boardNo="+boardNo+"&categoryNo="+categoryNo+"&blogNo="+blogNo;
	}
	
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public String writePage(Model model, HttpSession session, Integer blogNo, Integer categoryNo,
			@RequestParam(value = "pno", required = false, defaultValue = "1") Integer pno,
			@RequestParam(value = "pno10", required = false, defaultValue = "1") Integer pno10) {

		List<BlogSubCategory> blogSubCategories = getBlogSubCategories(session, blogNo, model, categoryNo, pno, pno10);
		model.addAttribute("subCategories", blogSubCategories);
		Blog blog = blogService.getBlogByBlogNo(blogNo);
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
	
	@RequestMapping(value = "/boardUpdate.do", method = RequestMethod.GET)
	public String boardUpdate(Model model, HttpSession session, Integer blogNo, Integer categoryNo,
			@RequestParam(value = "pno", required = false, defaultValue = "1") Integer pno,
			@RequestParam(value = "pno10", required = false, defaultValue = "1") Integer pno10,
			Integer boardNo){
		
		List<BlogSubCategory> blogSubCategories = getBlogSubCategories(session, blogNo, model, categoryNo, pno, pno10);
		model.addAttribute("subCategories", blogSubCategories);
		Blog blog = blogService.getBlogByBlogNo(blogNo);
		BlogBoard blogBoard = blogBoardService.getBoardByboardNo(boardNo);
		model.addAttribute("blogBoard",blogBoard);
		
		if (blog.getLayout() == 1) {
			return "blog/detail/boardUpdate";
		}
		if (blog.getLayout() == 2) {
			return "blog/detail/boardUpdate2";
		}
		if (blog.getLayout() == 3) {
			return "blog/detail/boardUpdate3";
		} else {
			return "blog/detail/boardUpdate4";
		}
	}
	
	@RequestMapping(value = "/boardUpdate.do", method = RequestMethod.POST)
	public String boardUpdateApply(Model model, HttpSession session, Integer blogNo, Integer categoryNo,
			@RequestParam(value = "pno", required = false, defaultValue = "1") Integer pno,
			@RequestParam(value = "pno10", required = false, defaultValue = "1") Integer pno10,
			Integer boardNo, BlogBoardForm blogBoardForm, String contents) throws IOException{
		BlogBoard blogBoard = blogBoardService.getBoardByboardNo(boardNo);
		BeanUtils.copyProperties(blogBoardForm, blogBoard);
		MultipartFile mf = blogBoardForm.getUpfile();
		String profileImageSaveDirectory = blogService.profileImageSaveDirectory();
		profileImageSaveDirectory += "/userblogimgs";
		if (!mf.isEmpty()) {
			String filename = mf.getOriginalFilename();
			FileCopyUtils.copy(mf.getBytes(), new File(profileImageSaveDirectory, filename));
			blogBoard.setMainImg(filename);
		}
		blogBoardService.updateBoard(blogBoard);
		
		return "redirect:board.do?boardNo="+boardNo+"&blogNo="+blogNo+"&categoryNo="+categoryNo;
	}
	
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public String writeMethod(Model model, HttpSession session, HttpServletRequest request, BlogBoardForm blogBoardForm, Integer blogNo,
			Integer categoryNo) throws IOException {

		BlogBoard blogBoard = new BlogBoard();
		BeanUtils.copyProperties(blogBoardForm, blogBoard);
		MultipartFile mf = blogBoardForm.getUpfile();
		String profileImageSaveDirectory = blogService.profileImageSaveDirectory();
		profileImageSaveDirectory += "/userblogimgs";
		if (!mf.isEmpty()) {
			String filename = mf.getOriginalFilename();
			FileCopyUtils.copy(mf.getBytes(), new File(profileImageSaveDirectory, filename));
			blogBoard.setMainImg(filename);
		}
		blogBoardService.addBoard(blogBoard);
		return "redirect:detail.do?blogNo=" + blogNo + "&categoryNo=" + categoryNo;
		
	}

	@RequestMapping(value = "/makeblog.do", method = RequestMethod.GET)
	public String makeBlog() throws IOException {
		return "/blog/detail/makeblog";
	}

	@RequestMapping(value = "/makeblog.do", method = RequestMethod.POST)
	public String makeBlog(Model model, HttpSession session, BlogForm blogForm, String nickName) throws IOException {
		Blog blog = new Blog();
		User user = (User) session.getAttribute("LOGIN_USER");
		BeanUtils.copyProperties(blogForm, blog);
		MultipartFile mf = blogForm.getMainImg();
		String profileImageSaveDirectory = blogService.profileImageSaveDirectory();
		
		String filename = "profile.jpg";

		if (!mf.isEmpty()) {
			filename = mf.getOriginalFilename();
			FileCopyUtils.copy(mf.getBytes(), new File(profileImageSaveDirectory, filename));
		}
		blogService.setBasicBlog(blog, user, filename);
		blogService.addNewBlog(blog);

		return "redirect:makeblog2.do";
	}

	@RequestMapping(value = "/makeblog2.do", method = RequestMethod.GET)
	public String makeBlog2(Model model, HttpSession session) throws IOException {
		User user = (User) session.getAttribute("LOGIN_USER");
		Blog blog = blogService.getBlogByUserId(user.getId());

		BlogSubCategory blogSubCategory = new BlogSubCategory();
		blogSubCategory.setBlogNo(blog.getNo());
		blogSubCategory.setTitle("상위 카테고리");
		blogSubCategoryService.addNewSubCategory(blogSubCategory);
		return "redirect:makeblog3.do";
	}

	@RequestMapping(value = "/makeblog3.do", method = RequestMethod.GET)
	public String makeBlog3(Model model, HttpSession session) throws IOException {
		User user = (User) session.getAttribute("LOGIN_USER");
		List<BlogSubCategory> blogSubCategories = blogSubCategoryService.getBlogSubCategoriesByuserId(user.getId());
		BlogSubCategory blogSubCategory = blogSubCategories.get(0);
		BlogCategory blogCategory = new BlogCategory();
		blogCategory.setSubCategoryNo(blogSubCategory.getNo());
		blogCategory.setTitle("카테고리");
		blogCategoryService.addNewCategory(blogCategory);
		user.setIsHaveBlog("Y");
		userService.updateUser(user);
		return "redirect:mydetail.do";
	}
	@RequestMapping(value="/profile.do", method = RequestMethod.GET)
	public String profile(Model model,HttpSession session, Integer blogNo, Integer categoryNo,
			@RequestParam(value = "pno", required = false, defaultValue = "1") Integer pno,
			@RequestParam(value = "pno10", required = false, defaultValue = "1") Integer pno10) {
		List<BlogSubCategory> blogSubCategories = getBlogSubCategories(session, blogNo, model, categoryNo, pno, pno10);
		model.addAttribute("blogSubCategories",blogSubCategories);
		return "blog/detail/profile";
		
	}
	@RequestMapping(value="/addNeighbor.do", method = RequestMethod.GET)
	public String addNeighbor(Model model, HttpSession session, Integer blogNo) {
		Blog blog = blogService.getBlogByBlogNo(blogNo);
		User user = userService.getUserById(blog.getUserId());
		
		User me = (User) session.getAttribute("LOGIN_USER");
		if(me !=null) {
			Blog myblog = blogService.getBlogByUserId(me.getId());
			if(myblog != null) {
				Map<String, Object> isNeighborMap = new HashMap<String, Object>();
				isNeighborMap.put("myBlogNo", myblog.getNo());
				isNeighborMap.put("neighborhoodNo",blog.getNo());
				Integer isNeighbor = blogNeighborService.isNeighbor(isNeighborMap);
				if(isNeighbor == null) {
					model.addAttribute("isNeighbor","N");
				} else if(isNeighbor != null) {
					model.addAttribute("isNeighbor","Y");
				}
			}
		}
		model.addAttribute("blog",blog);
		model.addAttribute("user",user);
		return "blog/detail/addNeighbor";
	}
	
	@RequestMapping(value="/addNeighbor.do", method = RequestMethod.POST)
	public String addNeighborApply(Model model, HttpSession session,
									String eachNeighbor,
									String neighborMessage,
									Integer neighborBlogNo) {
		User user = (User) session.getAttribute("LOGIN_USER");
		Blog blog = blogService.getBlogByUserId(user.getId());
		int myBlogNo = blog.getNo();
		
		BlogNeighbor blogNeighbor = new BlogNeighbor();
		if(eachNeighbor.equals("oneway")) {
			blogNeighbor.setStatus("deny");
		} else if(eachNeighbor.equals("each")) {
			blogNeighbor.setStatus("applying");
		}
		blogNeighbor.setBlogNo(myBlogNo);
		blogNeighbor.setNo(neighborBlogNo);
		blogNeighbor.setMessage(neighborMessage);
		blogNeighbor.setType("All");
		blogNeighborService.addNewNeighborRequest(blogNeighbor);
		return "redirect:detail.do?blogNo="+neighborBlogNo;
	}
	
	@RequestMapping(value="getNeighborsMain.do", method = RequestMethod.GET)
	public @ResponseBody List<Map<String, Object>> manageNeighbor(HttpSession session, Model model) {
		User user = (User) session.getAttribute("LOGIN_USER");
		// 내 블로그 얻어오기
		Blog blog = blogService.getBlogByUserId(user.getId());
		List<Map<String, Object>> blogNeighbors = blogNeighborService.getNeighborIAdd(blog.getNo());
		return blogNeighbors;
	}
}

