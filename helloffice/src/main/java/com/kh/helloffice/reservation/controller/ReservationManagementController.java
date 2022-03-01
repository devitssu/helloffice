package com.kh.helloffice.reservation.controller;

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
}
