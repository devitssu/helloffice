package com.kh.helloffice.reservation.dao;

import java.util.List;
import java.util.Map;

import com.kh.helloffice.reservation.entity.AssetDto;
import com.kh.helloffice.reservation.entity.ReservationDto;
import com.kh.helloffice.reservation.entity.ReservManagerDto;

public interface ReservationManagementDao {

	int addAsset(AssetDto asset) throws Exception;

	List<AssetDto> getAssetList(String type) throws Exception;

	AssetDto getAsset(long no) throws Exception;

	List<ReservationDto> getReserveList(String type) throws Exception;

	int updateStatus(ReservationDto reservation) throws Exception;

	int deleteAsset(long no) throws Exception;

	int udpateAsset(AssetDto asset) throws Exception;

	int addManager(Map<String, Object> map) throws Exception;

	ReservManagerDto getManager(long empNo) throws Exception;

	int updateManager(Map<String, Object> map) throws Exception;

	List<ReservManagerDto> getManagerList(String type) throws Exception;

	int deleteManager(Map<String, Object> map) throws Exception;

	int getManagerLevel(Map<String, Object> map) throws Exception;

}
