package kr.co.link.dao;


import org.springframework.stereotype.Repository;

import kr.co.link.vo.Tv;
import kr.co.link.vo.TvLater;

@Repository
public interface TvLaterDao {

	public Tv getTvLaterById(TvLater tvLater);
	public void addLater(TvLater tvLater);
	
	
}
