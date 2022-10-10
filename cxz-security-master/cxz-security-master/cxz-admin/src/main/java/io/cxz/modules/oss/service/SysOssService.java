/**
 * Copyright (c) 2018 cxz开源 All rights reserved.
 *
 * https://www.cxz.io
 *
 * 版权所有，侵权必究！
 */

package io.cxz.modules.oss.service;

import io.cxz.common.page.PageData;
import io.cxz.common.service.BaseService;
import io.cxz.modules.oss.entity.SysOssEntity;

import java.util.Map;

/**
 * 文件上传
 * 
 * @author
 */
public interface SysOssService extends BaseService<SysOssEntity> {

	PageData<SysOssEntity> page(Map<String, Object> params);
}
