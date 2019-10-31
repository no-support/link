package kr.co.link.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.link.dao.TvLikeDao;
import kr.co.link.vo.TvLikes;import oracle.net.aso.o;

@Service
public class TvLikeServiceImpl implements TvLikeService {
	
	@Autowired
	private TvLikeDao tvLikeDao;
	
	
	@Override
	public void addLike(TvLikes tvLike) {
		tvLikeDao.addLike(tvLike);
	}

	@Override
	public int getCountLikeById(Map<String, Object> info) {
		int count = tvLikeDao.getCountLikeById(info);
		
		return count;
	}
	@Override
	public int getCountByLike(int vno) {
		int count = tvLikeDao.getCountByLike(vno);
		return count;
	}
	@Override
	public void deleteLikeById(Map<String, Object> info) {
		tvLikeDao.deleteLikeById(info);
	}
	
}
