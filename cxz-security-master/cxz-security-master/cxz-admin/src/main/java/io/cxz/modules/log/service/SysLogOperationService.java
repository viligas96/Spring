/**
 * Copyright (c) 2018 cxz开源 All rights reserved.
 *
 * https://www.cxz.io
 *
 * 版权所有，侵权必究！
 */

package io.cxz.modules.log.service;

import io.cxz.common.page.PageData;
import io.cxz.common.service.BaseService;
import io.cxz.modules.log.dto.SysLogOperationDTO;
import io.cxz.modules.log.entity.SysLogOperationEntity;

import java.util.List;
import java.util.Map;

/**
 * 操作日志
 *
 * @author 
 * @since 1.0.0
 */
public interface SysLogOperationService extends BaseService<SysLogOperationEntity> {

    PageData<SysLogOperationDTO> page(Map<String, Object> params);

    List<SysLogOperationDTO> list(Map<String, Object> params);

    void save(SysLogOperationEntity entity);
}