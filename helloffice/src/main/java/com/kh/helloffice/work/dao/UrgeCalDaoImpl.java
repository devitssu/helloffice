package com.kh.helloffice.work.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.helloffice.work.entity.CalDto;
import com.kh.helloffice.work.entity.UrgeDto;

@Repository
public class UrgeCalDaoImpl implements UrgeCalDao{

	@Autowired
	private SqlSession ss;

	@Override
	public void urgeInsert(UrgeDto dto) throws Exception{
		ss.insert("urge.insert", dto);
	}

	@Override
	public int countArticle(String searchOption, String keyword) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		return ss.selectOne("urge.urgeCountArticle", map);
	}

	@Override
	public List<UrgeDto> urgeListAll(int start, int end, String searchOption, String keyword) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		return ss.selectList("urge.urgeListAll", map);
	}

	//촉구 상세 보기
	@Override
	public Object urgeRead(int urgeNo) throws Exception{
		return ss.selectOne("urge.urgeView", urgeNo);
	}

	//촉구 수정
	@Override
	public void urgeUpdate(UrgeDto dto) throws Exception{
		ss.update("urge.urgeUpdate", dto);
	}

	//촉구 삭제
	@Override
	public void urgeDelete(int urgeNo) throws Exception{
		ss.delete("urge.urgeDelete", urgeNo);
	}

	
	
	
	
	
	
	
	
	////////정산
	
	
	
	@Override
	public void calInsert(CalDto dto) throws Exception{
		ss.insert("cal.calInsert", dto);
	}

	@Override
	public List<CalDto> selectEmpList(CalDto dto) throws Exception{
		return ss.selectList("cal.calEmpList", dto);
	}

	@Override
	public Object calRead(int calNo) throws Exception{
		return ss.selectOne("cal.calView", calNo);
	}

	@Override
	public void calUpdate(CalDto dto) throws Exception{
		ss.update("cal.calUpdate", dto);
	}

	@Override
	public void calDelete(int calNo) throws Exception{
		ss.delete("cal.calDelete", calNo);
	}
	
}
