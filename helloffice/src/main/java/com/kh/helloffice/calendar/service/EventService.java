package com.kh.helloffice.calendar.service;

import com.kh.helloffice.calendar.entity.EventDto;

public interface EventService {

	int addEvent(EventDto event) throws Exception;

}
