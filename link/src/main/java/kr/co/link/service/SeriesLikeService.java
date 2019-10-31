package kr.co.link.service;

import java.util.List;
import java.util.Map;

import kr.co.link.vo.SeriesLike;

public interface SeriesLikeService {

	int getCountLikesByVodNo(int no);
	void addLike(SeriesLike seriesLike);
	void deleteLike(SeriesLike seriesLike);
	int getCountUserLikes(SeriesLike seriesLike);
	List<Map<String, Object>> getLikesById(String id);
}
