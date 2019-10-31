package kr.co.link.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.link.vo.JisikinAnswer;
import kr.co.link.vo.JisikinRank;

@Repository
public interface JisikinAnswerDao {

	public void addAnswer(JisikinAnswer jisikinAnswer);
	public List<JisikinAnswer> getAnswersByJisikinNo(int jisikinNo);
	public List<JisikinRank> getRank();
	public JisikinAnswer getAnswerByNo(int no);
	// 답변 채택 업데이트
	public void updateAnswerByNo(JisikinAnswer jisikinAnswer);
}
