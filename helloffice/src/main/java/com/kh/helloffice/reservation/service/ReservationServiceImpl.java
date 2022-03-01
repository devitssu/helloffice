package com.kh.helloffice.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.helloffice.reservation.dao.ReservationDao;
import com.kh.helloffice.reservation.entity.AssetDto;
import com.kh.helloffice.reservation.entity.ReservationDto;
import com.kh.helloffice.reservation.entity.TargetVo;

@Service
@Transactional
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
	private ReservationDao dao;

	@Override
	public List<AssetDto> getAssetList(String type) throws Exception {
		return dao.getAssetList(type);
	}

	@Override
	public int addReservation(ReservationDto reserv) throws Exception {
		String approval = dao.getApproval(reserv.getAssetNo());
		if("auto".equals(approval)) {
			reserv.setStatus("approval");
		}else {
			reserv.setStatus("pending");
		}
		
		return dao.addReservation(reserv);
	}

	@Override
	public List<ReservationDto> getDailyReserv(TargetVo target) throws Exception {
		return dao.getDailyReserv(target);
	}

	
}
