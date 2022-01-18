package com.homeart.domain.picShare;

import lombok.Data;

@Data
public class picPageInfoVO {

	private Integer lastPage;
	
	private Integer countRows;
	
	private Integer currentPage;
	
	private Integer leftPageNumber;
	private Integer rightPageNumber;
	
	private Boolean hasPrevButton;
	private Boolean hasNextButton;
	
}
