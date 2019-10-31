package kr.co.link.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.link.dao.JisikinCategoryDao;
import kr.co.link.vo.JisikinCategory;

@Service
public class JisikinCategoryServiceImpl implements JisikinCategoryService{

	@Autowired
	private JisikinCategoryDao categoryDao;
	
	@Override
	public List<JisikinCategory> getParentCategory() {
		return categoryDao.getParentCategory();
	}
	
	@Override
	public List<JisikinCategory> getSubCategoryByParent(int parentNo) {
		return categoryDao.getSubCategoryByParent(parentNo);
	}
}
