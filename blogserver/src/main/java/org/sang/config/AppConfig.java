package org.sang.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Description;

//@Configuration
public class AppConfig {

    @Bean(name = "basename",value="classpath:messages")
    @Description("Provides a basic example of a bean，springsecurity国际化的配置类")
    public AppConfig appConfig(){
        return new AppConfig();
    }
}
