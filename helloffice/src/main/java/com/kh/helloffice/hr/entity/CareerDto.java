package com.kh.helloffice.hr.entity;

import java.util.Date;

import lombok.Data;

@Data
public class CareerDto {
	private long empNo;
	private long careerNo;
	private String compName;
	private String rank;
	private String position;
	private Date entryDate;
	private Date resignDate;
	private String jobType;
	private String careerDel;

}
