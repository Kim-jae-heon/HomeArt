package com.homeart.domain.picShare;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class picBoardVO {

	private Integer board_id;
	
	private String title;
	private String content;
	private String writer;
	
	// Member DB의 nickName
	private String nickName;
	
	private String file_name;
	
	private Integer viewCount;
	private Integer likeCount;
	
	private LocalDateTime inserted;
	private LocalDateTime updated;
	
	
	
}
