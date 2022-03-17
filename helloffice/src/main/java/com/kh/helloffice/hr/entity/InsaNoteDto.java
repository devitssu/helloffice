package com.kh.helloffice.hr.entity;

import java.sql.Date;

import lombok.Data;

@Data
public class InsaNoteDto {
	private long empNo;
	private long noteNo;
	private String noteWriter;
	private String noteContents;
	private Date noteDate;
	private String noteDel;
 
}
