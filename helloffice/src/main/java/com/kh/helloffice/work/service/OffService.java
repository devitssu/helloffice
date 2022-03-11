package com.kh.helloffice.work.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.kh.helloffice.work.entity.OffDto;

public interface OffService {

	//휴가 목록 보기
	public List<OffDto> adminListAll(int start, int end, String searchOption, String keyword) throws Exception;
	//휴가 생성
	public void create(OffDto dto);
	//상세 보기
	public Object read(int offNo);
	//휴가 수정
	public void update(OffDto dto);
	//휴가 삭제
	public void delete(int offNo);
	//휴가 조회수 그냥 해보는거
//	public void increaseViewcnt(int offNo, HttpSession session);
	//휴가 개수
	public int countArticle(String searchOption, String keyword);
	
}
