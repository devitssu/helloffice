package com.kh.helloffice.todo.entity;

import java.util.Date;

import lombok.Data;

@Data
public class ToDoDto {
	
	private long todoNo;
	private long empNo;
	private String content;
	private char isComplete;
	private Date createdTime;

}
