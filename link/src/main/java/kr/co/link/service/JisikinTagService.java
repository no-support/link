package kr.co.link.service;

import java.util.List;

import kr.co.link.vo.JisikinTag;

public interface JisikinTagService {

	public void addTag(JisikinTag jiskinTag);
	public List<JisikinTag> getTagByJisikin(int jisikinNo);
	public List<JisikinTag> getPopularTagTop10();
}
