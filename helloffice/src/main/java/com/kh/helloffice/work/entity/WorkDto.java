package com.kh.helloffice.work.entity;

import java.util.Date;

import lombok.Data;

@Data
public class WorkDto {

	private Number inoutNo;
	private Number empNo;
	private Date inDate;
	private Date inTime;
	private Date outTime;
}
