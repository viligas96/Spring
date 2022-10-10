/**
 * Copyright (c) 2018 cxz开源 All rights reserved.
 *
 * https://www.cxz.io
 *
 * 版权所有，侵权必究！
 */

package io.cxz.modules.log.enums;

/**
 * 操作状态枚举
 *
 * @author 
 * @since 1.0.0
 */
public enum OperationStatusEnum {
    /**
     * 失败
     */
    FAIL(0),
    /**
     * 成功
     */
    SUCCESS(1);

    private int value;

    OperationStatusEnum(int value) {
        this.value = value;
    }

    public int value() {
        return this.value;
    }
}