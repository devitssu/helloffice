package com.kh.helloffice.calendar.dao;

import com.kh.helloffice.calendar.entity.EventDto;

public interface EventDao {

	int addEvent(EventDto event) throws Exception;

}
