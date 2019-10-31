package kr.co.link.service;

import java.util.List;
import java.util.Map;

import kr.co.link.vo.SeriesNotice;

public interface SeriesNoticeService {

	List<SeriesNotice> get3Notices();
	
	List<SeriesNotice> getNoticesbyparam(Map<String, Object> param);
	int getNoticeCount(Map<String, Object> param);
	
	void addNotice(SeriesNotice notice);
	SeriesNotice getNotice(int no);
}
