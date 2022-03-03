package com.kh.helloffice.reservation.service;

import java.util.List;

import com.kh.helloffice.reservation.entity.AssetDto;
import com.kh.helloffice.reservation.entity.ReservationDto;
import com.kh.helloffice.reservation.entity.TargetVo;

public interface ReservationService {

	List<AssetDto> getAssetList(String type) throws Exception;

	int addReservation(ReservationDto reserv) throws Exception;

	List<ReservationDto> getDailyReserv(TargetVo vo) throws Exception;

	List<ReservationDto> getPersonalReserve(ReservationDto personal) throws Exception;

	int cancleReserve(long reservNo) throws Exception;

}
