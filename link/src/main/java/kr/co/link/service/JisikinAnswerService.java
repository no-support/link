package kr.co.link.service;

import java.util.List;

import kr.co.link.vo.JisikinAnswer;
import kr.co.link.vo.JisikinRank;

public interface JisikinAnswerService {

	public void addAnswer(JisikinAnswer jisikinAnswer);
	public List<JisikinAnswer> getAnswersByJisikinNo(int jisikinNo);
	public List<JisikinRank> getRank();
	public JisikinAnswer getAnswerByNo(int no);
	// 답변 채택 업데이트
	public void updateAnswerByNo(int ano);
}
