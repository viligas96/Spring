/**
 * Copyright (c) 2018 cxz开源 All rights reserved.
 *
 * https://www.cxz.io
 *
 * 版权所有，侵权必究！
 */

package io.cxz;

import io.cxz.common.redis.RedisUtils;
import io.cxz.modules.sys.entity.SysUserEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class RedisTest {
    @Autowired
    private RedisUtils redisUtils;

    @Test
    public void contextLoads() {
        SysUserEntity user = new SysUserEntity();
        user.setEmail("123456@qq.com");
        redisUtils.set("user", user);

        System.out.println(ToStringBuilder.reflectionToString(redisUtils.get("user")));
    }

}