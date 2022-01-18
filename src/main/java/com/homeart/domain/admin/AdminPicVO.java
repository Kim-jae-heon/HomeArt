package com.homeart.domain.admin;

import lombok.Data;

@Data
public class AdminPicVO {
	
	private Long masterpiece_id;
	private String title;
	private String content;
	private String member_id;
	private String country;
	private String artist;
	private String age;
	private String file_name;
	
	private Long discusstion_id;
	private String discussion;
	
}
