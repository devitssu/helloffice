package com.kh.helloffice.work.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.kh.helloffice.work.entity.WorkDto;

@Repository
public class WorkDaoImpl implements WorkDao{

	@Autowired
	private SqlSession ss;
	
	@Override
	public int insert(WorkDto dto) {
		//게시글 등록
		//db에 insert , work 네임스페이스에 insert 쿼리 실행 -실행 결과는 int타입으로 반환
		return ss.insert("work.insert", dto);
	}

	@Override
	public List<WorkDto> selectlist() {
		return ss.selectList("work.selectAll");
	}

	@Override
	public int edit(WorkDto dto) {
		return ss.update("work.updateWork", dto);
	}

	@Override
	public int delete(WorkDto dto) {
		return ss.delete("work.deleteWork", dto);
	}

	@Override
	public WorkDto getWorkInOut(WorkDto dto) throws Exception {
		return ss.selectOne("work.getWorkInOut", dto);
	}

}
