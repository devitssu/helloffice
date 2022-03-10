package com.kh.helloffice.work.entity;

public class WorkPageVo {

	//페이지당 게시물 수
	public static final int PAGE_SCALE = 8;
	
	//화면당 페이지 수
	public static final int BLOCK_SCALE = 5;
	
	private int curPage;
	private int prevPage;
	private int nextPage;
	private int totPage;
	private int totBlock;
	private int curBlock;
	private int prevBlock;
	private int nextBlock;
	//WHERE rn BETWWN #{start} AND #{end}
	private int pageBegin; // #{start}
	private int pageEnd; // #{end}
	// [이전] blockBegin -> 41 42 43 44 45 46 47 48 49 50 [다음]
	private int blockBegin; //현재 페이지 블록의 시작번호
	// [이전] 41 42 43 44 45 46 47 48 49 50 <- blockEnd [다음]
	private int blockEnd; // 현재페이지 블록의 끝번호
	
	//생성자
	//WorkPageVo(레코드 갯수, 현재 페이지 번호)
	public WorkPageVo(int count, int curPage) {
		curBlock = 1; //현재 페이지 블록 번호
		this.curPage = curPage; //현재 페이지 설정
		setTotPage(count); //전체 페이지 갯수 계산
		setPageRange();
		setTotBlock(); //전체 피이지 블록 갯수 계산
		setBlockRange();//페이지 블록의 시작, 끝 번호 계산
	}
	
	public void setBlockRange() {
		//*현재 페이지가 몇번째 페이지 블록에 속하는지 계산
		curBlock = (int)Math.ceil((curPage-1) / BLOCK_SCALE)+1;
		//*현재 페이지 블록의 시작, 끝 번호 계산
		blockBegin = (curBlock-1) * BLOCK_SCALE+1;
		//페이지 블록의 끝 번호
		blockEnd = blockBegin+BLOCK_SCALE-1;
		//*마지막 블록이 범위를 초과하지 않도록 계싼
		if(blockEnd > totPage) blockEnd = totPage;
		//*이전을 눌렀을 때 이동할 페이지 번호
		prevPage = (curPage == 1)? 1:(curBlock-1) * BLOCK_SCALE;
		//*다음을 눌렀을 때 이동할 페이지 번호
		nextPage = curBlock > totBlock ? (curBlock * BLOCK_SCALE) : (curBlock * BLOCK_SCALE)+1;
		//마지막 페이지가 범위를 초과하지 않도록 처리
		if(nextPage >= totPage) nextPage = totPage;
	}
	
	public void setPageRange() {
		//WHERE rn BETWEEN #{start} AND #{end}
		// 시작 번호 = (현재페이지 -1) * 페이지당 게시물수 +1
		pageBegin = (curPage-1) * PAGE_SCALE +1;
		// 끝 번호 = 시작번호 + 페이지당 게시물 수 -1
		pageEnd = pageBegin+PAGE_SCALE -1;
	}
	
	//getter/setter
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getPrevPage() {
		return prevPage;
	}
	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public int getTotPage() {
		return totPage;
	}
	public void setTotPage(int count) {
		//Math.ceil(실수) 올림 처리
		totPage = (int) Math.ceil(count * 1.0 / PAGE_SCALE);
	}
	public int getTotBlock() {
		return totBlock;
	}
	//페이지 블록의 갯수 계산(총 100페이지라면 10개의 블록)
	public void setTotBlock() {
		//전체 페이지 갯수 / 10
		// 91 / 10 => 9.1 =>10개
		totBlock = (int)Math.ceil(totPage / BLOCK_SCALE);
	}
	public int getCurBlock() {
		return curBlock;
	}
	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}
	public int getPrevBlock() {
		return prevBlock;
	}
	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}
	public int getNextBlock() {
		return nextBlock;
	}
	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}
	public int getPageBegin() {
		return pageBegin;
	}
	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}
	public int getPageEnd() {
		return pageEnd;
	}
	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}
	public int getBlockBegin() {
		return blockBegin;
	}
	public void setBlockBegin(int blockBegin) {
		this.blockBegin = blockBegin;
	}
	public int getBlockEnd() {
		return blockEnd;
	}
	public void setBlockEnd(int blockEnd) {
		this.blockEnd = blockEnd;
	}
	
	
	
	
	
	//////////////////////////////수업 내용
//	//4개의 값을 알고있어야 밑에 5개의 값을 구해줄 수 있다.
//	private int currentPage; //현재 페이지
//	private int cntPerPage;  //페이지 하나당 보여줄 ROW갯수
//	private int pageBtnCnt;  //페이지 이동 버튼 개수
//	private int totalRow;    // 테이블의 전체 row 갯수
//	//      ->
//	private int startRow;    // 디비가서 조회할 rownum의 시작
//	private int endRow;      // 디비가서 조회할 rownum의 끝
//	private int startPage;   //시작 페이지
//	private int endPage;     //마지막 페이지
//	private int lastPage;    //DB의 ROW 기준으로 마지막 페이지는 몇인지
//	
//	public WorkPageVo(String currentPageStr, int cntPerPage, int pageBtnCnt, int totalRow) {
//		this.currentPage = Integer.parseInt(currentPageStr);
//		this.cntPerPage = cntPerPage;
//		this.pageBtnCnt = pageBtnCnt;
//		this.totalRow = totalRow;
//		calc(currentPage, cntPerPage, pageBtnCnt, totalRow);
//	}//생성되는 순간 4개의 값을 받아주고 계산을 통해 5개의 값을 세팅하도록 만들어준다.
//	
//	
//	//나머지 5개 계산식
//	private void calc(int currentPage, int cntPerPage, int pageBtnCnt, int totalRow) {
//		
//		this.setEndRow(this.getCurrentPage() * this.getCntPerPage());
//		this.setStartRow(this.getEndRow() - this.getCntPerPage() + 1);
//		
//		int lastPage = this.getTotalRow() / this.getCntPerPage();
//		if(this.getTotalRow() / this.getCntPerPage() > 0) {
//			lastPage++;
//		}
//		this.setLastPage(lastPage);
//		
//		int endPage = this.getCurrentPage() / this.getPageBtnCnt();
//		if(this.getCurrentPage() % this.getPageBtnCnt() > 0) {
//			endPage++;
//		}
//		
//		//그냥 화면쪽에서 처리
////		if(endPage > lastPage) {
////			endPage = lastPage;
////		}
//		
//		
//		this.setEndPage(endPage * this.getPageBtnCnt());
//		
//		this.setStartPage(this.getEndPage() - this.getPageBtnCnt() + 1);
//	}




	
}
