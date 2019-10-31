package kr.co.link.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.link.dao.BlogCategoryDao;
import kr.co.link.vo.BlogCategory;
import kr.co.link.vo.BlogSubCategory;

@Service
public class BlogCategoryServiceImpl implements BlogCategoryService{
	
	@Autowired
	private BlogCategoryDao blogCategoryDao;
	
	@Override
	public List<BlogCategory> getCategoryBySubCategory(int subCategoryNo) {
		List<BlogCategory> blogCategories = blogCategoryDao.getCategoryBySubCategory(subCategoryNo);
		return blogCategories;
	}

	@Override
	public BlogCategory getOneCategoryByOrder(Map<String, Object> map) {
		return blogCategoryDao.getOneCategoryByOrder(map);
	}

	@Override
	public BlogCategory getCategoryByCategoryNo(Integer categoryNo) {
		BlogCategory blogCategory = blogCategoryDao.getCategoryByCategoryNo(categoryNo);
		return blogCategory;
	}

	@Override
	public void addNewCategory(BlogCategory blogCategory) {
		blogCategoryDao.addNewCategory(blogCategory);
	}

	@Override
	public void updateCategory(BlogCategory blogCategory) {
		blogCategoryDao.updateCategory(blogCategory);
	}

	@Override
	public void deleteCategory(Integer categoryNo) {
		blogCategoryDao.deleteCategory(categoryNo);
	}

	@Override
	public List<BlogCategory> getAllCategoryBySubCategory(int subCategoryNo) {
		List<BlogCategory> blogCategories = blogCategoryDao.getAllCategoryBySubCategory(subCategoryNo);
		return blogCategories;
	}

	@Override
	public BlogCategory getAllCategoryByCategoryNo(Integer categoryNo) {
		BlogCategory blogCategory = blogCategoryDao.getAllCategoryByCategoryNo(categoryNo);
		return blogCategory;
	}

}
