package kr.co.link.service;

import java.util.List;
import java.util.Map;

import kr.co.link.vo.SeriesCart;

public interface SeriesCartService {

	List<Map<String, Object>> getCartsById(String id);
	void addCart(int[] episodeNos, String id);
	void deleteCartByEpisodeNo(int no);
	void deleteCartById(String id);
	void deleteCartByUserEpisodeNo(Map<String, Object> map);
}
