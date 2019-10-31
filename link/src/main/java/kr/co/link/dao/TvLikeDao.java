package kr.co.link.dao;


import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.co.link.vo.TvLikes;

@Repository
public interface TvLikeDao {

	public void addLike(TvLikes tvLike);
	public int getCountLikeById(Map<String, Object> info);
	public int getCountByLike(int vno);
	public void deleteLikeById(Map<String, Object> info);
}
