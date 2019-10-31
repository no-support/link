package kr.co.link.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.link.dao.BlogDao;
import kr.co.link.vo.Blog;
import kr.co.link.vo.User;

@Service
public class BlogServiceImpl implements BlogService{
	
	@Autowired
	private BlogDao blogDao;
	
	public Blog getBlogByUserId(String userId) {
		Blog blog = blogDao.getBlogByUserId(userId);
		return blog;
	}

	@Override
	public Blog getBlogByBlogNo(Integer blogNo) {
		Blog blog = blogDao.getBlogByBlogNo(blogNo);
		return blog;
	}

	@Override
	public List<Blog> get3BlogByVisits(Map<String, Object> map) {
		return blogDao.get3BlogByVisits(map);
	}

	@Override
	public void updateBlogByBlogNo(Blog blog) {
		blogDao.updateBlogByBlogNo(blog);
	}

	@Override
	public void addNewBlog(Blog blog) {
		blogDao.addNewBlog(blog);
	}

	@Override
	public void setBasicBlog(Blog blog, User user, String filename) {
		blog.setMainImg(filename);
		blog.setTheme("theme11.jpg");
		blog.setUserId(user.getId());
		blog.setBackgroundColor("#ffffff");
		blog.setFontColor("#7a706d");
		blog.setOpacity(0.9);
		blog.setAtagColor("#000000");
		blog.setHrColor("#666666");
		blog.setBodyColor("#f8dfcf");
		blog.setPageNumBackgroundColor("#e9f3f0");
		blog.setPageNumColor("#b0b0b0");
		blog.setFirstCol("profile");
		blog.setSecondCol("category");
		blog.setThirdCol("bloginfo");
		blog.setLayout(1);
		blog.setPageNumBorderColor("#f2f2f2");
	}
	@Override
	public List<Blog> getAllblogs() {
		return blogDao.getAllblogs();
	}
	@Override
	public List<Map<String, Object>> getAllBlogsByType(Map<String, Object> map) {
		return blogDao.getAllBlogsByType(map);
	}
	@Override
	public Integer getBlogsCountByType(Map<String, Object> map) {
		return blogDao.getBlogsCountByType(map);
	}
	
	@Override
	public String profileImageSaveDirectory() {
		String profileImageSaveDirectory = "C:/Users/BM/git/link/link/src/main/webapp/resources/images";
//		profileImageSaveDirectory = "C:/Users/BMAHN/git/link4/link/src/main/webapp/resources/images";
		
		return profileImageSaveDirectory;
	}
	public List<Map<String, Object>> dateChange(List<Map<String, Object>> blogLists){
		for(Map<String, Object> eachblog : blogLists) {
			Date date = new Date();
			Date createDate = (Date) eachblog.get("CREATEDATE");
			
			long diff = date.getTime()-createDate.getTime();
			long sec = diff / 1000;
			long minute = diff/ 60000;
			long hour = diff/ 3600000;
			long dates = diff / 86400000;
			long months = diff / (86400000 * 30);
			
			if(sec <= 60) {
				eachblog.put("howLongDate", sec+"초 전");
			} else {
				if(minute <= 60) {
					
					eachblog.put("howLongDate", minute+"분 전");
				} else {
					if(hour <= 24) {
						eachblog.put("howLongDate", hour+ "시간 전");
					} else {
						if(dates <= 30) {
							eachblog.put("howLongDate", dates+  "일 전");
						} else {
							eachblog.put("howLongDate", months+  "개월 전");
						}
					}
				}
			}
		}
		return blogLists;
	}
}
