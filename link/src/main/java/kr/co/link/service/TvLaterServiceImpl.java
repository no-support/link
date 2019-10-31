package kr.co.link.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.link.dao.TvLaterDao;
import kr.co.link.vo.Tv;
import kr.co.link.vo.TvLater;

@Service
public class TvLaterServiceImpl implements TvLaterService {

	@Autowired
	private TvLaterDao tvLaterDao;
	
	@Override
	public void addLater(TvLater tvLater) {
		tvLaterDao.addLater(tvLater);
		
	}
	@Override
	public Tv getTvLaterById(TvLater tvLater) {
		
		Tv later = tvLaterDao.getTvLaterById(tvLater);
		return later;
	}
}
