package com.kh.helloffice.reservation.service;

import java.util.List;

import com.kh.helloffice.reservation.entity.AssetDto;
import com.kh.helloffice.reservation.entity.ReservationDto;

public interface ReservationService {

	List<AssetDto> getAssetList(String type) throws Exception;

	int addReservation(ReservationDto reserv) throws Exception;

}
