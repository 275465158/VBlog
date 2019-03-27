package org.sang.service;

import org.sang.exceptions.CommonBusinessException;
import org.springframework.stereotype.Component;

//@Component
public class TestService {
    public String test() {
        throw new CommonBusinessException("异常测试");
    }
}
