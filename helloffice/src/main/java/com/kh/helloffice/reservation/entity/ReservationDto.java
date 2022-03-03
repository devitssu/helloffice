package com.kh.helloffice.reservation.entity;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReservationDto {
	
	private long reservNo;
	private long assetNo;
	private String assetName;
	private String assetType;
	private long empNo;
	private String empName;
	private Timestamp startTime;
	private Timestamp endTime;
	private String reason;
	private String status;
}
