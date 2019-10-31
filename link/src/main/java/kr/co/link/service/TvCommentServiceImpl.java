package kr.co.link.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.link.dao.TvCommentDao;
@Service
public class TvCommentServiceImpl implements TvCommentService {

	@Autowired
	private TvCommentDao tvCommentDao;
	
	@Override
	public void addComment(Map<String, Object> contents) {
		tvCommentDao.addComment(contents);
	}
	@Override
	public List<Map<String, Object>> getAllCommentByVno(Map<String, Object>param) {
		List<Map<String, Object>> comments =  tvCommentDao.getAllCommentByVno(param);
		
		return comments;
	}
}
