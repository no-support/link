package kr.co.link.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.link.dao.SeriesReviewReputationDao;

@Service
public class SeriesReviewReputationServiceImpl implements SeriesReviewReputationService {

	@Autowired
	SeriesReviewReputationDao seriesReviewReputationDao;

	@Override
	public int getCountReputationLikes(int no) {
		return seriesReviewReputationDao.getCountReputationLikes(no);
	}

	@Override
	public int getCountReputationDislike(int no) {
		return seriesReviewReputationDao.getCountReputationDislike(no);
	}
	
	
}
