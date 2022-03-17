package com.kh.helloffice.email.service;

import java.util.List;
import java.util.Map;

import com.kh.helloffice.email.entity.EmailDto;
import com.kh.helloffice.hr.entity.DeptDto;

public interface EmailService {

	Map<String, Object> send(String title, String body, String empName, String email, String empRank, int adminLevel, String empPosition, String depName, int depNo);

	List<DeptDto> getDeptList() throws Exception;

}
