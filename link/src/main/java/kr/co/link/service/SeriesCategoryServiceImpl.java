package kr.co.link.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.link.dao.SeriesCategoryDao;
import kr.co.link.vo.SeriesCategory;

@Service
public class SeriesCategoryServiceImpl implements SeriesCategoryService {

	@Autowired
	SeriesCategoryDao seriesCategoryDao;

	@Override
	public SeriesCategory getCategoryByVodNo(int no) {
		return seriesCategoryDao.getCategoryByVodNo(no);
	}
	
	
}
