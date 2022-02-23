package com.kh.helloffice.member.entity;

import lombok.Data;

@Data
public class MemberDto {
	
	private int userNo;
	private String userEmail;
	private String userPwd;
	private String userNick;
}
