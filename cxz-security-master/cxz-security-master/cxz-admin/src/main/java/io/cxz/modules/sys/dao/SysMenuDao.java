/**
 * Copyright (c) 2018 cxz开源 All rights reserved.
 *
 * https://www.cxz.io
 *
 * 版权所有，侵权必究！
 */

package io.cxz.modules.sys.dao;

import io.cxz.common.dao.BaseDao;
import io.cxz.modules.sys.entity.SysMenuEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 菜单管理
 * 
 * @author
 */
@Mapper
public interface SysMenuDao extends BaseDao<SysMenuEntity> {

	SysMenuEntity getById(@Param("id") Long id);

	/**
	 * 查询所有菜单列表
	 *
	 * @param type 菜单类型
	 */
	List<SysMenuEntity> getMenuList(@Param("type") Integer type);

	/**
	 * 查询用户菜单列表
	 *
	 * @param userId 用户ＩＤ
	 * @param type 菜单类型
	 */
	List<SysMenuEntity> getUserMenuList(@Param("userId") Long userId, @Param("type") Integer type);

	/**
	 * 查询用户权限列表
	 * @param userId  用户ID
	 */
	List<String> getUserPermissionsList(Long userId);

	/**
	 * 查询所有权限列表
	 */
	List<String> getPermissionsList();

	/**
	 * 根据父菜单，查询子菜单
	 * @param pid  父菜单ID
	 */
	List<SysMenuEntity> getListPid(Long pid);

}
