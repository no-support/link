package kr.co.link.service;

import java.util.List;

import kr.co.link.vo.SeriesReview;

public interface SeriesReviewService {

	List<SeriesReview> getReviewsByVodNo(int no);
	int getCountReviewsByVodNo(int no);
	void addReview(SeriesReview review);
}
