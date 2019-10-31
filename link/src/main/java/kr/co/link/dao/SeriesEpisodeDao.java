package kr.co.link.dao;

import java.util.List;
import java.util.Map;

import kr.co.link.vo.SeriesEpisode;
import kr.co.link.vo.SeriesNotice;
import kr.co.link.vo.SeriesVod;

public interface SeriesEpisodeDao {

	List<SeriesEpisode> getEpisodesByVodNo(int no);
	int getCountEpisodesByNo(int no);
	List<SeriesEpisode> getEpisodesInUserCarts(String id);
	SeriesEpisode getEpisodeByNo(int no);
}
