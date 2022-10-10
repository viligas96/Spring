/**
 * Copyright (c) 2018 cxz开源 All rights reserved.
 *
 * https://www.cxz.io
 *
 * 版权所有，侵权必究！
 */

package io.cxz.modules.sys.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import io.cxz.common.validator.group.AddGroup;
import io.cxz.common.validator.group.DefaultGroup;
import io.cxz.common.validator.group.UpdateGroup;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 角色管理
 *
 * @author
 * @since 1.0.0
 */
@Data
@ApiModel(value = "角色管理")
public class SysRoleDTO implements Serializable {
    private static final long serialVersionUID = 1L;

	@ApiModelProperty(value = "id")
	@Null(message="{id.null}", groups = AddGroup.class)
	@NotNull(message="{id.require}", groups = UpdateGroup.class)
	private Long id;

	@ApiModelProperty(value = "角色名称")
	@NotBlank(message="{sysrole.name.require}", groups = DefaultGroup.class)
	private String name;

	@ApiModelProperty(value = "备注")
	private String remark;

	@ApiModelProperty(value = "创建时间")
	@JsonProperty(access = JsonProperty.Access.READ_ONLY)
	private Date createDate;

	@ApiModelProperty(value = "菜单ID列表")
	private List<Long> menuIdList;

	@ApiModelProperty(value = "部门ID列表")
	private List<Long> deptIdList;

}