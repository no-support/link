package kr.co.link.service;

import java.util.List;
import java.util.Map;

import kr.co.link.vo.Tv;

public interface TvService {

	public List<Tv> getVideoTop20();
	public List<Tv> getVideoLikes();
	public List<Tv> getVideoRecent();
	public List<Tv> getVideoByOpt(Map<String, Object> opt);
	public List<Tv> getVideoByLater(String userId);
	public List<Tv> getVideoByLikes(String userId);
	public List<Tv> getVideoByHistory(String userId);
	public void deleteHistoryByLater(Map<String, Object> laterInfo);
	public void deleteHistoryByRecent(Map<String, Object> recentInfo);
	public void deleteHistoryByLike(Map<String, Object> likeInfo);
	public Tv getVideoDetailByNo(int vno);
	public List<Tv> getPlaylistByNo(int vno);
	public void updateVideo(Tv tv);
}
