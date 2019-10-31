package kr.co.link.dao;


import org.springframework.stereotype.Repository;

import kr.co.link.vo.Tv;
import kr.co.link.vo.TvHistory;
import kr.co.link.vo.TvLater;

@Repository
public interface TvRecentDao {

	public Tv getTvRecentById(TvHistory tvHistory);
	public void addRecent(TvHistory tvHistory);
	public void updateRecentDate(TvHistory tvHistory);
	
	
}
