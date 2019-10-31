package kr.co.link.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.link.dao.SeriesLikeDao;
import kr.co.link.vo.SeriesLike;

@Service
public class SeriesLikeServiceImpl implements SeriesLikeService {

	@Autowired
	SeriesLikeDao seriesLikeDao;
	
	@Override
	public int getCountLikesByVodNo(int no) {
		return seriesLikeDao.getCountLikesByVodNo(no);
	}

	@Override
	public void addLike(SeriesLike seriesLike) {
		seriesLikeDao.addLike(seriesLike);
	}

	@Override
	public void deleteLike(SeriesLike seriesLike) {
		seriesLikeDao.deleteLike(seriesLike);
	}

	@Override
	public int getCountUserLikes(SeriesLike seriesLike) {
		return seriesLikeDao.getCountUserLikes(seriesLike);
	}

	@Override
	public List<Map<String, Object>> getLikesById(String id) {
		return seriesLikeDao.getLikesById(id);
	}

}
