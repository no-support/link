package kr.co.link.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.co.link.vo.Blog;

@Repository
public interface BlogDao {
	public Blog getBlogByUserId(String userId);
	public Blog getBlogByBlogNo(Integer blogNo);
	public List<Blog> get3BlogByVisits(Map<String, Object> map);
	public void updateBlogByBlogNo(Blog blog);
	public void addNewBlog(Blog blog);
	List<Blog> getAllblogs();
	List<Map<String, Object>> getAllBlogsByType(Map<String, Object> map);
	Integer getBlogsCountByType(Map<String, Object> map);
}
