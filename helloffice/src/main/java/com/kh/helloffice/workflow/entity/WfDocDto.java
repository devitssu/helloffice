package com.kh.helloffice.workflow.entity;

import lombok.Data;

@Data
public class WfDocDto {
	private long docTNo;
	private int writerNo;
	private String empName;
	private String depName;
	private String writeDate;
	private String wd;
	private int refFormNo;
	private String formName;
	
	private long docNo;
	private String docName;
	private String conDb;
	private String cusType;
	private String cusLabel;
	private String eachData;
	private String cusReq;
	private int cusOrder;
	private String docImpor;
	private String docStatus;
	private long orderDocPk;
	
	private int appStep;
	private long refEmpNo;
	private String appDate;
	private String appStatus;
	
}
