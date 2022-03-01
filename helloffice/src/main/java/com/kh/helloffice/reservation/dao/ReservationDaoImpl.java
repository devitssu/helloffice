package com.kh.helloffice.reservation.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.helloffice.reservation.entity.AssetDto;
import com.kh.helloffice.reservation.entity.ReservationDto;

@Repository
public class ReservationDaoImpl implements ReservationDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<AssetDto> getAssetList(String type) throws Exception {
		return session.selectList("reservation.getAssetList", type);
	}

	@Override
	public int addReservation(ReservationDto reserv) throws Exception {
		return session.insert("reservation.addReservation", reserv);
	}

}
