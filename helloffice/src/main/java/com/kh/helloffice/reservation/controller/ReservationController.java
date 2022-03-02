package com.kh.helloffice.reservation.controller;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.helloffice.reservation.entity.AssetDto;
import com.kh.helloffice.reservation.entity.ReservationDto;
import com.kh.helloffice.reservation.entity.TargetVo;
import com.kh.helloffice.reservation.service.ReservationService;

@Controller
@RequestMapping("reserv/{type}")
public class ReservationController {
	
	@Autowired
	private ReservationService service;
	
	@GetMapping()
	public String page(@PathVariable String type, Model model) throws Exception {
		
		List<AssetDto> assetList = service.getAssetList(type);
		
		model.addAttribute("assetList", assetList);
		
		return "reservation/reservation";
	}
	
	@PostMapping()
	@ResponseBody
	public String reserve(ReservationDto reserv) throws Exception {
		
		int result = service.addReservation(reserv);
		if(result > 0) {
			return "success";
		}else return "fail";
	}
	
	@GetMapping("date")
	@ResponseBody
	public List<ReservationDto> reservList(@PathVariable String type, String date) throws Exception {
		date = date + " 00:00:00";
		Timestamp target = Timestamp.valueOf(date);
		
		TargetVo vo = new TargetVo(type, target);
		
		List<ReservationDto> reservList =  service.getDailyReserv(vo);
		
		return reservList;
	}
	
	@GetMapping("{empNo}")
	@ResponseBody
	public List<ReservationDto> personalReserv(@PathVariable long empNo) throws Exception {
		
		List<ReservationDto> reservList = service.getPersonalReserve(empNo);
		
		return reservList;
	}

}
