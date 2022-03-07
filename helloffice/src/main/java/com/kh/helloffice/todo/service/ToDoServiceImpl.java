package com.kh.helloffice.todo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.helloffice.todo.dao.ToDoDao;
import com.kh.helloffice.todo.entity.ToDoDto;

@Service
public class ToDoServiceImpl implements ToDoService{
	
	@Autowired
	private ToDoDao dao;

	@Override
	public int addToDo(Map<String, String> map) throws Exception {
		return dao.addToDo(map);
	}

	@Override
	public List<ToDoDto> getToDoList(String empNo) throws Exception {
		return dao.getToDoList(empNo);
	}

	@Override
	public int deleteToDo(long no) throws Exception {
		return dao.deleteToDo(no);
	}

	@Override
	public int updateStatus(Map<String, String> map) throws Exception {
		return dao.updateStatus(map);
	}

}
