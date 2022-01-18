package com.homeart.domain.admin;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class AdminMemberVO {
	private String member_id;
	private String member_name;
	private String password;
	private String nickName;
	private String email;
	private String country;
	private LocalDateTime inserted;
	private Integer isAdmin;
}
