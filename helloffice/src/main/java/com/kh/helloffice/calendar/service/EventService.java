package com.kh.helloffice.calendar.service;

import java.util.List;

import com.kh.helloffice.calendar.entity.EventDto;

public interface EventService {

	int addEvent(EventDto event) throws Exception;

	List<EventDto> getEventList(long empNo) throws Exception;

	int updateEvent(EventDto event) throws Exception;

	int deleteEvent(long no) throws Exception;

}
