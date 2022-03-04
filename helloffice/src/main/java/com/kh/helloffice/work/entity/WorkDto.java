package com.kh.helloffice.work.entity;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

@Data
public class WorkDto {

	private int inoutNo;
	private int empNo;
	private String inDate;
	private String inTime;
	private String outTime;
}
