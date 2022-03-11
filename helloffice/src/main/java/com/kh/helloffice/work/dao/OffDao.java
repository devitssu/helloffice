package com.kh.helloffice.work.dao;

import java.util.List;

import com.kh.helloffice.work.entity.OffDto;

public interface OffDao {

	//휴가 전체 목록
	public List<OffDto> adminListAll(int start, int end, String searchOption, String keyword) throws Exception;
	//휴가 갯수
	public int countArticle(String searchOption, String keyword);
	//휴가 생성
	public void create(OffDto dto);
	//휴가 상세보기
	public OffDto read(int offNo);
	//휴가 수정
	public void update(OffDto dto);
	//휴가 삭제
	public void delete(int offNo);
	//휴가 조회수
//	public void increaseViewcnt(int offNo);
	
}
