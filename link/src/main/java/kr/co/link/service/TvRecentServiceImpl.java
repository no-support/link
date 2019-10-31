package kr.co.link.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.link.dao.TvRecentDao;
import kr.co.link.vo.Tv;
import kr.co.link.vo.TvHistory;

@Service
public class TvRecentServiceImpl implements TvRecentService {
	
	@Autowired
	private TvRecentDao tvRecentDao;
	
	@Override
	public void addRecent(TvHistory tvHistory) {
		tvRecentDao.addRecent(tvHistory); 
	}
	@Override
	public Tv getTvRecentById(TvHistory tvHistory) {
		Tv tv= tvRecentDao.getTvRecentById(tvHistory);
		return tv;
	}
	@Override
	public void updateRecentDate(TvHistory tvHistory) {
		tvRecentDao.updateRecentDate(tvHistory);
	}
	
}
