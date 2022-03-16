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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.helloffice.member.entity.MemberDto;
import com.kh.helloffice.work.entity.CalDto;
import com.kh.helloffice.work.entity.OffDto;
import com.kh.helloffice.work.entity.UrgeDto;
import com.kh.helloffice.work.entity.WorkPageVo;
import com.kh.helloffice.work.service.UrgeCalService;

@Controller
public class UrgeCalController {

	@Autowired
	private UrgeCalService service;
	
	@Autowired
	private SqlSession ss;
	
	//촉구서 리스트
	@RequestMapping("useDoOff")
	public ModelAndView urgeList(@RequestParam(defaultValue="all") String searchOption,
								 @RequestParam(defaultValue="") String keyword,
								 @RequestParam(defaultValue = "1") int curPage) throws Exception{
		
		//레코드의 갯수
		int count = service.countArticle(searchOption, keyword);
		
		//페이징 관련
		WorkPageVo pageVo = new WorkPageVo(count, curPage);
		int start = pageVo.getPageBegin();
		int end = pageVo.getPageEnd();
				
		List<UrgeDto> list = service.urgeListAll(start, end, searchOption, keyword);
				
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("pageVo", pageVo);
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("map", map);
		mav.setViewName("work/useDoOff");
		return mav;
	}
	
	
	//촉구서 작성
	@PostMapping("urgeInsert.do")
	public String urgeInsert(@ModelAttribute UrgeDto dto) throws Exception {
		service.urgeInsert(dto);
		return "redirect:useDoOff";
	}
	
	
	//촉구서 상세내용
	@GetMapping("urgeView.do")
	public ModelAndView urgeView(@RequestParam int urgeNo) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("work/urgeView");
		mav.addObject("dto", service.urgeRead(urgeNo));
		return mav;
	}
	
	
	//촉구서 수정
	@PostMapping("urgeUpdate.do")
	public String urgeUpdate(@ModelAttribute UrgeDto dto) throws Exception{
		service.urgeUpdate(dto);
		return "redirect:useDoOff";
	}
	
	
	//촉구서 삭제
	@RequestMapping("urgeDelete.do")
	public String urgeDelete(@RequestParam int urgeNo) throws Exception{
		service.urgeDelete(urgeNo);
		return "redirect:useDoOff";
	}
	
	

	
	
//////////////////////////////////정산	
	
	
	
	
	
	
	
	//정산 작성
	@PostMapping("calInsert.do")
	public String calInsert(@ModelAttribute CalDto dto) throws Exception {
		service.calInsert(dto);
		return "redirect:offPayBack";
	}
	
	//사원용 정산 리스트
	@GetMapping("offPayBack")
	public String calList(HttpSession session,HttpServletRequest request, CalDto dto, Model model) throws Exception{
		
		//세션 가져오기(empNo)
		session = request.getSession();
		MemberDto loginEmp = (MemberDto)session.getAttribute("loginEmp");
		int empNo = (int) loginEmp.getEmpNo();
		
		dto.setEmpNo(empNo);
		System.out.println("calempno : " + empNo);
		
		List<CalDto> empList = service.selectEmpList(dto);
		List<CalDto> adminList = ss.selectList("cal.calAdminList", dto);
		
		model.addAttribute("empList", empList);
		model.addAttribute("adminList",adminList);
		System.out.println("empList"+ empList);
		return "work/offPayBack";
	}
		
	//관리자용 정산 상세 조회, 수정, 삭제
	//상세내용
		@GetMapping("calView.do")
		public ModelAndView calView(@RequestParam int calNo) throws Exception{
			ModelAndView mav = new ModelAndView();
			mav.setViewName("work/calView");
			mav.addObject("dto", service.calRead(calNo));
			return mav;
		}
		
		
		// 수정
		@PostMapping("calUpdate.do")
		public String calUpdate(@ModelAttribute CalDto dto) throws Exception{
			service.calUpdate(dto);
			return "redirect:offPayBack";
		}
		
		
		//삭제
		@RequestMapping("calDelete.do")
		public String calDelete(@RequestParam int calNo) throws Exception{
			service.calDelete(calNo);
			return "redirect:offPayBack";
		}
	
	
	
}
