package com.kh.helloffice.reservation.entity;

import lombok.Data;

@Data
public class AssetDto {
	
	private long assetNo;
	private String assetName;
	private String assetType;
	private String assetDetail;
	private String approval;
	private String returning;

}
