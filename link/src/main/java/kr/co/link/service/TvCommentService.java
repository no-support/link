package kr.co.link.service;

import java.util.List;
import java.util.Map;

public interface TvCommentService {

	public void addComment(Map<String, Object> contents);
	public List<Map<String, Object>> getAllCommentByVno(Map<String, Object>param);
}
