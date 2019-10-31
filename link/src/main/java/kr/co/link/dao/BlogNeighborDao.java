package kr.co.link.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.co.link.vo.Blog;
import kr.co.link.vo.BlogBoard;
import kr.co.link.vo.BlogNeighbor;

@Repository
public interface BlogNeighborDao {
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
