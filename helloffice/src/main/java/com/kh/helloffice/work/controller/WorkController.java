package com.kh.helloffice.work.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.helloffice.member.entity.MemberDto;
import com.kh.helloffice.work.entity.CalDto;
import com.kh.helloffice.work.entity.UrgeDto;
import com.kh.helloffice.work.entity.WorkDto;
import com.kh.helloffice.work.entity.WorkEditDto;
import com.kh.helloffice.work.entity.WorkPageVo;
import com.kh.helloffice.work.service.WorkService;

@Controller
public class WorkController {

	
	@Autowired
	private WorkService service;
	
	
	@Autowired
	private SqlSession ss;
	
	
	//출퇴근 insert
	@PostMapping("/work.do")
	public String insert(HttpSession session,HttpServletRequest request,WorkDto dto, BindingResult error) throws Exception {
		
		//세션 가져오기
		session = request.getSession();
		MemberDto loginEmp = (MemberDto)session.getAttribute("loginEmp");
		int empNo = (int) loginEmp.getEmpNo();
		
		dto.setEmpNo(empNo);
		System.out.println("empno : " + empNo);
		
		//로직 처리-> 서비스한테 맡김);
		int result = service.enrollWork(dto);
		
		System.out.println("int insert : " + result);
		
		WorkDto workEmp = service.workIn(dto);
		
		System.out.println("workEmp : " + workEmp);
		//화면 경로 선택
		if (result > 0 && workEmp != null) {
//			succes
			session.setAttribute("workEmp", workEmp);
			return "redirect:/";
		} else {
			//fail
			return "redirect:/";
		}
	}
	
	
	//관리자용 출퇴근 조회 수정 삭제
	@RequestMapping("adminWorkMain")
	public ModelAndView workMain(@RequestParam(defaultValue = "all") String searchType,
						   @RequestParam(defaultValue = "") String searchValue,
						   @RequestParam(defaultValue = "1") int curPage) throws Exception {
		
		//레코드의 갯수
		int count = service.countArticle(searchType, searchValue);

		//페이징 관련
		WorkPageVo pageVo = new WorkPageVo(count, curPage);
		int start = pageVo.getPageBegin();
		int end = pageVo.getPageEnd();
		
		//리스트 조회
		List<WorkDto> list = service.selectList(start, end, searchType, searchValue);
		
		//데이터를 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);				   //list
		map.put("count", count );			   //레코드의 갯수
		map.put("searchType", searchType);     //검색옵션
		map.put("searchValue", searchValue);   //검색키워드
		map.put("pageVo", pageVo);
		
		//ModelAndView - 모델과 뷰
		ModelAndView mav = new ModelAndView();
		System.out.println(mav + "dd" + list);
		mav.addObject("map", map);			   //맵에 저장된 데이터를 mav에 저장
		mav.setViewName("work/adminWorkMain"); //화면으로 보내기
		
		return mav;
	}
	
	
	//출퇴근 상세 조회
	@GetMapping("/workMain/detail/{i}")
	public String workdetail(@PathVariable String i, Model model) { //화면에서 String 타입의 inDate 를 받아서 그 로우를 조회
		
		WorkDto dto = ss.selectOne("work.selectOneByInDate", i); //일단 검색해서, 그결과를 dto에 넣은 후,
		System.out.println("selectOne :" + dto);
		
		model.addAttribute("data", dto); //화면에 전달.
		return "work/workDetail";
	}
	
	
	//출퇴근 수정
	@PostMapping("/edit")
	public String edit(WorkDto dto, WorkEditDto edto) {
		//dto 가지고 처리
		int result = service.edit(dto);
		ss.update("workEdit.ynUpdate", edto);
		
		System.out.println("출퇴근 수정 : " + result);
		if (result > 0) {
			//success
			return "redirect:/adminWorkMain";
		} else {
			return "redirect:/error/exception";
		}
		
	}
	
	
	//출퇴근 삭제
	@PostMapping("/delete")
	public String delete(WorkDto dto) {
		int result = service.delete(dto);
		System.out.println("삭제하기 : " + result);
		if (result > 0) {
			//success
			return "redirect:/adminWorkMain";
		} else {
			return "redirect:/error/exception";
		}
	}
	
	
	//퇴근 도장 꽝!
	@PostMapping("/out.do")
	public String out(HttpSession session,WorkDto dto) throws Exception {
		int result = service.workOut(dto);
		System.out.println("outtime : "+result);
		
		WorkDto out = ss.selectOne("work.selectOutTime", dto);
		
		System.out.println("outTime : " + out);
		
//		WorkDto workOutEmp = service.workOut(dto);
		session.setAttribute("outTime2", result);
		session.setAttribute("outTime", out);
		
		return "redirect:/";
	}
	
	
	//주단위 사원만 조회
	@GetMapping("/workMain")
	public String weekListView(Model model) throws Exception {
		List<WorkDto> weekList = service.selectWeekList();
		List<WorkEditDto> editList = ss.selectList("workEdit.getEditList");
		List<WorkEditDto> delList = ss.selectList("workEdit.getDelList");
		List<UrgeDto> urgeOneList = ss.selectList("urge.urgeOneList");
		List<UrgeDto> urgeTwoList = ss.selectList("urge.urgeTwoList");
		List<CalDto> calList = ss.selectList("cal.calList");
		//현재 세션 정보 불러오기
//		Enumeration<String> attributes = request.getSession().getAttributeNames();
//		while (attributes.hasMoreElements()) {
//		    String attribute = (String) attributes.nextElement();
//		    System.err.println(attribute+" : "+request.getSession().getAttribute(attribute));
//		}
		System.out.println("weekList" + weekList);
		System.out.println("editList" + editList);
		System.out.println("delList" + delList);
		System.out.println("urgeOneList" + urgeOneList);
		System.out.println("urgeTwoList" + urgeTwoList);
		model.addAttribute("weekList", weekList);
		model.addAttribute("editList", editList);
		model.addAttribute("delList", delList);
		model.addAttribute("urgeOneList", urgeOneList);
		model.addAttribute("urgeTwoList", urgeTwoList);
		model.addAttribute("calList", calList);
		return "work/workMain";
	}
	
	
	//일년 단위로 조회
	@RequestMapping("/workYear")
	public ModelAndView workYear(@RequestParam(defaultValue="inDate") String searchType,
								 @RequestParam(defaultValue="") String searchValue,
								 @RequestParam(defaultValue = "1") int curPage) throws Exception {
		
		//레코드의 갯수
		int count = service.yearCountArticle(searchType, searchValue);
		
		//페이징 관련
		WorkPageVo pageVo = new WorkPageVo(count, curPage);
		int start = pageVo.getPageBegin();
		int end = pageVo.getPageEnd();
		
		List<WorkDto> yearList = service.selectYearList(start, end, searchType, searchValue);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("yearList", yearList);
		map.put("count", count);
		map.put("searchOption", searchType);
		map.put("keyword", searchValue);
		map.put("pageVo", pageVo);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("map", map);
		mav.setViewName("work/workYear");
		return mav;
	}
	
	
	//월 단위 조회
	@GetMapping("/workMonth")
	public String workMonth(Model model) {
		
		List<WorkDto> monthList = service.selectMonthList();
		
		model.addAttribute("monthList", monthList);
		
		return "work/workMonth";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}