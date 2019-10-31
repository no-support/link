package kr.co.link.dao;

import java.util.List;
import java.util.Map;

import kr.co.link.vo.SeriesLike;
import kr.co.link.vo.SeriesNotice;
import kr.co.link.vo.SeriesVod;

public interface SeriesLikeDao {

	int getCountLikesByVodNo(int no);
	void addLike(SeriesLike seriesLike);
	void deleteLike(SeriesLike seriesLike);
	int getCountUserLikes(SeriesLike seriesLike);
	List<Map<String, Object>> getLikesById(String id);
}
