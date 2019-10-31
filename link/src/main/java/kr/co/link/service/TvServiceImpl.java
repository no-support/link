package kr.co.link.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.link.dao.TvDao;
import kr.co.link.vo.Tv;
import kr.co.link.vo.TvHistory;
import kr.co.link.vo.TvLater;
import kr.co.link.vo.TvLikes;

@Service
public class TvServiceImpl implements TvService{

	@Autowired
	private TvDao tvdao;
	
	@Override
	public List<Tv> getVideoTop20() {
		List<Tv> tvs= tvdao.getVideoTop20();
		
		return tvs;
	}
	
	@Override
	public List<Tv> getVideoLikes() {
		List<Tv> likes = tvdao.getVideoLikes();
		return likes;
	}
	
	@Override
	public List<Tv> getVideoRecent() {
		List<Tv> recents = tvdao.getVideoLikes();
		return recents;
	}
	
	@Override
	public List<Tv> getVideoByOpt(Map<String, Object> opt) {
		
		List<Tv> videosByOpt= tvdao.getVideoByOpt(opt);
		
		return videosByOpt;
	}
	
	@Override
	public List<Tv> getVideoByLater(String userId) {
		List<Tv> laters = tvdao.getVideoByLater(userId);
		
		return laters;
		
	}
	
	@Override
	public List<Tv> getVideoByHistory(String userId) {
		List<Tv> recents = tvdao.getVideoByHistory(userId);
		
		return recents;
	}
	
	@Override
	public List<Tv> getVideoByLikes(String userId) {
		List<Tv> likes = tvdao.getVideoByLikes(userId);
		
		return likes;
	}
	
	@Override
	public void deleteHistoryByLater(Map<String, Object> laterInfo) {
		
		String userId = (String) laterInfo.get("userId");
		int[] vnos =(int[]) laterInfo.get("vno");
		
		for(int vno : vnos) {
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("userId", userId);
			info.put("vno", vno);
			
			tvdao.deleteHistoryByLater(info);
		}
	}
	
	@Override
	public void deleteHistoryByLike(Map<String, Object> likeInfo) {
		
		String userId = (String) likeInfo.get("userId");
		int[] vnos =(int[]) likeInfo.get("vno");
		
		for(int vno : vnos) {
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("userId", userId);
			info.put("vno", vno);
			
			tvdao.deleteHistoryByLike(info);
		}
		
	}
	
	@Override
	public void deleteHistoryByRecent(Map<String, Object> recentInfo) {
		
		String userId = (String) recentInfo.get("userId");
		int[] vnos =(int[]) recentInfo.get("vno");
		
		// 여러개의 값 삭제
		for(int vno : vnos) {
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("userId", userId);
			info.put("vno", vno);
			
			tvdao.deleteHistoryByRecent(info);
		}
		
	}
	
	@Override
	public List<Tv> getPlaylistByNo(int vno) {
		List<Tv> playlist= tvdao.getPlaylistByNo(vno);
		
		return playlist;
	}
	
	@Override
	public Tv getVideoDetailByNo(int vno) {
		Tv video = tvdao.getVideoDetailByNo(vno);
		return video;
	}
	
	@Override
	public void updateVideo(Tv tv) {
		tvdao.updateVideo(tv);
	}
	
}
