package com.kh.helloffice.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("reserv")
public class ReservationController {
	
	@GetMapping()
	public String test() {
		return "reservation/room";
	}

}
