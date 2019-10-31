package kr.co.link.dao;

import java.util.List;
import java.util.Map;

import kr.co.link.vo.SeriesCart;

public interface SeriesCartDao {

	List<Map<String, Object>> getCartsById(String id);
	void addCart(SeriesCart seriesCart);
	void deleteCartByEpisodeNo(int no);
	void deleteCartById(String id);
	void deleteCartByUserEpisodeNo(Map<String, Object> map);
}
