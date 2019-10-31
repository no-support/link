package kr.co.link.service;

import java.util.List;

import kr.co.link.vo.JisikinCategory;

public interface JisikinCategoryService {

	public List<JisikinCategory> getParentCategory();
	public List<JisikinCategory> getSubCategoryByParent(int parentNo);
}
