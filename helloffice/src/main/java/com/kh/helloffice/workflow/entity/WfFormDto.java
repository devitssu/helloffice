package com.kh.helloffice.workflow.entity;

import lombok.Data;

@Data
public class WfFormDto {

	private int formNo;
	private String formName;
	private String formDetail;
	private int tagNo;
	private String tagName;
	
	private TagDto tagDto;
}
