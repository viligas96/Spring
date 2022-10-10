/**
 * Copyright (c) 2019 cxz开源 All rights reserved.
 * <p>
 * https://www.cxz.io
 * <p>
 * 版权所有，侵权必究！
 */

package io.cxz.modules.sys.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

/**
 *  字典数据
 *
 * @author 
 */
@Data
public class DictData {
    @JsonIgnore
    private Long dictTypeId;
    private String dictLabel;
    private String dictValue;
}
