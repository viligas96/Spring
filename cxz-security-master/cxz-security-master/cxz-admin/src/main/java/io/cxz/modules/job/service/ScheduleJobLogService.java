/**
 * Copyright (c) 2018 cxz开源 All rights reserved.
 *
 * https://www.cxz.io
 *
 * 版权所有，侵权必究！
 */

package io.cxz.modules.job.service;

import io.cxz.common.page.PageData;
import io.cxz.common.service.BaseService;
import io.cxz.modules.job.dto.ScheduleJobLogDTO;
import io.cxz.modules.job.entity.ScheduleJobLogEntity;

import java.util.Map;

/**
 * 定时任务日志
 *
 * @author
 */
public interface ScheduleJobLogService extends BaseService<ScheduleJobLogEntity> {

	PageData<ScheduleJobLogDTO> page(Map<String, Object> params);

	ScheduleJobLogDTO get(Long id);
}
