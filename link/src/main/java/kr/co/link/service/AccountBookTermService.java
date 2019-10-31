package kr.co.link.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.link.form.AccountBookExpenseForm;
import kr.co.link.vo.AccountBookCategory;
import kr.co.link.vo.AccountBookTag;
import kr.co.link.vo.AccountBookTerm;
import kr.co.link.vo.AccountBookWriting;

public interface AccountBookTermService {
	/*가계부*/
	void addexpense(AccountBookTerm term, AccountBookTag tag); 	/*지출 내역추가*/
	void addIncome(AccountBookTerm term, AccountBookTag tag); 	/*수입 내역추가*/
	void deleteTerm(int[] termNo);								/*지출&수입 선택삭제*/
	void deleteAllExpense();								/* 지출 전체삭제*/
	void deleteAllIncome();									/* 수입 전체삭제*/
	List<AccountBookTerm> getExpenseByuserId(String userId);	/*지출내역 조회*/
	List<AccountBookTerm> getIncomeByuserId(String userId);		/*수입내역 조회*/
	List<AccountBookCategory> getExpenseCategory(); /*지출 카테고리 조회*/
	List<AccountBookCategory> getIncomeCategory();	/*수입 카테고리 조회*/
	List<HashMap<String, Object>> getCategoryAndExpenseByCategoryNo(String userId);	 /*카테고리별 지출총금액 조회*/
	List<HashMap<String, Object>> getCategoryAndIncomeByCategoryNo(String userId);	/*카테고리별 수입총금액 조회*/
	/*보고서*/
	AccountBookTerm getMonthlyTotalTermByDate(Map<String, Object> param); /*월간 지출 수입 총금액*/
	AccountBookTerm getAnnualTotalTermByDate(Map<String, Object> param);	/*연간 지출 수입 총금액*/
	AccountBookTerm getTotalTerm(String userId);							/*전체 수입 총금액*/
	List<AccountBookTerm> getMonthlyExpenseCategorybydate (Map<String, Object> monthlyCategory);	/*카테고리별 월간 총 지출*/
	List<AccountBookTerm> getAnnualExpenseCategorybydate (Map<String, Object> annualCategory);		/*카테고리별 연간 총 지출*/
	List<HashMap<String, Object>> getTop5Expense(String userId);	/*전체기간 중 지출 top5*/
	List<HashMap<String, Object>> getTop5Waste(String userId);		/*전체기간 중 낭비 top5*/
	void updateExpense(AccountBookTerm term);			/*수입 내역 수정*/
	void updateIncome(AccountBookTerm term);			/*수입 내역 수정*/
	AccountBookTerm getExpenseTermByNo(int termNo);
	AccountBookTerm getIncomeTermByNo(int termNo);
	/*예산*/
	 AccountBookTerm getBudget(int categoryNo);
	/*월결산*/
	void addWriting(AccountBookWriting writing);
	List<AccountBookWriting> getMyListByUserId(String userId);
	List<AccountBookWriting> getAllList();
	
	AccountBookCategory getCategoryByNo(int categoryNo);
}
