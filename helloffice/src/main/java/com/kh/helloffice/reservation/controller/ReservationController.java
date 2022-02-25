package com.kh.helloffice.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("reserv")
public class ReservationController {
	
	@GetMapping("room")
	public String room() {
		return "reservation/reservation";
	}
	
	@GetMapping("car")
	public String car() {
		return "reservation/reservation";
	}
	
	@GetMapping("supply")
	public String supply() {
		return "reservation/reservation";
	}

}
