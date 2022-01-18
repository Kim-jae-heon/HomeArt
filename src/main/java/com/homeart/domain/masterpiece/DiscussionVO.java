package com.homeart.domain.masterpiece;

import lombok.Data;

@Data
public class DiscussionVO {
	private Integer discussion_id;			// 토론 ID
	private Integer masterpiece;			// 명화 ID key
	private String member_id;				// 댓글 작성자 ID
	private String content;					// 댓글 내용
}
