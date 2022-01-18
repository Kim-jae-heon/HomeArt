package com.homeart.mapper.freeBoard;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.homeart.domain.freeBoard.freeBoardVO;

public interface freeBoardMapper {
	
	//새 게시물 입력
	public int insert(freeBoardVO board);

	//id파라미터로 하나의 게시물 조회
	public freeBoardVO read(Integer id);

	//게시물 수정
	public int update(freeBoardVO board);

	//게시물 삭제
	public int delete(Integer id);

	//데이터 목록 & 페이지 정보 가져오기
	public List<freeBoardVO> getList(@Param("from") Integer from, @Param("items") Integer numberPerPage);

	//총 게시물 수 가져오기
	public Integer countBoard();

	public List<freeBoardVO> getAdminList();


}
