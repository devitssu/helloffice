package com.kh.helloffice.reservation.controller;

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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.helloffice.reservation.entity.AssetDto;
import com.kh.helloffice.reservation.entity.ReservationDto;
import com.kh.helloffice.reservation.entity.ReservManagerDto;
import com.kh.helloffice.reservation.service.ReservationManagementService;

@Controller
@RequestMapping("reserv-manage/{type}")
public class ReservationManagementController {
	
	@Autowired
	private ReservationManagementService service;

	@GetMapping()
	public String manage(@PathVariable String type, Model model) throws Exception {
		
		List<AssetDto> assetList = service.getAssetList(type);
		
		model.addAttribute("assetList", assetList);
		
		return "reservation/management";
	}
	
	@GetMapping("reserv")
	@ResponseBody
	public Map<Long, ReservationDto> reservList(@PathVariable String type) throws Exception {
		List<ReservationDto> reserveList = service.getReserveList(type);
		Map<Long, ReservationDto> reserveMap = new HashMap<>();
		for (ReservationDto r : reserveList) {
			reserveMap.put(r.getReservNo(), r);
		}
		return reserveMap;
	}
	
	@PutMapping("/{no}")
	@ResponseBody
	public String updateAsset(@PathVariable long no, 
							  @RequestBody AssetDto asset) throws Exception{
		asset.setAssetNo(no);
		int result = service.updateAsset(asset);
		if(result > 0) return "ok";
		else return "fail";
	}
	
	@DeleteMapping("/{no}")
	@ResponseBody
	public String deleteAsset(@PathVariable long no) throws Exception {
		int result = service.deleteAsset(no);
		if(result > 0) return "ok";
		else return "fail";
	}
	
	@PostMapping()
	@ResponseBody
	public String addAsset(@PathVariable String type, AssetDto asset) throws Exception {
		asset.setAssetType(type);
		int result = service.addAsset(asset);
		if(result > 0) return "success";
		else return "fail";
	}
	
	@GetMapping("/{no}")
	@ResponseBody
	public AssetDto getAsset( @PathVariable long no) throws Exception {
		AssetDto asset = service.getAsset(no);
		return asset;
	}
	
	@PutMapping("reserv/{reservNo}")
	@ResponseBody
	public String updateStatus(@PathVariable long reservNo,
						 	   @RequestBody ReservationDto reservation) throws Exception{

		reservation.setReservNo(reservNo);
		int result = service.updateStatus(reservation);
		if(result > 0) return "ok";
		else return "fail";
	}
	
	@GetMapping("manager")
	@ResponseBody
	public Map<Long, ReservManagerDto> getManagerList(@PathVariable String type) throws Exception{
		List<ReservManagerDto> list = service.getManagerList(type);
		Map<Long, ReservManagerDto> map = new HashMap<>();
		for (ReservManagerDto m : list) {
			map.put(m.getEmpNo(), m);
		}
		return map;
	}
	
	@PostMapping("manager")
	@ResponseBody
	public String addManager(@PathVariable String type, 
							 @RequestBody Map<String, Object> map) throws Exception{
		map.put("type", type);
		int result = service.addManager(map);
		if(result > 0) return "ok";
		else return "ok";
	}
	
}
