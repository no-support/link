package kr.co.link.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.co.link.vo.BlogCategory;

@Repository
public interface BlogCategoryDao {
	public List<BlogCategory> getCategoryBySubCategory(int subCategoryNo);
	public List<BlogCategory> getAllCategoryBySubCategory(int subCategoryNo);
	public BlogCategory getOneCategoryByOrder(Map<String, Object> map);
	public BlogCategory getCategoryByCategoryNo(Integer categoryNo);
	public BlogCategory getAllCategoryByCategoryNo(Integer categoryNo);
	void addNewCategory(BlogCategory blogCategory);
	void updateCategory(BlogCategory blogCategory);
	void deleteCategory(Integer categoryNo);
	
}
