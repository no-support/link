package kr.co.link.vo;

public class JisikinPagination {
	private int page;			// 현재 페이지 번호		
	private int size;			// 한 화면에 표시할 행의 개수 보통 10 또는 15, 20, 30, 40, 50, 60, 80, 100
	private int pages;			// 한 화면에 표시할 페이지 번호의 개수 5 또는 10
	private int records;		// 전체 데이터 개수

	private int totalPages;		// 전체 페이지 개수
	private int totalBlocks;	// 전체 블록 개수
	private int currentBlock;	// 현재 블록

	public JisikinPagination(int page, int records) {   
		this.page = page;
		this.size = 10;
		this.pages = 10;
		this.records = records;
		init();
	}

	public JisikinPagination(int page, int size, int records) {   
		this.page = page;
		this.size = size;
		this.pages = 10;
		this.records = records;
		init();
	}

	public JisikinPagination(int page, int size, int pages, int records) {   
		this.page = page;
		this.size = size;
		this.pages = pages;
		this.records = records;
		init();
	}

	// 현재 요청한 페이지 번호를 제공
	public int getPage() {
		return page;
	}

	// 1페이지면 true
	public boolean isFirst() {
		if (page == 1) {
			return true;
		}
		return false;
	}

	// 마지막 페이지면 true
	public boolean isLast() {
		if (page == totalPages) {
			return true;
		}
		return false;
	}

	// 블록의 첫 번호 Ex 6, 11
	public int getBegin() {
		if (records <= 0) {
			return 0;
		}

		if (currentBlock >= totalBlocks) {
			currentBlock = totalBlocks;
		}
		return (currentBlock - 1) * pages + 1;
	}

	// 블록의 끝 번호 Ex 15, 20
	public int getEnd() {
		if (records <= 0) {
			return 0;
		}
		if (currentBlock >= totalBlocks) {
			return totalPages;
		}
		return currentBlock*pages;
	}

	private void init() {
		if (page <= 0) {
			page = 1;
		}
		totalPages = (int) (Math.ceil((double) records/size));
		if (page >= totalPages) {
			page = totalPages;
		}
		totalBlocks = (int) (Math.ceil((double) totalPages/pages));
		currentBlock = (int) (Math.ceil((double) page/pages));
	}
}

