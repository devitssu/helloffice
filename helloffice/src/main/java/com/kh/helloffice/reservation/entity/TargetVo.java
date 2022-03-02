package com.kh.helloffice.reservation.entity;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class TargetVo {
	private String type;
	private Timestamp targetDate;

}
