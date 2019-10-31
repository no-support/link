package kr.co.link.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.link.dao.BlogThemeDao;
import kr.co.link.vo.BlogTheme;

@Service
public class BlogThemeServiceImpl implements BlogThemeService{

	@Autowired
	private BlogThemeDao blogThemeDao;
	
	@Override
	public List<BlogTheme> getAllThemes() {
		List<BlogTheme> blogThemes = blogThemeDao.getAllThemes();
		return blogThemes;
	}

}
