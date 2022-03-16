package com.kh.helloffice.calendar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.helloffice.calendar.dao.EventDao;
import com.kh.helloffice.calendar.entity.EventDto;

@Service
public class EventServiceImpl implements EventService{
	
	private final EventDao dao;
	
	@Autowired
	public EventServiceImpl(EventDao dao) {
		this.dao = dao;
	}

	@Override
	public int addEvent(EventDto event) throws Exception {
		return dao.addEvent(event);
	}

	@Override
	public List<EventDto> getEventList(long empNo) throws Exception {
		return dao.getEventList(empNo);
	}

	@Override
	public int updateEvent(EventDto event) throws Exception {
		return dao.updateEvent(event);
	}

	@Override
	public int deleteEvent(long no) throws Exception {
		return dao.deleteEvent(no);
	}

}
