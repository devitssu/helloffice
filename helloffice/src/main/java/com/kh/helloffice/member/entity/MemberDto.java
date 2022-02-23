package com.kh.helloffice.member.entity;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberDto {
	
	private int empNo; // 사원번호
	private int depNo; // 부서번호
	private int adminLevel; // 관리 레벨
	private String empRank; // 직급
	private String empPosition; // 직무
	private String empName; // 사원명
	private String email; // 이메일(계정 ID)
	private String empPwd; // 계정 비밀번호
	private String phone; // 전화번호
	private String resiNo; // 주민등록번호
	private String address; // 주소
	private String bAccount; // 급여계좌
	private String empInfo; // 소개
	private Date entryDate; // 입사일
	private char resignYn; // 퇴사여부
	private int dependentNum; // 피 부양자수
}
