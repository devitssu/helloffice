package com.kh.helloffice.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.helloffice.reservation.dao.ReservationManagementDao;
import com.kh.helloffice.reservation.entity.AssetDto;
import com.kh.helloffice.reservation.entity.ReservationDto;

@Service
public class ReservationManagementServiceImpl implements ReservationManagementService{

	@Autowired
	private ReservationManagementDao dao;
	
	@Override
	public int addAsset(AssetDto asset) throws Exception {
		return dao.addAsset(asset);
	}

	@Override
	public List<AssetDto> getAssetList(String type) throws Exception {
		return dao.getAssetList(type);
	}

	@Override
	public AssetDto getAsset(long no) throws Exception {
		return dao.getAsset(no);
	}

	@Override
	public List<ReservationDto> getReserveList(String type) throws Exception {
		return dao.getReserveList(type);
	}

	@Override
	public int updateStatus(ReservationDto reservation) throws Exception {
		return dao.updateStatus(reservation);
	}

	@Override
	public int deleteAsset(long no) throws Exception {
		return dao.deleteAsset(no);
	}

	@Override
	public int updateAsset(AssetDto asset) throws Exception {
		return dao.udpateAsset(asset);
	}

}
