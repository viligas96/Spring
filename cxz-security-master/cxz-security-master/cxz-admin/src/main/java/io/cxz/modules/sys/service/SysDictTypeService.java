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
import io.cxz.modules.sys.dto.SysDictTypeDTO;
import io.cxz.modules.sys.entity.DictType;
import io.cxz.modules.sys.entity.SysDictTypeEntity;

import java.util.List;
import java.util.Map;

/**
 * 数据字典
 *
 * @author
 */
public interface SysDictTypeService extends BaseService<SysDictTypeEntity> {

    PageData<SysDictTypeDTO> page(Map<String, Object> params);

    SysDictTypeDTO get(Long id);

    void save(SysDictTypeDTO dto);

    void update(SysDictTypeDTO dto);

    void delete(Long[] ids);

    /**
     * 获取所有字典
     */
    List<DictType> getAllList();

}