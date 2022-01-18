package com.homeart.domain.member;

import lombok.Data;

@Data
public class GuestbookVO {
	private String guestbook_id;
	private String member_id;
	private String content;
	private String mypage_owner;
}
