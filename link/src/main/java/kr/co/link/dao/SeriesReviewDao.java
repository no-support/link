package kr.co.link.dao;

import java.util.List;

import kr.co.link.vo.SeriesReview;

public interface SeriesReviewDao {

	List<SeriesReview> getReviewsByVodNo(int no);
	int getCountReviewsByVodNo(int no);
	void addReview(SeriesReview review);
}
