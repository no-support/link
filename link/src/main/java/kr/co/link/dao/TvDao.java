package kr.co.link.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.co.link.vo.Tv;

@Repository
public interface TvDao {

	public List<Tv> getVideoTop20();
	public List<Tv> getVideoLikes();
	public List<Tv> getVideoRecent();
	public List<Tv> getVideoByOpt(Map<String, Object> opt);
	public List<Tv> getVideoByLater(String userId);
	public List<Tv> getVideoByLikes(String userId);
	public List<Tv> getVideoByHistory(String userId);
	public void deleteHistoryByLater(Map<String, Object> info);
	public void deleteHistoryByRecent(Map<String, Object> info);
	public void deleteHistoryByLike(Map<String, Object> info);
	public Tv getVideoDetailByNo(int vno);
	public List<Tv> getPlaylistByNo(int vno);
	public void updateVideo(Tv tv);
	public int getCountLikeById(Map<String, Object> info);	
	public int getCountByLike(int vno);
	
}
