package com.kh.helloffice.hr.entity;

import java.sql.Date;

import lombok.Data;

@Data
public class AcademicDto {
	private long empNo;
	private long acaNo;
	private String acaName;
	private String acaType;
	private String major;
	private Date enrollDate;
	private Date graduDate;
	private String graduState;
	private String acaDel;
}
