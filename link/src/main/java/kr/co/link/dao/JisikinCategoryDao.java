package kr.co.link.dao;

import java.util.List;

import kr.co.link.vo.JisikinCategory;

public interface JisikinCategoryDao {

	public List<JisikinCategory> getParentCategory();
	public List<JisikinCategory> getSubCategoryByParent(int parentNo);
}
