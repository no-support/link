package kr.co.link.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.co.link.vo.Blog;
import kr.co.link.vo.User;

@Transactional
public interface BlogService {
	public Blog getBlogByUserId(String id);
	public Blog getBlogByBlogNo(Integer blogNo);
	public List<Blog> get3BlogByVisits(Map<String, Object> map);
	public void updateBlogByBlogNo(Blog blog);
	public void addNewBlog(Blog blog);
	void setBasicBlog(Blog blog, User user, String filename);
	List<Blog> getAllblogs();
	List<Map<String, Object>> getAllBlogsByType(Map<String, Object> map);
	Integer getBlogsCountByType(Map<String, Object> map);
	String profileImageSaveDirectory();
	List<Map<String, Object>> dateChange(List<Map<String, Object>> blogLists);
}
