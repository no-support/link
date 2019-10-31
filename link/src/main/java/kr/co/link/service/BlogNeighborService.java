package kr.co.link.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.co.link.vo.Blog;
import kr.co.link.vo.BlogNeighbor;
import kr.co.link.vo.User;

@Transactional
public interface BlogNeighborService {
	List<Blog> getNeighborByBlogNo(Map<String, Object> neighborMap);
	List<Map<String, Object>> getNeighborBlogMap(Integer blogNo);
	Integer isNeighbor(Map<String, Object> isNeighborMap);
	List<Map<String, Object>> getNeighborRequest(Map<String, Object> map);
	List<Map<String, Object>> getNeighborNoByBlogNo(Map<String, Object> map);
	void addNewNeighborRequest(BlogNeighbor blogNeighbor);
	void updateBlogNeighbor(BlogNeighbor blogNeighbor);
	BlogNeighbor getNeighborByMyBlogNo(Map<String, Object> map);
	Integer getNeighborCountsByBlogNo(Integer blogNo);
	List<BlogNeighbor> getNeighborsByMyBlogNo(Integer blogNo);
	List<Map<String, Object>> getNeighborIAdd(Integer myBlogNo);
	void deleteNeighborByMyBlogNoNeighborBlogNo(Map<String, Object> map);
	List<Map<String, Object>>getPaginationByMap(Map<String, Object> map);
	Integer getPaginationByMapRows(Integer myBlogNo);
}
