package com.kh.helloffice.hr.entity;

import java.sql.Date;

import lombok.Data;

@Data
public class CareerDto {
	private long empNo;
	private long careerNo;
	private String compName;
	private String crRank;
	private String crPosition;
	private Date crEntryDate;
	private Date crResignDate;
	private String crJobType;
	private String careerDel;

}
