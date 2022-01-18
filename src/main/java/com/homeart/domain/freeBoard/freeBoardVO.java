package com.homeart.domain.freeBoard;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

import lombok.Data;

@Data
public class freeBoardVO {
	private Integer board_id;
	private String title;
	private String content;
	private String writer;
	private Integer viewCount; //조회수
	private Integer isPublic; // 글 공개여부
	private Integer isAdmin; // 작성자 - 관리자/고객 여부
	private LocalDateTime inserted;
	private LocalDateTime updated;
	
	private String nickName; // 페이지 작성자는 닉네임으로
	
	public String getBoardInserted() {
		//현재 일시
		LocalDateTime now = LocalDateTime.now(ZoneId.of("+09:00"));
		LocalDateTime beforeOneDayFromNow = now.minusDays(1);
		
		if(inserted.isBefore(beforeOneDayFromNow)) {
			return inserted.toLocalDate().format(DateTimeFormatter.ofPattern("yyyy.MM.dd"));
		}else {
			return inserted.toLocalTime().toString();
		}
	}
}
