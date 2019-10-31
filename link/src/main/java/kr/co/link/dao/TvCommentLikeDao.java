package kr.co.link.dao;


import java.util.Map;

import org.springframework.stereotype.Repository;



@Repository
public interface TvCommentLikeDao {

	public void addCommentStatus(Map<String, Object> info);
	public void updateCommentStatus(Map<String, Object>status);
	public void deleteCommentStatus(Map<String, Object> info);
	public Map<String, Object> getCountLikeAndHate(Map<String, Object> info);
}
