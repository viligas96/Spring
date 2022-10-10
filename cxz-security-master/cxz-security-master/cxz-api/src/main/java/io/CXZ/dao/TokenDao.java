/**
 * Copyright (c) 2018 cxz开源 All rights reserved.
 *
 * https://www.cxz.io
 *
 * 版权所有，侵权必究！
 */

package io.cxz.dao;

import io.cxz.common.dao.BaseDao;
import io.cxz.entity.TokenEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户Token
 * 
 * @author 
 */
@Mapper
public interface TokenDao extends BaseDao<TokenEntity> {
    TokenEntity getByToken(String token);

    TokenEntity getByUserId(Long userId);
}
