package com.homeart.domain.admin;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class AdminPicShareVO {
	private Integer board_id;
	private String title;
	private String content;
	private String writer;
	private String file_name;
	private Integer viewCount;
	
	private LocalDateTime inserted;
	private LocalDateTime updated;
	
	private Integer likeCount;
}
