package kr.co.link.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.link.dao.SeriesCartDao;
import kr.co.link.vo.SeriesCart;
import kr.co.link.vo.SeriesEpisode;
import kr.co.link.vo.User;

@Service
public class SeriesCartServiceImpl implements SeriesCartService {

	@Autowired
	SeriesCartDao seriesCartDao;
	
	@Override
	public List<Map<String, Object>> getCartsById(String id) {
		return seriesCartDao.getCartsById(id);
	}

	@Override
	public void addCart(int[] episodeNos, String id) {
		for (int no : episodeNos) {
			SeriesEpisode episode = new SeriesEpisode();
			User user = new User();
			SeriesCart cart = new SeriesCart();
			
			episode.setNo(no);
			user.setId(id);
			cart.setEpisode(episode);
			cart.setUser(user);
			
			seriesCartDao.addCart(cart);
		}
		
	}
	@Override
	public void deleteCartByEpisodeNo(int no) {
		seriesCartDao.deleteCartByEpisodeNo(no);
	}

	@Override
	public void deleteCartById(String id) {
		seriesCartDao.deleteCartById(id);
	}

	@Override
	public void deleteCartByUserEpisodeNo(Map<String, Object> map) {
		seriesCartDao.deleteCartByUserEpisodeNo(map);
	}


}
