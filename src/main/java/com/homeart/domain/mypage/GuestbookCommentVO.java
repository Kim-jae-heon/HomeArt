package com.homeart.domain.member;

import lombok.Data;

@Data
public class GuestbookCommentVO {
	private String guestbook_comment_id;
	private String member_id;
	private String guestbook_id;
	private String content;
}
