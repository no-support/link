package kr.co.link.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.co.link.vo.BlogTheme;

@Transactional
public interface BlogThemeService {
	public List<BlogTheme> getAllThemes();
}
