package kr.co.link.service;


import kr.co.link.vo.Tv;
import kr.co.link.vo.TvLater;

public interface TvLaterService {

	public Tv getTvLaterById(TvLater tvLater);
	public void addLater(TvLater tvLater);
}
