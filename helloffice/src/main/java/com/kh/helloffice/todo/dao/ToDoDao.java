package com.kh.helloffice.todo.dao;

import java.util.List;
import java.util.Map;

import com.kh.helloffice.todo.entity.ToDoDto;

public interface ToDoDao {

	int addToDo(Map<String, String> map) throws Exception;

	List<ToDoDto> getToDoList(String empNo) throws Exception;

}
