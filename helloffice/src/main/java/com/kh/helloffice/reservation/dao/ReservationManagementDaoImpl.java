package com.kh.helloffice.reservation.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.helloffice.reservation.entity.AssetDto;
import com.kh.helloffice.reservation.entity.ReservationDto;

@Repository
public class ReservationManagementDaoImpl implements ReservationManagementDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public int addAsset(AssetDto asset) throws Exception {
		return session.insert("reservation.insertAsset", asset);
	}

	@Override
	public List<AssetDto> getAssetList(String type) throws Exception {
		return session.selectList("reservation.getAssetList", type);
	}

	@Override
	public AssetDto getAsset(long no) throws Exception {
		return session.selectOne("reservation.getAsset", no);
	}

	@Override
	public List<ReservationDto> getReserveList(String type) throws Exception {
		return session.selectList("reservation.getReserveList", type);
	}

}
