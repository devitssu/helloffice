package com.kh.helloffice.work.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.kh.helloffice.work.entity.WorkDto;
import com.kh.helloffice.work.entity.WorkEditDto;
import com.kh.helloffice.work.entity.WorkPageVo;

@Repository
public class WorkDaoImpl implements WorkDao{

	@Autowired
	private SqlSession ss;
	
	@Override
	public int insert(WorkDto dto) throws Exception{
		//게시글 등록
		//db에 insert , work 네임스페이스에 insert 쿼리 실행 -실행 결과는 int타입으로 반환
		return ss.insert("work.insert", dto);
	}

	//게시글 등록 시 세션에 값 저장.
	@Override
	public WorkDto getWorkInOut(WorkDto dto) throws Exception {
		return ss.selectOne("work.getWorkInOut", dto);
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
	public int workOut(WorkDto dto) throws Exception{
		return ss.update("work.outWork", dto);
	}

	@Override
	public int getWorkCnt() throws Exception {
		return ss.selectOne("work.getWorkCnt");
	}

	@Override
	public List<WorkDto> selectWeekList() {
		return ss.selectList("work.selectWeekList");
	}


	@Override
	public List<WorkDto> selectMonthList() {
		return ss.selectList("work.selectMonthList");
	}

	//Admin 게시글 전체 목록
	@Override
	public List<WorkDto> selectlist(int start, int end, String searchType, String searchValue) throws Exception {
		//검색 옵션, 키워드 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("searchValue", searchValue);
		//BETWEEN #{start}, #{end}에 입력될 값을 맵에
		map.put("start", start);
		map.put("end", end);
		return ss.selectList("work.selectAll", map);
	}

	//게시글 레코드 갯수
	@Override
	public int countArticle(String searchType, String searchValue) throws Exception {
		
		//검색 옵션, 키워드 맵에 저장
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("searchValue", searchValue);
		
		return ss.selectOne("work.countArticle", map);
	}

	@Override
	public List<WorkDto> selectYearList(int start, int end, String searchType, String searchValue) throws Exception {
		//검색 옵션, 키워드 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("searchValue", searchValue);
		//BETWEEN #{start}, #{end}에 입력될 값을 맵에
		map.put("start", start);
		map.put("end", end);
		return ss.selectList("work.selectYearList", map);
	}
	
	@Override
	public int yearCountArticle(String searchType, String searchValue) throws Exception {
		//검색 옵션, 키워드 맵에 저장
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("searchValue", searchValue);
		return ss.selectOne("work.yearCountArticle", map);
	}

	@Override
	public int editUpdate(WorkEditDto edto) {
		return ss.update("work.updateWork", edto);
	}

	

}
