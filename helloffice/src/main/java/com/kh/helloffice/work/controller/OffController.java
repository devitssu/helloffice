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
import com.kh.helloffice.work.entity.OffDto;
import com.kh.helloffice.work.entity.UrgeDto;
import com.kh.helloffice.work.entity.WorkPageVo;
import com.kh.helloffice.work.service.OffService;

@Controller
public class OffController {

	@Autowired
	OffService offService;
	
	@Autowired
	private SqlSession ss;
	
	@GetMapping("off")
	public ModelAndView offlist(HttpSession session, HttpServletRequest request, OffDto oDto, UrgeDto uDto, Model model) throws Exception {
		
		//세션 가져오기
		session = request.getSession();
		MemberDto loginEmp = (MemberDto)session.getAttribute("loginEmp");
		int empNo = (int) loginEmp.getEmpNo();
				
		oDto.setEmpNo(empNo);
		System.out.println("offempno : " + empNo);
		
		//잔여 연차 조회
		List<OffDto> mainOffList = ss.selectList("off.mainOffList", oDto); 
		List<OffDto> subOffList = ss.selectList("off.subOffList", oDto); 
		List<OffDto> useDoOffList = ss.selectList("off.useDoOffList", oDto); 
		List<OffDto> usedOffList = ss.selectList("off.usedOffList", oDto); 
		List<UrgeDto> urgeOneList = ss.selectList("urge.urgeOneList", uDto);
		List<UrgeDto> urgeTwoList = ss.selectList("urge.urgeTwoList", uDto);
		
		Map<String, Object> map = new HashMap<String, Object>();
		ModelAndView mav = new ModelAndView();
		map.put("mainOffList", mainOffList);
		map.put("subOffList", subOffList);
		map.put("useDoOffList", useDoOffList);
		map.put("usedOffList", usedOffList);
		model.addAttribute("urgeOneList", urgeOneList);
		map.put("urgeTwoList", urgeTwoList);
		System.out.println("urgeOneList : " + urgeOneList);
		mav.addObject("map", map);
		mav.setViewName("work/off");
		return mav;
	}
	
	//휴가 생성 게시글 목록
	@RequestMapping("adminOff")
	public ModelAndView adminOffList(@RequestParam(defaultValue="all") String searchOption,
									 @RequestParam(defaultValue="") String keyword,
									 @RequestParam(defaultValue = "1") int curPage) throws Exception {
		
		//레코드의 갯수
		int count = offService.countArticle(searchOption, keyword);
		
		//페이징 관련
		WorkPageVo pageVo = new WorkPageVo(count, curPage);
		int start = pageVo.getPageBegin();
		int end = pageVo.getPageEnd();
		
		List<OffDto> list = offService.adminListAll(start, end, searchOption, keyword);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("pageVo", pageVo);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("map", map);
		mav.setViewName("work/adminOff");
		return mav;
	}
	
	//게시글 작성 화면
	@GetMapping("write")
	public String offCreate() {
		return "work/write";
	}
	
	//게시글 작성 처리
	@PostMapping("insert.do")
	public String insert(@ModelAttribute OffDto dto) throws Exception{
		offService.create(dto);
		return "redirect:adminOff";
	}
	
	//게시글 상세내용 조회
	@GetMapping("view.do")
	public ModelAndView offView(@RequestParam int offNo) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("work/view");
		mav.addObject("dto", offService.read(offNo));
		return mav;
	}
	
	//게시글 수정
	@PostMapping("update.do")
	public String update(@ModelAttribute OffDto dto) throws Exception{
		offService.update(dto);
		return "redirect:adminOff";
	}
	
	//게시글 삭제
	@RequestMapping("delete.do")
	public String delete(@RequestParam int offNo) throws Exception{
		offService.delete(offNo);
		return "redirect:adminOff";
	}
	
	
}
