package kr.co.link.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.link.vo.BlogTheme;

@Repository
public interface BlogThemeDao {
	public List<BlogTheme> getAllThemes();
}
