package com.kh.helloffice.todo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.helloffice.todo.entity.ToDoDto;
import com.kh.helloffice.todo.service.ToDoService;

@RestController
@RequestMapping("todo/{empNo}")
public class ToDoController {
	
	@Autowired
	private ToDoService service;
	
	@GetMapping
	public Map<Long, ToDoDto> getToDoList(@PathVariable String empNo) throws Exception {
		List<ToDoDto> toDoList = service.getToDoList(empNo);
		return listToMap(toDoList);
	}
	
	@PostMapping()
	public Map<Long, ToDoDto> addToDo(@PathVariable String empNo, 
								 	  @RequestBody String content) throws Exception{
		Map<String, String> map = new HashMap<>();
		map.put("empNo", empNo);
		map.put("content", content);
		
		List<ToDoDto> toDoList = null;
		
		int result = service.addToDo(map);
		if(result > 0) {
			toDoList = service.getToDoList(empNo);
		}else return null;
		
		return listToMap(toDoList);
	}
	
	@DeleteMapping("{no}")
	public Map<Long, ToDoDto> deleteToDo(@PathVariable String empNo, 
										 @PathVariable long no) throws Exception{
		int result = service.deleteToDo(no);
		
		List<ToDoDto> toDoList = null;
		
		if(result > 0) {
			toDoList = service.getToDoList(empNo);
		}else return null;
		
		return listToMap(toDoList);
	}
	
	@PutMapping("{no}")
	public Map<Long, ToDoDto> updateStatus(@PathVariable String empNo, 
			 							   @PathVariable String no,
			 							   @RequestBody String isComplete)throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("todoNo", no);
		map.put("isComplete", isComplete);
		
		int result = service.updateStatus(map);
		
		List<ToDoDto> toDoList = null;
		
		if(result > 0) {
			toDoList = service.getToDoList(empNo);
		}else return null;
		
		return listToMap(toDoList);
	}
	
	private Map<Long, ToDoDto> listToMap(List<ToDoDto> toDoList){
		Map<Long, ToDoDto> resultMap = new HashMap<>();
		for (ToDoDto t : toDoList) {
			resultMap.put(t.getTodoNo(), t);
		}
		return resultMap;	
	}

}
