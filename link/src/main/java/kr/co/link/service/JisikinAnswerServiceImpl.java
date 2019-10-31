package kr.co.link.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.link.dao.JisikinAnswerDao;
import kr.co.link.vo.JisikinAnswer;
import kr.co.link.vo.JisikinRank;

@Service
public class JisikinAnswerServiceImpl implements JisikinAnswerService {

	@Autowired
	private JisikinAnswerDao answerDao;
	
	@Override
	public void addAnswer(JisikinAnswer jisikinAnswer) {
		answerDao.addAnswer(jisikinAnswer);
	}
	
	@Override
	public List<JisikinAnswer> getAnswersByJisikinNo(int jisikinNo) {
		return answerDao.getAnswersByJisikinNo(jisikinNo);
	}
	
	@Override
	public List<JisikinRank> getRank() {
		return answerDao.getRank();
	}
	
	@Override
	public JisikinAnswer getAnswerByNo(int no) {
		return answerDao.getAnswerByNo(no);
	}
	
	// 답변 채택 업데이트
	@Override
	public void updateAnswerByNo(int ano) {
		JisikinAnswer answer = getAnswerByNo(ano);
		answer.setSelectedYn("Y");
		answerDao.updateAnswerByNo(answer);
	}
}
