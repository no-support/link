package kr.co.link.dao;

import java.util.List;
import java.util.Map;

import kr.co.link.vo.SeriesNotice;
import kr.co.link.vo.SeriesVod;

public interface SeriesNoticeDao {

	List<SeriesNotice> getNotices3();
	
	int getNoticeCount(Map<String, Object> param);
	List<SeriesNotice> getNotices(Map<String, Object> param);
	void addNotice(SeriesNotice notice);
	SeriesNotice getNotice(int no);
	
}
