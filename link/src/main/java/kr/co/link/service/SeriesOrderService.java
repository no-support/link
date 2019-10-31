package kr.co.link.service;

import java.util.List;
import java.util.Map;

import kr.co.link.dao.SeriesEpisodeDao;
import kr.co.link.vo.SeriesEpisode;
import kr.co.link.vo.SeriesOrder;

public interface SeriesOrderService {

	List<Map<String, Object>> getOrdersById(String id);
	void addOrder(Map<String, Object> map, int[] chk, String userId);
}
