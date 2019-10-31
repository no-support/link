package kr.co.link.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.link.dao.SeriesCartDao;
import kr.co.link.dao.SeriesEpisodeDao;
import kr.co.link.dao.SeriesOrderDao;
import kr.co.link.dao.UserDao;
import kr.co.link.vo.SeriesEpisode;
import kr.co.link.vo.SeriesOrder;
import kr.co.link.vo.User;

@Transactional
@Service
public class SeriesOrderServiceImpl implements SeriesOrderService {

	@Autowired
	SeriesCartDao seriesCartDao;
	
	@Autowired
	SeriesEpisodeDao seriesEpisodeDao;
	
	@Autowired
	SeriesOrderDao seriesOrderDao;

	@Autowired
	UserDao userDao;
	

	@Override
	public List<Map<String, Object>> getOrdersById(String id) {
		return seriesOrderDao.getOrdersById(id);
	}

	@Override
	public void addOrder(Map<String, Object> map, int[] chk, String userId) {
		
		User user = userDao.getUserById(userId);
		
		int totalPrice = 0;
		for (int i = 0; i < chk.length; i++) {
			SeriesEpisode episode = seriesEpisodeDao.getEpisodeByNo(chk[i]);
			int price = episode.getPrice();
			
			map.put("eno", chk[i]);
			seriesOrderDao.addOrder(map);
			
			totalPrice +=  price;
			
			seriesCartDao.deleteCartByEpisodeNo(chk[i]);
		}
		user.setPoint(user.getPoint() - totalPrice);
		userDao.updateUser(user);
	}
	

	
}
