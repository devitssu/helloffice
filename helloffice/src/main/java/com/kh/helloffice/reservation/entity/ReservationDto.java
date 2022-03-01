package com.kh.helloffice.reservation.entity;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReservationDto {
	
	private long reservNo;
	private long assetNo;
	private long empNo;
	private Timestamp startTime;
	private Timestamp endTime;
	private String reason;
}
