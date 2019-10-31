package kr.co.link.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.link.dao.SeriesEpisodeDao;
import kr.co.link.vo.SeriesEpisode;

@Service
public class SeriesEpisodeServiceImpl implements SeriesEpisodeService {

	@Autowired
	SeriesEpisodeDao seriesEpisodeDao;
	
	@Override
	public List<SeriesEpisode> getEpisodesByVodNo(int no) {
		return seriesEpisodeDao.getEpisodesByVodNo(no);
	}

	@Override
	public int getCountEpisodesByNo(int no) {
		return seriesEpisodeDao.getCountEpisodesByNo(no);
	}

	@Override
	public List<SeriesEpisode> getEpisodesInUserCarts(String id) {
		return seriesEpisodeDao.getEpisodesInUserCarts(id);
	}

	@Override
	public SeriesEpisode getEpisodeByNo(int no) {
		return seriesEpisodeDao.getEpisodeByNo(no);
	}


	
}
