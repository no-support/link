package kr.co.link.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.link.dao.AccountBookDao;
import kr.co.link.vo.AccountBookCategory;
import kr.co.link.vo.AccountBookTag;
import kr.co.link.vo.AccountBookTerm;
import kr.co.link.vo.AccountBookWriting;

@Service
public class AccountBookTermServiceImpl implements AccountBookTermService {
	@Autowired
	private AccountBookDao accountBookDao;
	
	/* 지출 추가 */
	@Override
	public void addexpense(AccountBookTerm term, AccountBookTag tag) {
		int termNo = accountBookDao.getTermNoSeq();
		term.setNo(termNo);
		accountBookDao.addexpense(term);
		
		tag.setTermNo(termNo);
		accountBookDao.addTag(tag);
		
	}
	
	/* 수입 추가 */
	@Override
	public void addIncome(AccountBookTerm term, AccountBookTag tag) {
		int termNo=accountBookDao.getTermNoSeq();
		term.setNo(termNo);
		accountBookDao.addIncome(term);
		
		tag.setTermNo(termNo);
		accountBookDao.addTag(tag);
		
	}
	/*지출 수정*/
	@Override
	public void updateExpense(AccountBookTerm term) {
  		accountBookDao.updateExpense(term);
	}
	/*수입 수정*/
	@Override
	public void updateIncome(AccountBookTerm term) {
		accountBookDao.updateIncome(term);
	}
	
	/*내역 선택 삭제*/
	@Override
	public void deleteTerm(int[] termNos) {
		for (int termNo : termNos) {
			accountBookDao.deleteTerm(termNo);
		}
	}
	
	/*지출내역 전체삭제*/
	@Override
	public void deleteAllExpense() {
		accountBookDao.deleteAllExpense();
		
	}
	/*수입내역 전체삭제*/
	@Override
	public void deleteAllIncome() {
		accountBookDao.deleteAllIncome();
	}
	
	
	/* 지출 조회 */
	@Override
	public List<AccountBookTerm> getExpenseByuserId(String userId) {
		return (List<AccountBookTerm>) accountBookDao.getExpenseByuserId(userId);
	}

	/* 수입 조회 */
	@Override
	public List<AccountBookTerm> getIncomeByuserId(String userId) {
		return (List<AccountBookTerm>) accountBookDao.getIncomeByuserId(userId);
	}
	
	/*지출 카테고리 조회*/
	@Override
	public List<AccountBookCategory> getExpenseCategory() {
		return accountBookDao.getExpenseCategory();
	}
	/*수입 카테고리 조회*/
	@Override
	public List<AccountBookCategory> getIncomeCategory() {
		return accountBookDao.getIncomeCategory();
	}
	/*카테고리별 지출총금액 조회*/
	@Override
	public List<HashMap<String, Object>> getCategoryAndExpenseByCategoryNo(String userId) {
		return accountBookDao.getCategoryAndExpenseByCategoryNo(userId);
	}
	/*카테고리별 수입총금액 조회*/
	@Override
	public List<HashMap<String, Object>> getCategoryAndIncomeByCategoryNo(String userId) {
		return accountBookDao.getCategoryAndIncomeByCategoryNo(userId);
	}
	/*해당 월의 수입지출*/
	@Override
	public AccountBookTerm getMonthlyTotalTermByDate(Map<String, Object> param) {
		return accountBookDao.getMonthlyTotalTermByDate(param);
	}
	/*해당 년도의 수입지출*/
	@Override
	public AccountBookTerm getAnnualTotalTermByDate(Map<String, Object> param) {
		return accountBookDao.getAnnualTotalTermByDate(param);
	}
	/*총기간의 수입지출*/
	@Override
	public AccountBookTerm getTotalTerm(String userId) {
		return accountBookDao.getTotalTerm(userId);
	}
	
	/*해당 월의 카테고리별 총지출*/
	@Override
	public List<AccountBookTerm> getMonthlyExpenseCategorybydate(Map<String, Object> monthlyCategory) {
		return accountBookDao.getMonthlyExpenseCategorybydate(monthlyCategory);
	}
	/*해당 년도의 카테고리별 총지출*/
	@Override
	public List<AccountBookTerm> getAnnualExpenseCategorybydate(Map<String, Object> annualCategory) {
		return accountBookDao.getAnnualExpenseCategorybydate(annualCategory);
	}
	
	@Override
	public List<HashMap<String, Object>> getTop5Expense(String userId) {
		return accountBookDao.getTop5Expense(userId);
	}
	
	@Override
	public List<HashMap<String, Object>> getTop5Waste(String userId) {
		return accountBookDao.getTop5Waste(userId);
	}
	@Override
	public AccountBookTerm getExpenseTermByNo(int termNo) {
		return accountBookDao.getExpenseTermByNo(termNo);
	}
	@Override
	public AccountBookTerm getIncomeTermByNo(int termNo) {
		return accountBookDao.getIncomeTermByNo(termNo);
	}
	/*예산*/
	
	@Override
	  public AccountBookTerm getBudget(int categoryNo) { 
		return accountBookDao.getBudget(categoryNo); 
	}

	@Override
	public AccountBookCategory getCategoryByNo(int categoryNo) {
		return accountBookDao.getCategoryByNo(categoryNo);
	}
	
	/*월결산 이야기*/
	@Override
	public void addWriting(AccountBookWriting writing) {

		accountBookDao.addWriting(writing);
	}
    @Override
    public List<AccountBookWriting> getMyListByUserId(String userId) {
    	return accountBookDao.getMyListByUserId(userId);
    }
    @Override
    public List<AccountBookWriting> getAllList() {
    	return accountBookDao.getAllList();
    }
    
}
