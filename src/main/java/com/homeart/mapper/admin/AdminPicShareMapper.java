package com.homeart.mapper.admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.homeart.domain.admin.AdminPicShareVO;
import com.homeart.domain.picShare.picBoardVO;

public interface AdminPicShareMapper {
	
		public List<AdminPicShareVO> getListPage(@Param("from") Integer from, @Param("items") Integer numberPerPage);

		public AdminPicShareVO read(Integer id);

		public Integer getCountRows();
		
		public void delete(Integer board_id);
}
