package kr.co.link.dao;

import java.util.List;
import java.util.Map;

import kr.co.link.vo.SeriesCart;
import kr.co.link.vo.SeriesOrder;

public interface SeriesOrderDao {

	List<Map<String, Object>> getOrdersById(String id);
	void addOrder(Map<String, Object> map);
}
