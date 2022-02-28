package com.kh.helloffice.reservation.service;

import java.util.List;

import com.kh.helloffice.reservation.entity.AssetDto;

public interface ReservationManagementService {

	int addAsset(AssetDto asset) throws Exception;

	List<AssetDto> getAssetList(String type) throws Exception;

	AssetDto getAsset(long no) throws Exception;

}
