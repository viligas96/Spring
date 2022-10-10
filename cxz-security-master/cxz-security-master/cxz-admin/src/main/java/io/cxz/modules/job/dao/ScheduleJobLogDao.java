/**
 * Copyright (c) 2018 cxz开源 All rights reserved.
 *
 * https://www.cxz.io
 *
 * 版权所有，侵权必究！
 */

package io.cxz.modules.job.dao;

import io.cxz.common.dao.BaseDao;
import io.cxz.modules.job.entity.ScheduleJobLogEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 定时任务日志
 *
 * @author 
 */
@Mapper
public interface ScheduleJobLogDao extends BaseDao<ScheduleJobLogEntity> {
	
}
