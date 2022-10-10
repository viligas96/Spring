/**
 * Copyright (c) 2018 cxz开源 All rights reserved.
 *
 * https://www.cxz.io
 *
 * 版权所有，侵权必究！
 */

package io.cxz.modules.sys.service;


import io.cxz.common.page.PageData;
import io.cxz.common.service.BaseService;
import io.cxz.modules.sys.dto.SysRoleDTO;
import io.cxz.modules.sys.entity.SysRoleEntity;

import java.util.List;
import java.util.Map;


/**
 * 角色
 * 
 * @author 
 */
public interface SysRoleService extends BaseService<SysRoleEntity> {

	PageData<SysRoleDTO> page(Map<String, Object> params);

	List<SysRoleDTO> list(Map<String, Object> params);

	SysRoleDTO get(Long id);

	void save(SysRoleDTO dto);

	void update(SysRoleDTO dto);

	void delete(Long[] ids);

}
