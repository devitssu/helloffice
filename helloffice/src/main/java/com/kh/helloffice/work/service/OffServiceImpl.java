package com.kh.helloffice.work.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.helloffice.work.dao.OffDao;
import com.kh.helloffice.work.entity.OffDto;

@Service
public class OffServiceImpl implements OffService{

	@Autowired
	OffDao offDao;
	
	//휴가 목록
	@Override
	public List<OffDto> adminListAll(int start, int end, String searchOption, String keyword) throws Exception {
		return offDao.adminListAll(start, end,searchOption, keyword);
	}
	
	//휴가 갯수
	@Override
	public int countArticle(String searchOption, String keyword) {
		return offDao.countArticle(searchOption, keyword);
	}
	
	//휴가 생성
	@Override
	public void create(OffDto dto) {
		String depName = dto.getDepName();
		String offType = dto.getOffType();
		String offcontent = dto.getOffContent();
		//*태그 문자 처리(< ==> &lt; > ==> &gt;)
		// replace(A, B) A를 B로 변경
		depName = depName.replace("<", "&lt;");
		depName = depName.replace(">", "&gt;");
		offType = offType.replace("<", "&lt;");
		offType = offType.replace(">", "&gt;");
		offcontent = offcontent.replace("<", "&lt;");
		offcontent = offcontent.replace(">", "&gt;");
		//*공백 문자 처리
		depName = depName.replace("  ", "&nbsp;&nbsp;");
		offType = offType.replace("  ", "&nbsp;&nbsp;");
		offcontent = offcontent.replace("  ", "&nbsp;&nbsp;");
		//*줄바꿈 문자처리
		offcontent = offcontent.replace("\n", "<br>");
		dto.setDepName(depName);
		dto.setOffType(offType);
		dto.setOffContent(offcontent);
		offDao.create(dto);
	}

	//휴가 상세보기
	@Override
	public OffDto read(int offNo) {
		return offDao.read(offNo);
	}

	//휴가 수정
	@Override
	public void update(OffDto dto) {
		offDao.update(dto);
	}

	//휴가 삭제
	@Override
	public void delete(int offNo) {
		offDao.delete(offNo);
	}

	

	
	
	

//	//휴가 조회수
//	@Override
//	public void increaseViewcnt(int offNo, HttpSession session) {
//		long update_time = 0;
//		// 세션에 저장된 조회시간 검색
//		//최초로 조회할 경우 세션에 저장된 값이 없기 때문에 if문은 실행 x
//		if(session.getAttribute("update_time_"+offNo) != null) {
//			//세션에서 읽어오기
//			update_time = (Long)session.getAttribute("update_time_"+offNo);
//		}
//		//시스템의 현재시간을 current_time에 저장
//		long current_time = System.currentTimeMillis();
//		//일정시간이 경과 후 조회수 증가 처리 24*60*60*1000(24시간)
//		//시스템현재시간 - 열람시간 > 일정시간(조회수 증가가 가능하도록 지정한 시간)
//		if(current_time = update_time > 5*1000) {
//			offDao.increaseViewcnt(offNo);
//			//세션에 시간을 저장 : "update_time_"+offNo는 다른 변수와 중복되지 않게 명명한 것
//			session.setAttribute("update_time_"+offNo, current_time);
//		}
//	}

	
}
