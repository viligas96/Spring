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
import io.cxz.modules.sys.dto.SysDictDataDTO;
import io.cxz.modules.sys.entity.SysDictDataEntity;

import java.util.Map;

/**
 * 数据字典
 *
 * @author 
 */
public interface SysDictDataService extends BaseService<SysDictDataEntity> {

    PageData<SysDictDataDTO> page(Map<String, Object> params);

    SysDictDataDTO get(Long id);

    void save(SysDictDataDTO dto);

    void update(SysDictDataDTO dto);

    void delete(Long[] ids);

}