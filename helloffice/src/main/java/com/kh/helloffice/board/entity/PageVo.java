package com.kh.helloffice.board.entity;

import lombok.Data;

@Data
public class PageVo {
	
	private int page;
	private int count;
	private int totalRow;
	private int pageNum;
	
	private int last;
	private int startRow;
	private int endRow;
	private int startPage;
	private int endPage;
	
	private long boardNo;
	private String category;
	private String search;
	
	
	public PageVo(int page, int count, int pageNum, int totalRow) {
		this.page = page;
		this.count = count;
		this.pageNum = pageNum;
		this.totalRow = totalRow;
		calc(page, count, pageNum, totalRow);
	}
	
	
	public PageVo(String page, String count, int pageNum, int totalRow) {
		this.page = Integer.parseInt(page);
		this.count = Integer.parseInt(count);
		this.pageNum = pageNum;
		this.totalRow = totalRow;
		calc(this.page, this.count, pageNum, totalRow);
	
	}


	private void calc(int page, int count, int pageNum, int totalRow) {
		
		this.endRow = page * count;
		this.startRow = this.endRow - count + 1;
		
		int lastPage = totalRow / count;
		if( totalRow % count > 0) lastPage++;
		this.last = lastPage;
		
		int endPage = page / pageNum;
		if(page % count > 0) endPage++;
		endPage = endPage * pageNum;
		if( endPage > lastPage) endPage = lastPage;
		this.endPage = endPage;
		
		int startPage = endPage - pageNum + 1;
		if (startPage < 1) startPage = 1;
		this.startPage = startPage;
	}

}
