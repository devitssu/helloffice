package com.kh.helloffice.todo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.helloffice.todo.entity.ToDoDto;

@Repository
public class ToDoDaoImpl implements ToDoDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public int addToDo(Map<String, String> map) throws Exception {
		return session.insert("todo.insertToDo", map);
	}

	@Override
	public List<ToDoDto> getToDoList(String empNo) throws Exception {
		return session.selectList("todo.getToDoList", empNo);
	}

	@Override
	public int deleteToDo(long no) throws Exception {
		return session.delete("todo.deleteToDo", no);
	}

	@Override
	public int updateStatus(Map<String, String> map) throws Exception {
		return session.update("todo.updateStatus", map);
	}

}
