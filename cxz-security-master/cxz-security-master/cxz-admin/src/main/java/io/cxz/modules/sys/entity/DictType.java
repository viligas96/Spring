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

import java.util.ArrayList;
import java.util.List;

/**
 * 字典类型
 *
 * @author 
 */
@Data
public class DictType {
    @JsonIgnore
    private Long id;
    private String dictType;
    private List<DictData> dataList = new ArrayList<>();
}
