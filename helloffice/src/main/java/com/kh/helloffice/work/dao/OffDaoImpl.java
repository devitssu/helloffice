package com.kh.helloffice.work.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.helloffice.work.entity.OffDto;

@Repository
public class OffDaoImpl implements OffDao{

	@Autowired
	SqlSession ss;
	
	//휴가목록조회
	@Override
	public List<OffDto> adminListAll(int start, int end, String searchOption, String keyword) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		return ss.selectList("off.adminListAll", map);
	}

	//휴가 갯수
	@Override
	public int countArticle(String searchOption, String keyword) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		return ss.selectOne("off.offCountArticle", map);
	}

	//휴가 생성
	@Override
	public void create(OffDto dto) {
		ss.insert("off.insert", dto);
	}

	//휴가 상세 보기
	@Override
	public OffDto read(int offNo) {
		return ss.selectOne("off.view", offNo);
	}

	@Override
	public void update(OffDto dto) {
		ss.update("off.updateArticle", dto);
	}

	@Override
	public void delete(int offNo) {
		ss.delete("off.deleteArticle", offNo);
	}

	

	

//	@Override
//	public void increaseViewcnt(int offNo) {
//		ss.update("work.increaseViewcnt",offNo);
//	}

}
