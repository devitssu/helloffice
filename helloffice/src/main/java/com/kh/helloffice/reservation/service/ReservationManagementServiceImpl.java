package com.kh.helloffice.reservation.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.helloffice.reservation.dao.ReservationManagementDao;
import com.kh.helloffice.reservation.entity.AssetDto;
import com.kh.helloffice.reservation.entity.ReservationDto;
import com.kh.helloffice.reservation.entity.ReservManagerDto;

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

	@Override
	public int addManager(Map<String, Object> map) throws Exception {
		long empNo = Long.parseLong(String.valueOf(map.get("empNo")));
		ReservManagerDto result = dao.getManager(empNo);
		if(result != null) {
			return dao.updateManager(map);
		}else {			
			return dao.addManager(map);
		}
	}

	@Override
	public List<ReservManagerDto> getManagerList(String type) throws Exception {
		return dao.getManagerList(type);
	}

	@Override
	public int updateManager(Map<String, Object> map) throws Exception {
		return dao.updateManager(map);
	}

	@Override
	public int deleteManager(Map<String, Object> map) throws Exception {
		return dao.deleteManager(map);
	}

	@Override
	public int getManagerLevel(Map<String, Object> map) throws Exception {
		return dao.getManagerLevel(map);
	}

}
