package com.kh.helloffice.reservation.entity;

import lombok.Data;

@Data
public class ReservManagerDto {
	private long empNo;
	private int levelRoom;
	private int levelCar;
	private int levelSupply;
	
	private String empName;
	private String empRank;
	private String depName;

}
