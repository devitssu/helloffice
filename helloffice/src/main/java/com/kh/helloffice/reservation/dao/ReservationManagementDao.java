package com.kh.helloffice.reservation.dao;

import java.util.List;

import com.kh.helloffice.reservation.entity.AssetDto;
import com.kh.helloffice.reservation.entity.ReservationDto;

public interface ReservationManagementDao {

	int addAsset(AssetDto asset) throws Exception;

	List<AssetDto> getAssetList(String type) throws Exception;

	AssetDto getAsset(long no) throws Exception;

	List<ReservationDto> getReserveList(String type) throws Exception;

	int updateStatus(ReservationDto reservation) throws Exception;

	int deleteAsset(long no) throws Exception;

}
