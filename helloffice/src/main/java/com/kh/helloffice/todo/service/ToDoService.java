package com.kh.helloffice.todo.service;

import java.util.List;
import java.util.Map;

import com.kh.helloffice.todo.entity.ToDoDto;

public interface ToDoService {

	int addToDo(Map<String, String> map) throws Exception;

	List<ToDoDto> getToDoList(String empNo) throws Exception;

	int deleteToDo(long no) throws Exception;

	int updateStatus(Map<String, String> map) throws Exception;

}
