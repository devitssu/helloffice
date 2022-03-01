package com.kh.helloffice.work.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kh.helloffice.work.entity.WorkDto;

@Component
public class WorkDaoImpl implements WorkDao{

	@Autowired
	private SqlSession ss;
	
	@Override
	public int insert(WorkDto dto) {
		//게시글 등록
		//db에 insert , work 네임스페이스에 insert 쿼리 실행 -실행 결과는 int타입으로 반환
		return ss.insert("work.insert", dto);
	}

}
