/**
 * Copyright (c) 2018 cxz开源 All rights reserved.
 *
 * https://www.cxz.io
 *
 * 版权所有，侵权必究！
 */

package io.cxz.common.aspect;

import io.cxz.common.exception.ErrorCode;
import io.cxz.common.exception.RenException;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * Redis切面处理类
 *
 * @author
 */
@Aspect
@Component
public class RedisAspect {
    private Logger logger = LoggerFactory.getLogger(getClass());
    /**
     * 是否开启redis缓存  true开启   false关闭
     */
    @Value("${cxz.redis.open: false}")
    private boolean open;

    @Around("execution(* io.cxz.common.redis.RedisUtils.*(..))")
    public Object around(ProceedingJoinPoint point) throws Throwable {
        Object result = null;
        if(open){
            try{
                result = point.proceed();
            }catch (Exception e){
                logger.error("redis error", e);
                throw new RenException(ErrorCode.REDIS_ERROR);
            }
        }
        return result;
    }
}
