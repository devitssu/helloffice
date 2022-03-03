package com.kh.helloffice.reservation.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
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
	
	@GetMapping("emp/{empNo}")
	@ResponseBody
	public Map<Long, ReservationDto> personalReserv(@PathVariable String type, 
											   @PathVariable long empNo) throws Exception {
		ReservationDto personal = new ReservationDto();
		personal.setAssetType(type);
		personal.setEmpNo(empNo);
		List<ReservationDto> reservList = service.getPersonalReserve(personal);
		Map<Long, ReservationDto> reservMap = new HashMap<>();
		for (ReservationDto r : reservList) {
			reservMap.put(r.getReservNo(), r);
		}
		
		return reservMap;
	}
	
	@DeleteMapping("{reservNo}")
	@ResponseBody
	public String cancleReserve(@PathVariable long reservNo) throws Exception {
		
		int result = service.cancleReserve(reservNo);
		if(result > 0) {
			return "200";
		}else return "500";
	}

}
