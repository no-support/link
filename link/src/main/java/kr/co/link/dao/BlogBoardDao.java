package kr.co.link.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.co.link.vo.BlogBoard;
import kr.co.link.vo.BlogBoardComment;
import kr.co.link.vo.BlogBoardLikes;

@Repository
public interface BlogBoardDao {
	public List<BlogBoard> getBoardByCategory(int categoryNo);
	public BlogBoard getBoardByboardNo(int boardNo);
	public void addBoard(BlogBoard blogBoard);
	public Integer countBoardsByCategoryId(Integer categoryNo);
	List<BlogBoard> getBoardsByRange(Map<String, Object> rangeMap);
	Integer getBoardsCountByCategoryNo(Integer catNo);
	List<Map<String, Object>> getBlogsWhoLikeBoard(Integer boardNo);
	void addNewBlogLikes(BlogBoardLikes blogBoardLikes);
	BlogBoardLikes getisLikedBoardByBloardNoMyBlogNo(Map<String, Object> map);
	void deleteBlogLikes(Map<String, Object> map);
	Integer getBoardLikesCount(Integer boardNo);
	List<Map<String, Object>> getBoardCommentByBoardNoParentCno(Map<String, Object> map);
	List<Map<String, Object>> getBoardCommentReplies(Map<String, Object> map);
	Integer getCommentsCountByBoardNo(Integer boardNo);
	void addNewComment(BlogBoardComment blogBoardComment);
	void updateBoard(BlogBoard blogBoard);
	void deleteBoardByBoardNo(Integer boardNo);
	Integer getCommentCountByBoardNo(Integer boardNo);
	List<Map<String, Object>> getBoardCommentsInMyBlog(Map<String, Object> map);
}
