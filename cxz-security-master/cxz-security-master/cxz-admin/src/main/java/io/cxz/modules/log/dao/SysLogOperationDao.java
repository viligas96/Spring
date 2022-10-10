/**
 * Copyright (c) 2018 cxz开源 All rights reserved.
 *
 * https://www.cxz.io
 *
 * 版权所有，侵权必究！
 */

package io.cxz.modules.log.dao;

import io.cxz.common.dao.BaseDao;
import io.cxz.modules.log.entity.SysLogOperationEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 操作日志
 *
 * @author
 * @since 1.0.0
 */
@Mapper
public interface SysLogOperationDao extends BaseDao<SysLogOperationEntity> {
	
}
