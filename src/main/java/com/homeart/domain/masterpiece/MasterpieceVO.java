package com.homeart.domain.masterpiece;

import lombok.Data;

@Data
public class MasterpieceVO {
	private Integer masterpiece_id;	// 명화 ID key
	private String member_id;		// 작성자 ID
	private String title;			// 작품명
	private String content;			// 작품 설명
	private String country;			// 작품 국가
	private String artist;			// 작가
	private String age;				// 시대
	private String file_name;		// 파일이름
	
	private String nickName;		// 멤버TABLE 닉네임
}