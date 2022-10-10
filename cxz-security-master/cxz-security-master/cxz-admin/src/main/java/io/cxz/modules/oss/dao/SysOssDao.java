/**
 * Copyright (c) 2018 cxz开源 All rights reserved.
 *
 * https://www.cxz.io
 *
 * 版权所有，侵权必究！
 */

package io.cxz.modules.oss.dao;

import io.cxz.common.dao.BaseDao;
import io.cxz.modules.oss.entity.SysOssEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 文件上传
 * 
 * @author
 */
@Mapper
public interface SysOssDao extends BaseDao<SysOssEntity> {
	
}
