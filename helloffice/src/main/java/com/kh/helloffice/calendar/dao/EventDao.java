package com.kh.helloffice.calendar.dao;

import java.util.List;

import com.kh.helloffice.calendar.entity.EventDto;

public interface EventDao {

	int addEvent(EventDto event) throws Exception;

	List<EventDto> getEventList(long empNo) throws Exception;

	int updateEvent(EventDto event) throws Exception;

	int deleteEvent(long no) throws Exception;

}
