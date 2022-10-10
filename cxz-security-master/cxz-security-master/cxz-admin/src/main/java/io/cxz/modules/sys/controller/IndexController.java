package io.cxz.modules.sys.controller;

import io.cxz.common.utils.Result;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 首页提示
 *
 * @author 
 */
@RestController
public class IndexController {

    @GetMapping("/")
    public Result<String> index(){
        String tips = "你好，cxz-admin已启动，请启动cxz-ui，才能访问页面！";
        return new Result<String>().ok(tips);
    }
}
