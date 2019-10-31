package kr.co.link.dao;

import java.util.List;

import kr.co.link.vo.JisikinTag;

public interface JisikinTagDao {

	public void addTag(JisikinTag jiskinTag);
	public List<JisikinTag> getTagByJisikin(int jisikinNo);
	public List<JisikinTag> getPopularTagTop10();
}
