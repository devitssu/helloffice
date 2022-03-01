package com.kh.helloffice.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.helloffice.reservation.dao.ReservationDao;
import com.kh.helloffice.reservation.entity.AssetDto;

@Service
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
	private ReservationDao dao;

	@Override
	public List<AssetDto> getAssetList(String type) throws Exception {
		return dao.getAssetList(type);
	}

}
