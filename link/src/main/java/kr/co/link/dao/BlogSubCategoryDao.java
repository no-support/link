package kr.co.link.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.link.vo.BlogSubCategory;

@Repository
public interface BlogSubCategoryDao {
	public List<BlogSubCategory> getSubCategoryByBlogNo(int blogNo);
	List<BlogSubCategory> getAllSubCategoryByBlogNo(int blogNo);
	
	void addNewSubCategory(BlogSubCategory blogSubCategory);
	void addNewSubCategoryWithNo(BlogSubCategory blogSubCategory);
	void updateSubCategory(BlogSubCategory blogSubCategory);
	
	BlogSubCategory getOneSubCategoryByBlogNo(Integer blogNo);
	BlogSubCategory getSubCategoryBySubCatNo(Integer subCatNo);
	BlogSubCategory getAllSubCategoryBySubCatNo(Integer subCatNo);
	
	BlogSubCategory selectLastSubCategory(Integer subCatNo);
	Integer getNextBlogSequence();
	void deleteSubCategory(Integer subCatNo);
}
