package com.kh.helloffice.reservation.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.helloffice.reservation.entity.AssetDto;
import com.kh.helloffice.reservation.entity.ReservationDto;
import com.kh.helloffice.reservation.entity.ReservManagerDto;

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

	@Override
	public int updateStatus(ReservationDto reservation) throws Exception {
		return session.update("reservation.updateStatus", reservation);
	}

	@Override
	public int deleteAsset(long no) throws Exception {
		return session.delete("reservation.deleteAsset", no);
	}

	@Override
	public int udpateAsset(AssetDto asset) throws Exception {
		return session.update("reservation.updateAsset", asset);
	}

	@Override
	public int addManager(Map<String, Object> map) throws Exception {
		return session.insert("reservation.insertManager", map);
	}

	@Override
	public ReservManagerDto getManager(long empNo) throws Exception {
		return session.selectOne("reservation.getManager", empNo);
	}

	@Override
	public int updateManager(Map<String, Object> map) throws Exception {
		return session.update("reservation.updateManager", map);
	}

	@Override
	public List<ReservManagerDto> getManagerList(String type) throws Exception {
		return session.selectList("reservation.getManagerList", type);
	}

	@Override
	public int deleteManager(Map<String, Object> map) throws Exception {
		return session.update("reservation.deleteManager", map);
	}

	@Override
	public int getManagerLevel(Map<String, Object> map) throws Exception {
		return session.selectOne("reservation.getManagerLevel", map);
	}

}
