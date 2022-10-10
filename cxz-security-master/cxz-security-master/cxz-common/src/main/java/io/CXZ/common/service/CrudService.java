/**
 * Copyright (c) 2018 cxz开源 All rights reserved.
 * <p>
 * https://www.cxz.io
 * <p>
 * 版权所有，侵权必究！
 */

package io.cxz.common.service;

import io.cxz.common.page.PageData;

import java.util.List;
import java.util.Map;

/**
 *  CRUD基础服务接口
 *
 * @author
 */
public interface CrudService<T, D> extends BaseService<T> {

    PageData<D> page(Map<String, Object> params);

    List<D> list(Map<String, Object> params);

    D get(Long id);

    void save(D dto);

    void update(D dto);

    void delete(Long[] ids);

}