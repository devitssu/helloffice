package com.kh.helloffice.reservation.service;

import java.util.List;

import com.kh.helloffice.reservation.entity.AssetDto;

public interface ReservationService {

	List<AssetDto> getAssetList(String type) throws Exception;

}
