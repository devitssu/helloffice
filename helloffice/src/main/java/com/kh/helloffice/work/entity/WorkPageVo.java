package com.kh.helloffice.work.entity;

import lombok.Data;

@Data
public class WorkPageVo {

	//4개의 값을 알고있어야 밑에 5개의 값을 구해줄 수 있다.
	private int currentPage; //현재 페이지
	private int cntPerPage;  //페이지 하나당 보여줄 ROW갯수
	private int pageBtnCnt;  //페이지 이동 버튼 개수
	private int totalRow;    // 테이블의 전체 row 갯수
	//      ->
	private int startRow;    // 디비가서 조회할 rownum의 시작
	private int endRow;      // 디비가서 조회할 rownum의 끝
	private int startPage;   //시작 페이지
	private int endPage;     //마지막 페이지
	private int lastPage;    //DB의 ROW 기준으로 마지막 페이지는 몇인지
	
	public WorkPageVo(String currentPageStr, int cntPerPage, int pageBtnCnt, int totalRow) {
		this.currentPage = Integer.parseInt(currentPageStr);
		this.cntPerPage = cntPerPage;
		this.pageBtnCnt = pageBtnCnt;
		this.totalRow = totalRow;
		calc(currentPage, cntPerPage, pageBtnCnt, totalRow);
	}//생성되는 순간 4개의 값을 받아주고 계산을 통해 5개의 값을 세팅하도록 만들어준다.
	
	
	//나머지 5개 계산식
	private void calc(int currentPage, int cntPerPage, int pageBtnCnt, int totalRow) {
		
		this.setEndRow(this.getCurrentPage() * this.getCntPerPage());
		this.setStartRow(this.getEndRow() - this.getCntPerPage() + 1);
		
		int lastPage = this.getTotalRow() / this.getCntPerPage();
		if(this.getTotalRow() / this.getCntPerPage() > 0) {
			lastPage++;
		}
		this.setLastPage(lastPage);
		
		int endPage = this.getCurrentPage() / this.getPageBtnCnt();
		if(this.getCurrentPage() % this.getPageBtnCnt() > 0) {
			endPage++;
		}
		
		//그냥 화면쪽에서 처리
//		if(endPage > lastPage) {
//			endPage = lastPage;
//		}
		
		
		this.setEndPage(endPage * this.getPageBtnCnt());
		
		this.setStartPage(this.getEndPage() - this.getPageBtnCnt() + 1);
	}




	
}
