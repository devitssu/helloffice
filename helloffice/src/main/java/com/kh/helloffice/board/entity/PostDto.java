package com.kh.helloffice.board.entity;

import java.util.Date;

import lombok.Data;

@Data
public class PostDto {
	
	private long postNo;
	private long empNo;
	private String empName;
	private long boardNo;
	private String title;
	private String category;
	private String content;
	private Date createdTime;
	private char isDeleted;
	private String depName;
	private String timeString;
	private String dateString;
	

}
