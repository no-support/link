package kr.co.link.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.BeanProperty.Bogus;

import kr.co.link.dao.BlogBoardDao;
import kr.co.link.vo.BlogBoard;
import kr.co.link.vo.BlogBoardComment;
import kr.co.link.vo.BlogBoardLikes;

@Service
public class BlogBoardServiceImpl implements BlogBoardService{

	@Autowired
	private BlogBoardDao blogBoardDao;
	
	@Override
	public List<BlogBoard> getBoardByCategory(int categoryNo) {
		List<BlogBoard> blogBoards = blogBoardDao.getBoardByCategory(categoryNo); 
		return blogBoards;
	}

	@Override
	public BlogBoard getBoardByboardNo(int boardNo) {
		BlogBoard blogBoard = blogBoardDao.getBoardByboardNo(boardNo);
		return blogBoard;
	}

	@Override
	public void addBoard(BlogBoard blogBoard) {
		blogBoardDao.addBoard(blogBoard);
	}

	@Override
	public Integer countBoardsByCategoryId(Integer categoryNo) {
		Integer boardCount = blogBoardDao.countBoardsByCategoryId(categoryNo);
		return boardCount;
	}

	@Override
	public List<BlogBoard> getBoardsByRange(Map<String, Object> rangeMap) {
		return blogBoardDao.getBoardsByRange(rangeMap);
	}

	@Override
	public Integer getBoardsCountByCategoryNo(Integer catNo) {
		return blogBoardDao.getBoardsCountByCategoryNo(catNo);
	}
	@Override
	public List<Map<String, Object>> getBlogsWhoLikeBoard(Integer boardNo) {
		return blogBoardDao.getBlogsWhoLikeBoard(boardNo);
	}	
	@Override
	public void addNewBlogLikes(BlogBoardLikes blogBoardLikes) {
		blogBoardDao.addNewBlogLikes(blogBoardLikes);
	}
	@Override
	public BlogBoardLikes getisLikedBoardByBloardNoMyBlogNo(Map<String, Object> map) {
		return blogBoardDao.getisLikedBoardByBloardNoMyBlogNo(map);
	}
	@Override
	public void deleteBlogLikes(Map<String, Object> map) {
		blogBoardDao.deleteBlogLikes(map);
	}
	@Override
	public Integer getBoardLikesCount(Integer boardNo) {
		return blogBoardDao.getBoardLikesCount(boardNo);
	}
	@Override
	public List<Map<String, Object>> getBoardCommentByBoardNoParentCno(Map<String, Object> map) {
		return blogBoardDao.getBoardCommentByBoardNoParentCno(map);
	}
	@Override
	public List<Map<String, Object>> getBoardCommentReplies(Map<String, Object> map) {
		return blogBoardDao.getBoardCommentReplies(map);
	}
	@Override
	public Integer getCommentsCountByBoardNo(Integer boardNo) {
		return blogBoardDao.getCommentsCountByBoardNo(boardNo);
	}
	@Override
	public void addNewComment(BlogBoardComment blogBoardComment) {
		blogBoardDao.addNewComment(blogBoardComment);
	}
	@Override
	public void updateBoard(BlogBoard blogBoard) {
		blogBoardDao.updateBoard(blogBoard);
	}
	@Override
	public void deleteBoardByBoardNo(Integer boardNo) {
		blogBoardDao.deleteBoardByBoardNo(boardNo);
	}
	@Override
	public List<Map<String, Object>> getBoardCommentsInMyBlog(Map<String, Object> map) {
		return blogBoardDao.getBoardCommentsInMyBlog(map);
	}

}
