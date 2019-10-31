package kr.co.link.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.link.dao.SeriesReviewDao;
import kr.co.link.vo.SeriesReview;

@Service
public class SeriesReviewServiceImpl implements SeriesReviewService{

	@Autowired
	SeriesReviewDao seriesReviewDao;
	
	@Override
	public List<SeriesReview> getReviewsByVodNo(int no) {
		return seriesReviewDao.getReviewsByVodNo(no);
	}

	@Override
	public int getCountReviewsByVodNo(int no) {
		return seriesReviewDao.getCountReviewsByVodNo(no);
	}

	@Override
	public void addReview(SeriesReview review) {
		seriesReviewDao.addReview(review);
		
	}

	
}
