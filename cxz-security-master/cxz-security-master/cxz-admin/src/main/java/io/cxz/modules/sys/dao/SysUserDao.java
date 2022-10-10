/**
 * Copyright (c) 2018 cxz开源 All rights reserved.
 *
 * https://www.cxz.io
 *
 * 版权所有，侵权必究！
 */

package io.cxz.modules.sys.dao;

import io.cxz.common.dao.BaseDao;
import io.cxz.modules.sys.entity.SysUserEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 系统用户
 * 
 * @author
 */
@Mapper
public interface SysUserDao extends BaseDao<SysUserEntity> {

	List<SysUserEntity> getList(Map<String, Object> params);

	SysUserEntity getById(Long id);

	SysUserEntity getByUsername(String username);

	int updatePassword(@Param("id") Long id, @Param("newPassword") String newPassword);

	/**
	 * 根据部门ID，查询用户数
	 */
	int getCountByDeptId(Long deptId);

	/**
	 * 根据部门ID,查询用户ID列表
	 */
	List<Long> getUserIdListByDeptId(List<Long> deptIdList);
}