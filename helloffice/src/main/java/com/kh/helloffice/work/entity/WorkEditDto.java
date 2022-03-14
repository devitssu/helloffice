package com.kh.helloffice.work.entity;

import lombok.Data;

@Data
public class WorkEditDto {

	private int editNo;
	private int empNo;
	private int inoutNo;
	private String editDate;
	private String editIntime;
	private String editOuttime;
	private String editType;
	private String editContent;
	private String editYn;
	
}
