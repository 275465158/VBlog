package org.sang.test;

import org.sang.bean.RespBean;
import org.sang.exceptions.CommonBusinessException;
import org.sang.service.TestService;
import org.sang.utils.MessageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.Locale;

@RestController
public class TestController {


    @RequestMapping("/hello")
    public RespBean loginPage(HttpServletRequest request) {
        System.out.println(MessageUtils.get("user.title"));
//        testService.test();
//        throw new CommonBusinessException("异常测试");
        return new RespBean("error", "尚未登录，请登录!");
    }
}
