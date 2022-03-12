package com.kh.helloffice.hr.entity;

import java.util.Date;

import lombok.Data;

@Data
public class CareerDto {
	private long empNo;
	private long careerNo;
	private String compName;
	private String cRank;
	private String cPosition;
	private Date cEntryDate;
	private Date cResignDate;
	private String cJobType;
	private String careerDel;

}
