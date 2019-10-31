package kr.co.link.service;


import kr.co.link.vo.Tv;
import kr.co.link.vo.TvHistory;

public interface TvRecentService {

	public Tv getTvRecentById(TvHistory tvHistory);
	public void addRecent(TvHistory tvHistory);
	public void updateRecentDate(TvHistory tvHistory);
}
