package kr.co.link.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.co.link.vo.BlogCategory;
import kr.co.link.vo.BlogSubCategory;

@Transactional
public interface BlogCategoryService {
	public List<BlogCategory> getCategoryBySubCategory(int subCategoryId);
	public List<BlogCategory> getAllCategoryBySubCategory(int subCategoryNo);
	public BlogCategory getOneCategoryByOrder(Map<String, Object> map);
	public BlogCategory getCategoryByCategoryNo(Integer categoryNo);
	public BlogCategory getAllCategoryByCategoryNo(Integer categoryNo);
	void addNewCategory(BlogCategory blogCategory);
	void updateCategory(BlogCategory blogCategory);
	void deleteCategory(Integer categoryNo);
}
