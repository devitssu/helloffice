package com.kh.helloffice.member.entity;

import lombok.Data;

@Data
public class MemberDto {
	
	private long userNo;
	private String userId;
	private String userPwd;
	private String userNick;
}
