package com.kh.helloffice.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.helloffice.reservation.dao.ReservationDao;
import com.kh.helloffice.reservation.entity.AssetDto;
import com.kh.helloffice.reservation.entity.ReservationDto;

@Service
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
	private ReservationDao dao;

	@Override
	public List<AssetDto> getAssetList(String type) throws Exception {
		return dao.getAssetList(type);
	}

	@Override
	public int addReservation(ReservationDto reserv) throws Exception {
		return dao.addReservation(reserv);
	}

}
