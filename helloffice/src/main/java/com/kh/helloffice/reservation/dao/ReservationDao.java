package com.kh.helloffice.reservation.dao;

import java.util.List;

import com.kh.helloffice.reservation.entity.AssetDto;

public interface ReservationDao {

	List<AssetDto> getAssetList(String type) throws Exception;

}
