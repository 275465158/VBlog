package org.sang.test;

import org.junit.runner.RunWith;
import org.sang.BlogserverApplication;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = BlogserverApplication.class, webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class Test {
    @Resource(name = "messageSource")
//    private MessageResourceExtension messageResourceExtension;
//    @Before
//    public void init() {
//        System.out.println("开始测试-----------------");
//    }
//
//    @After
//    public void after() {
//        System.out.println("测试结束-----------------");
//    }
    /**
     * 测试Spring注解获取properties文件的值
     */

    @org.junit.Test
    public void test() throws Exception{
//        System.out.println(messageResourceExtension.getBaseFolder());
//        System.out.println(messageResourceExtension.getBasename());
    }
}
