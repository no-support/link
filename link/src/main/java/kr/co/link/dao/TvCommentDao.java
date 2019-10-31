package kr.co.link.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import oracle.net.aso.o;



@Repository
public interface TvCommentDao {

	public void addComment(Map<String, Object> comment);
	public List<Map<String, Object>> getAllCommentByVno(Map<String, Object> param);
}
