/**
 * Copyright (c) 2018 cxz开源 All rights reserved.
 *
 * https://www.cxz.io
 *
 * 版权所有，侵权必究！
 */

package io.cxz.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import io.cxz.common.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 角色数据权限
 *
 * @author 
 * @since 1.0.0
 */
@Data
@EqualsAndHashCode(callSuper=false)
@TableName("sys_role_data_scope")
public class SysRoleDataScopeEntity extends BaseEntity {
	private static final long serialVersionUID = 1L;

	/**
	 * 角色ID
	 */
	private Long roleId;
	/**
	 * 部门ID
	 */
	private Long deptId;

}