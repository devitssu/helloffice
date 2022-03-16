package com.kh.helloffice.calendar.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.helloffice.calendar.entity.EventDto;

@Repository
public class EventDaoImpl implements EventDao{
	
	private final SqlSession session;
	
	@Autowired
	public EventDaoImpl(SqlSession session) {
		this.session = session;
	}

	@Override
	public int addEvent(EventDto event) throws Exception {
		return session.insert("calendar.addEvent",event);
	}

}
