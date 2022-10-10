/**
 * Copyright (c) 2018 cxz开源 All rights reserved.
 *
 * https://www.cxz.io
 *
 * 版权所有，侵权必究！
 */

package io.cxz.modules.security.service;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 验证码
 *
 * @author 
 */
public interface CaptchaService {

    /**
     * 图片验证码
     */
    void create(HttpServletResponse response, String uuid) throws IOException;

    /**
     * 验证码效验
     * @param uuid  uuid
     * @param code  验证码
     * @return  true：成功  false：失败
     */
    boolean validate(String uuid, String code);
}
