package com.kh.helloffice.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("reserv-manage")
public class ReservationManagementController {

	@GetMapping("{type}")
	public String manage(String type) {
		return "reservation/management";
	}
}
