package com.homeart.mapper.masterpiece;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.homeart.domain.masterpiece.MasterpieceVO;

public interface MasterpieceMapper {
	
	// 모든 게시물 조회
	public List<MasterpieceVO> getList(); 
	
	// 새 게시물 입력 & get generated key
	public int insert(MasterpieceVO masterpiece_id); 
	
	// id(pk)로 하나의 게시물 조회
	public MasterpieceVO read(Integer id); 
	
	// id(pk)로 하나의 게시물 삭제
	public int delete(Integer id);
	
	// 하나의 게시물 수정
	public int update(MasterpieceVO board);

	public List<MasterpieceVO> getListPage(@Param("from") Integer from, @Param("items") Integer numberPerPage);

	public Integer getCountRows();

	public int deleteByMemberId(String memberId);

	public Integer[] selectByMemberId(String memberId);
	
	int fileinsert(String masterpiece_id, String file_name);
}









