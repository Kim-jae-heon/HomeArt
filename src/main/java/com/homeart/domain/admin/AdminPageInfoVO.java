package com.homeart.domain.admin;

import lombok.Data;

@Data
public class AdminPageInfoVO {
	private Integer lastPage;
	
	private Integer countRows;
	
	private Integer currentPage;
	
	private Integer leftPageNumber;
	private Integer rightPageNumber;
	
	private Boolean hasPrevButton;
	private Boolean hasNextButton;
}
