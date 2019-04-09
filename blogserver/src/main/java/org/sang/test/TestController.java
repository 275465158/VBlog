package org.sang.test;

import org.sang.bean.RespBean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import sun.misc.MessageUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.Locale;

@RestController
public class TestController {
    @Autowired
    private MessageSource messageSource;


    @RequestMapping("/hello")
    public void loginPage(HttpServletRequest request) {
        String msg1 = this.messageSource.getMessage("operation.success", null, Locale.CHINA);
        String msg2 = this.messageSource.getMessage("AbstractUserDetailsAuthenticationProvider.badCredentials", null, Locale.getDefault());
        System.out.println(msg2);
        System.out.println(msg1);
    }
}
