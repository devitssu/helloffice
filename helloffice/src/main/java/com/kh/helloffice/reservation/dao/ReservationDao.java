package com.kh.helloffice.reservation.dao;

import java.util.List;

import com.kh.helloffice.reservation.entity.AssetDto;
import com.kh.helloffice.reservation.entity.ReservationDto;
import com.kh.helloffice.reservation.entity.TargetVo;

public interface ReservationDao {

	List<AssetDto> getAssetList(String type) throws Exception;

	int addReservation(ReservationDto reserv) throws Exception;

	List<ReservationDto> getDailyReserv(TargetVo target) throws Exception;

	String getApproval(long assetNo) throws Exception;

	List<ReservationDto> getPersonalReserve(ReservationDto personal) throws Exception;

	int cancleReserve(long reservNo) throws Exception;

}
