/**
 * Copyright (c) 2018 cxz开源 All rights reserved.
 *
 * https://www.cxz.io
 *
 * 版权所有，侵权必究！
 */

package io.cxz.modules.sys.dao;

import io.cxz.common.dao.BaseDao;
import io.cxz.modules.sys.entity.DictType;
import io.cxz.modules.sys.entity.SysDictTypeEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 字典类型
 *
 * @author 
 */
@Mapper
public interface SysDictTypeDao extends BaseDao<SysDictTypeEntity> {

    /**
     * 字典类型列表
     */
    List<DictType> getDictTypeList();

}
