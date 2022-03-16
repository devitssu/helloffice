package com.kh.helloffice.calendar.entity;

import lombok.Data;

@Data
public class EventDto {
	
	private long eventNo;
	private long empNo;
	private String title;
	private String startTime;
	private String endTime;
	private char allday;

}
