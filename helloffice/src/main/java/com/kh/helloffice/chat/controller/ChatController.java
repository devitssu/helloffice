package com.kh.helloffice.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("chat")
public class ChatController {
	
	@GetMapping
	public String chatView() {
		return "chat/chat";
	}
	
	@GetMapping("/room/{roomId}")
	public String roomView() {
		return "chat/room";
	}
	
}
