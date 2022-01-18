package com.homeart.domain.freeBoard;

import lombok.Data;

@Data
public class PageInfoVO {
	private Integer countBoard; //총 게시물 수
	private Integer currentPage; //현재 페이지 번호
	private Integer lastPage; //마지막 페이지번호
	private Integer leftPageNumber; //가장 왼쪽 번호
	private Integer rightPageNumber; //가장 오른쪽 번호
	private Boolean hasPrevButton; //이전 페이지 버튼 존재유무
	private Boolean hasNextButton; //다음 페이지 버튼 존재유무
}
