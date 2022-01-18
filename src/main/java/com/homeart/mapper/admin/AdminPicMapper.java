package com.homeart.mapper.admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.homeart.domain.admin.AdminPicVO;

public interface AdminPicMapper {
	public List<AdminPicVO> getList(@Param("from") Integer from, @Param("numberPerPage") Integer numberPerPage);
	
	public List<AdminPicVO> read(Long masterpiece_id);
	
	public Integer getCountRows();
	
	public int delete(Long masterpiece_id);
	
}
