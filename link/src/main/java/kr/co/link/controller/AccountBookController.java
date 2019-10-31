package kr.co.link.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.link.form.AccountBookExpenseForm;
import kr.co.link.form.AccountBookIncomeForm;
import kr.co.link.service.AccountBookTermService;
import kr.co.link.vo.AccountBookCategory;
import kr.co.link.vo.AccountBookTag;
import kr.co.link.vo.AccountBookTerm;
import kr.co.link.vo.AccountBookWriting;
import kr.co.link.vo.User;

@Controller
@RequestMapping(value = "/accountbook")
public class AccountBookController {
	@Autowired
	private AccountBookTermService accountbookService;

	/***** 가계부 *****/

	/*** 모달 ***/
	@RequestMapping(value = "/modal.do", method = RequestMethod.POST)
	public String addTerm(HttpSession session, Model model, AccountBookExpenseForm form) {

		User user = (User) session.getAttribute("LOGIN_USER");

		// 지출
		AccountBookTerm expense = new AccountBookTerm();

		expense.setCard(form.getCard());
		expense.setCash(form.getCash());

		AccountBookCategory accountBookCategory = new AccountBookCategory();
		accountBookCategory.setCategoryNo(form.getCategory());
		expense.setCategory(accountBookCategory);

		AccountBookTag accountBookTag = new AccountBookTag();
		accountBookTag.setTagName(form.getTag());

		expense.setDate(form.getDate());
		expense.setDetail(form.getDetail());
		expense.setGubun("지출");

		expense.setId(user.getId());

		accountbookService.addexpense(expense, accountBookTag);

		// 수입
		AccountBookTerm income = new AccountBookTerm();
		income.setCash(form.getCash());

		AccountBookCategory category = new AccountBookCategory();
		category.setCategoryNo(form.getCategory());
		income.setCategory(category);

		income.setDate(form.getDate());
		income.setDetail(form.getDetail());
		income.setGubun("수입");

		AccountBookTag tag = new AccountBookTag();
		tag.setTagName(form.getTag());
		income.setTag(tag);

		income.setId(user.getId());

		accountbookService.addIncome(income, tag);

		// 조회하기
		return "redirect:modal.do";
	}

	/*** 지출 내역 추가 ***/
	@RequestMapping(value = "/expense.do", method = RequestMethod.POST)
	public String addExpense(HttpSession session, Model model, AccountBookExpenseForm form) {

		User user = (User) session.getAttribute("LOGIN_USER");

		/* 지출.수입 vo */
		AccountBookTerm term = new AccountBookTerm();
		term.setCard(form.getCard());
		term.setCash(form.getCash());

		/* 지출 카테고리 */
		AccountBookCategory accountBookCategory = new AccountBookCategory();
		accountBookCategory.setCategoryNo(form.getCategory());
		term.setCategory(accountBookCategory);

		/* 태그 */
		AccountBookTag accountBookTag = new AccountBookTag();
		accountBookTag.setTagName(form.getTag());

		term.setDate(form.getDate());
		term.setDetail(form.getDetail());
		term.setGubun("지출");

		term.setId(user.getId());

		accountbookService.addexpense(term, accountBookTag);

		return "redirect:expense.do";
	}

	@RequestMapping(value = "/income.do", method = RequestMethod.POST)
	public String income(Model model, HttpSession session, AccountBookIncomeForm form) {

		/* 수입 내역 추가 */
		User user = (User) session.getAttribute("LOGIN_USER");

		AccountBookTerm term = new AccountBookTerm();
		term.setCash(form.getCash());

		AccountBookCategory category = new AccountBookCategory();
		category.setCategoryNo(form.getCategory());
		term.setCategory(category);

		term.setDate(form.getDate());
		term.setDetail(form.getDetail());
		term.setGubun("수입");

		AccountBookTag tag = new AccountBookTag();
		tag.setTagName(form.getTag());
		term.setTag(tag);

		term.setId(user.getId());

		accountbookService.addIncome(term, tag);

		return "redirect:income.do";
	}

	/*** 지출 내역 수정 ***/
	@RequestMapping(value = "/updateExpense.do", method = RequestMethod.POST)
	public String updateExpense(HttpSession session, Integer[] no, String[] date, String[] detail, Integer[] cash,
			Integer[] card, Integer[] category, String[] tag) throws ParseException {

		for (int i = 0; i < no.length; i++) {

			int termNo = no[i];
			int cash2 = cash[i];
			int card2 = card[i];

			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date2 = transFormat.parse(date[i]);

			AccountBookTerm term = accountbookService.getExpenseTermByNo(termNo);
			AccountBookCategory accountBookCategory = accountbookService.getCategoryByNo(category[i]);
			accountBookCategory.setCategoryNo(category[i]);

			term.setDate(date2);
			term.setDetail(detail[i]);
			term.setCash(cash2);
			term.setCard(card2);
			term.setCategory(accountBookCategory);

			accountbookService.updateExpense(term);
		}

		return "redirect:expense.do";
	}

	/*** 수입 내역 수정 ***/
	@RequestMapping(value = "/updateIncome.do", method = RequestMethod.POST)
	public String updateIncome(HttpSession session, Integer[] no, String[] date, String[] detail, Integer[] cash,
			Integer[] category, String[] tag) throws ParseException {

		for (int i = 0; i < no.length; i++) {
			int termNo = no[i];
			int cash2 = cash[i];

			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date2 = transFormat.parse(date[i]);

			AccountBookTerm term = accountbookService.getIncomeTermByNo(termNo);
			AccountBookCategory accountBookCategory = accountbookService.getCategoryByNo(category[i]);
			accountBookCategory.setCategoryNo(category[i]);

			term.setDate(date2);
			term.setCash(cash2);
			term.setDetail(detail[i]);
			term.setCategory(accountBookCategory);

			accountbookService.updateIncome(term);

		}
		return "redirect:income.do";
	}

	/*** 지출 내역 선택 삭제 ***/
	@RequestMapping(value = "/delExpense.do", method = RequestMethod.POST)
	public String deleteExpense(HttpSession session, int[] termNos) {
		User user = (User) session.getAttribute("LOGIN_USER");

		accountbookService.deleteTerm(termNos);

		return "redirect:expense.do";
	}

	/*** 지출 내역 전체 삭제 ***/
	@RequestMapping(value = "/delAllexpense.do", method = RequestMethod.POST)
	public String deleteAllExpense(HttpSession session, int[] termNos) {
		User user = (User) session.getAttribute("LOGIN_USER");

		accountbookService.deleteAllExpense();

		return "redirect:expense.do";
	}

	/*** 수입 내역 선택 삭제 ***/
	@RequestMapping(value = "/delincome.do", method = RequestMethod.POST)
	public String deleteAllIncome(HttpSession session, int[] termNos) {
		User user = (User) session.getAttribute("LOGIN_USER");

		accountbookService.deleteTerm(termNos);

		return "redirect:income.do";
	}

	/*** 수입 내역 전체 삭제 ***/
	@RequestMapping(value = "/delAllincome.do", method = RequestMethod.POST)
	public String deleteIncome(HttpSession session, int[] termNos) {
		User user = (User) session.getAttribute("LOGIN_USER");

		accountbookService.deleteAllIncome();

		return "redirect:income.do";
	}

	/*** 지출 내역 조회 ***/
	@RequestMapping(value = "/expense.do", method = RequestMethod.GET)
	public String expenseList(Model model, HttpSession session, String userId) {

		User user = (User) session.getAttribute("LOGIN_USER");
		userId = user.getId();

		// 지출내역
		List<AccountBookTerm> expenseList = accountbookService.getExpenseByuserId(userId);
		model.addAttribute("expenseList", expenseList);

		// 지출카테고리
		List<AccountBookCategory> expenseCategory = accountbookService.getExpenseCategory();
		model.addAttribute("expenseCategory", expenseCategory);

		// 지출 cash,card 합계
		long totalCash = 0;
		long totalCard = 0;

		for (AccountBookTerm term : expenseList) {
			totalCard += term.getCard();
			totalCash += term.getCash();
		}
		model.addAttribute("totalCash", totalCash);
		model.addAttribute("totalCard", totalCard);

		// 카테고리별 지출&수입총금액 조회
		List<HashMap<String, Object>> totalExpense = accountbookService.getCategoryAndExpenseByCategoryNo(userId);
		model.addAttribute("totalExpense", totalExpense);

		return "accountbook/a/main_expense";
	}

	/*** 수입 내역 조회 ***/
	@RequestMapping(value = "/income.do")
	public String incomeList(Model model, HttpSession session, String userId) {

		User user = (User) session.getAttribute("LOGIN_USER");
		userId = user.getId();

		// 수입 내역
		List<AccountBookTerm> incomeList = accountbookService.getIncomeByuserId(userId);
		model.addAttribute("incomeList", incomeList);

		// 수입 카테고리
		List<AccountBookCategory> incomeCategory = accountbookService.getIncomeCategory();
		model.addAttribute("incomeCategory", incomeCategory);

		// 수입 합계
		int totalCash = 0;
		for (AccountBookTerm term : incomeList) {
			totalCash += term.getCash();
		}
		model.addAttribute("totalCash", totalCash);

		List<HashMap<String, Object>> totalIncome = accountbookService.getCategoryAndIncomeByCategoryNo(userId);
		model.addAttribute("totalIncome", totalIncome);

		return "accountbook/a/main_income";
	}

	/***** 보고서 *****/

	@RequestMapping(value = "/monthly.do") /* 월보고서 */
	public String monthlyReport(@RequestParam(value = "month", required = false, defaultValue = "") String month,
			Model model, HttpSession session, String userId) {

		User user = (User) session.getAttribute("LOGIN_USER");

		/* 월간 지출 수입 총금액 */
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("userId", user.getId());
		if (!month.isEmpty()) {
			param.put("date", month);
		}

		AccountBookTerm monthlyTerm = accountbookService.getMonthlyTotalTermByDate(param);
		model.addAttribute("monthlyTerm", monthlyTerm);

		/* 해당월의 카테고리별 총 지출금액 */
		if (!month.isEmpty()) {
			param.put("date", month);
		}
		List<AccountBookTerm> totalExpenseCategory = accountbookService.getMonthlyExpenseCategorybydate(param);
		model.addAttribute("totalExpenseCategory", totalExpenseCategory);

		/* 지출카테고리 */
		List<AccountBookCategory> expenseCategory = accountbookService.getExpenseCategory();
		model.addAttribute("expenseCategory", expenseCategory);
		return "accountbook/b/report_monthly";
	}

	@RequestMapping(value = "/annual.do") /* 연보고서 */
	public String annualReport(@RequestParam(value = "year", required = false, defaultValue = "") String year,
			Model model, HttpSession session, String userId) {

		User user = (User) session.getAttribute("LOGIN_USER");

		/* 연간 지출 수입 총금액 */
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("userId", user.getId());
		if (!year.isEmpty()) {
			param.put("date", year);
		}

		AccountBookTerm annualTerm = accountbookService.getAnnualTotalTermByDate(param);
		model.addAttribute("annualTerm", annualTerm);

		/* 해당 연도 카테고리별 총 지출 */
		if (!year.isEmpty()) {
			param.put("date", year);
		}
		List<AccountBookTerm> totalExpenseCategory = accountbookService.getAnnualExpenseCategorybydate(param);
		model.addAttribute("totalExpenseCategory", totalExpenseCategory);

		return "accountbook/b/report_annual";
	}

	@RequestMapping(value = "/analysis.do") /* 지출분석 */
	public String analysis(String userId, Model model, HttpSession session) {

		User user = (User) session.getAttribute("LOGIN_USER");
		userId = user.getId();

		/* 전체기간 지출 수입 총 금액 */
		AccountBookTerm totalTerm = accountbookService.getTotalTerm(userId);
		model.addAttribute("totalTerm", totalTerm);

		/* 전체 기간 지출 top5 */
		List<HashMap<String, Object>> expenseTop5 = accountbookService.getTop5Expense(userId);
		model.addAttribute("top5", expenseTop5);

		/* 전체 기간 낭비 top5 */
		List<HashMap<String, Object>> wasteTop5 = accountbookService.getTop5Waste(userId);
		model.addAttribute("wasteTop5", wasteTop5);

		return "accountbook/b/report_analysis";
	}

	/***** 월결산 *****/

	@RequestMapping(value = "/writingForm.do")
	public String form() {

		return "accountbook/c/monthlyAccount_form";
	}

	@RequestMapping(value = "/addWriting.do", method = RequestMethod.POST) /* 월결산 추가 */
	public String addWriting(HttpSession session, String title, String contents, String publicYN, String userId,
			String writer) {
		User user = (User) session.getAttribute("LOGIN_USER");

		AccountBookWriting Writing = new AccountBookWriting();

		Writing.setTitle(title);
		Writing.setUserId(user.getId());
		Writing.setContents(contents);
		Writing.setPublicYN(publicYN);
		Writing.setWriter(user.getId());

		accountbookService.addWriting(Writing);

		return "redirect:mylist.do";
	}

	@RequestMapping(value = "/mylist.do") /* 목록(개인) 조회 */
	public String myList(Model model, HttpSession session, String userId) {
		User user = (User) session.getAttribute("LOGIN_USER");
		userId = user.getId();

		List<AccountBookWriting> myList = accountbookService.getMyListByUserId(userId);
		model.addAttribute("myList", myList);

		return "accountbook/c/monthlyAccount_myList";
	}

	/*
	 * @RequestMapping(value = "/list.do") 목록(전체) 조회 public String allList(Model
	 * model) {
	 * 
	 * List<AccountBookWriting> allList = accountbookService.getAllList();
	 * model.addAttribute("allList",allList); return
	 * "accountbook/c/monthlyAccount_allList"; }
	 */
	@RequestMapping(value = "/detail.do") /* 디테일 */
	public String detail(Model model, HttpSession session, String userId) {
		User user = (User) session.getAttribute("LOGIN_USER");
		userId = user.getId();

		List<AccountBookWriting> myList = accountbookService.getMyListByUserId(userId);
		model.addAttribute("myList", myList);

		return "accountbook/c/monthlyAccount_detail";
	}

	/***** 예산:주요기능:글저장, 수정, 삭제 *****/
	/*
	 * @RequestMapping(value = "/budget.do") 예산 조회 public String listbudget(Model
	 * model,String userId) {
	 * 
	 * List<HashMap<String,
	 * Object>>categoryExpense=accountbookService.getCategoryAndExpenseByCategoryNo(
	 * userId); model.addAttribute("categoryExpense",categoryExpense);
	 * 
	 * 
	 * return "accountbook/budget_form"; }
	 * 
	 * @RequestMapping(value = "/updateBudget.do", method = RequestMethod.POST) 예산
	 * 수정 public String updateBudget() { return "redirect:budget.do";
	 * 
	 * }
	 * 
	 * @RequestMapping(value = "addBudget.do", method = RequestMethod.POST) 예산 저장
	 * public String addBudget() {
	 * 
	 * return "redirect:budget.do"; }
	 * 
	 * @RequestMapping(value = "delBudbet.do", method = RequestMethod.POST) 예산 삭제
	 * public String delBudget() { return "redirect:budget.do"; }
	 */

	/* 날짜 변환 */
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), false));
	}

}
