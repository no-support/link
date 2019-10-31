package kr.co.link.service;

import java.util.List;

import kr.co.link.dao.SeriesEpisodeDao;
import kr.co.link.vo.SeriesEpisode;

public interface SeriesEpisodeService {

	List<SeriesEpisode> getEpisodesByVodNo(int no);
	int getCountEpisodesByNo(int no);
	List<SeriesEpisode> getEpisodesInUserCarts(String id);
	SeriesEpisode getEpisodeByNo(int no);
}
