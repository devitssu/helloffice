package com.kh.helloffice.calendar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.helloffice.calendar.entity.EventDto;
import com.kh.helloffice.calendar.service.EventService;

@Controller
@RequestMapping("calendar")
public class CalendarController {
	
	private final EventService service;
	
	@Autowired
	public CalendarController(EventService service) {
		this.service = service;
	}
	
	@GetMapping()
	public String calendar() {
		return "calendar/calendar";
	}
	
	@PostMapping()
	@ResponseBody
	public String addEvent(@RequestBody EventDto event) throws Exception {
		
		System.out.println(event);
		int result = service.addEvent(event);
		if(result > 0) return "ok";
		else return "fail";
	}
	

}
