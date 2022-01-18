package com.homeart.mapper.picShare;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.homeart.domain.picShare.picBoardVO;

public interface picBoardMapper {

	// 게시물 조회
	public List<picBoardVO> getListPage(@Param("from") Integer from, @Param("items") Integer numberPerPage);

	public picBoardVO read(Integer id);

	public Integer getCountRows();

	// insert와 delete 모두 void 였는데 int로 바꾸고 실행안시켜봄 오류나면 다시 void로 바꾸기.
	public void insert(picBoardVO board);

	public void delete(Integer board_id);

	public int update(picBoardVO board);

}
