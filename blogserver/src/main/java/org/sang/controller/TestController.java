package org.sang.controller;

import org.sang.bean.RespBean;
import org.sang.exceptions.CommonBusinessException;
import org.sang.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

//@RestController
public class TestController {
    @Autowired
    TestService testService;

    @RequestMapping("/hello")
    public RespBean loginPage() {
        testService.test();
//        throw new CommonBusinessException("异常测试");
        return new RespBean("error", "尚未登录，请登录!");
    }
}
