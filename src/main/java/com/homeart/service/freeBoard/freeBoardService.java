package com.homeart.service.freeBoard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.homeart.domain.freeBoard.PageInfoVO;
import com.homeart.domain.freeBoard.freeBoardVO;
import com.homeart.mapper.freeBoard.freeBoardMapper;

import lombok.Setter;


	
@Service
public class freeBoardService {
	
	@Setter(onMethod_ = @Autowired)
	private freeBoardMapper mapper;

	//insert
	public boolean post(freeBoardVO board) {
		return mapper.insert(board) == 1;
	}

	//get
	public freeBoardVO get(Integer id) {
		return mapper.read(id);
	}

	//modify
	public boolean modify(freeBoardVO board) {
		return mapper.update(board) == 1;
	}

	//remove 게시물 delete
	public boolean remove(Integer id) {
		return mapper.delete(id) == 1;
	}
	
	//관리자 공지목록
	public List<freeBoardVO> getList() {
		return mapper.getAdminList();
	}

	//회원게시getList & pageInfo
	public List<freeBoardVO> getList(Integer page, Integer numberPerPage) {
		//sql에서 사용할 record 시작번호(0-index)
		Integer from = (page-1) * 10;
		return mapper.getList(from, numberPerPage);
	}

	//pagination
	public PageInfoVO getPageInfo(Integer page, Integer numberPerPage) {
		
		Integer countBoard = mapper.countBoard();//총 게시물수
		Integer lastPage = (countBoard-1) / numberPerPage + 1; //마지막 페이지 번호
		Integer leftPageNumber = (page-1) / 5 * 5 + 1; //가장 왼쪽 번호
		Integer rightPageNumber = (page-1) / 5 * 5 + 5; //가장 오른쪽 번호
		
		//마지막 페이지 넘어가지 않도록 설정
		rightPageNumber = rightPageNumber > lastPage ? lastPage : rightPageNumber;
		
		Boolean hasPrevButton = leftPageNumber != 1; //이전페이지 버튼 존재여부
		Boolean hasNextButton = rightPageNumber != lastPage; //다음페이지 버튼 존재여부
		
		PageInfoVO pageInfo = new PageInfoVO();
		
		pageInfo.setCountBoard(countBoard);
		pageInfo.setCurrentPage(page);
		pageInfo.setLastPage(lastPage);
		pageInfo.setLeftPageNumber(leftPageNumber);
		pageInfo.setRightPageNumber(rightPageNumber);
		pageInfo.setHasPrevButton(hasPrevButton);
		pageInfo.setHasNextButton(hasNextButton);
		
		return pageInfo;
	}
}
