/**
 * Copyright (c) 2018 cxz开源 All rights reserved.
 *
 * https://www.cxz.io
 *
 * 版权所有，侵权必究！
 */

package io.cxz.dao;

import io.cxz.common.dao.BaseDao;
import io.cxz.entity.UserEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户
 * 
 * @author
 */
@Mapper
public interface UserDao extends BaseDao<UserEntity> {
    UserEntity getUserByMobile(String mobile);

    UserEntity getUserByUserId(Long userId);
}
