package com.kh.helloffice.workflow.entity;

import lombok.Data;

@Data
public class AllCusDto {
	private int formNo;//wfFormDto에서 
	private String formName;
	private String formDetail;
	
	private String tagName;
	private int tagNo;

	private String cusType;
	private int cusOrder;
	private String cusName;
	private int cusReq;
	
	private int conNo;
	private String conDb;

	private int charNo;
	private String charName;
	private String charDb;
	private int charReq;
	
	private int numNo;
	private String numName;
	private String numDb;
	private int numReq;
	
	
	
}
