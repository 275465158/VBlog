package org.sang.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class CORSConfiguration extends WebMvcConfigurerAdapter {
    @Override
    public void addCorsMappings(CorsRegistry registry) {
//        registry.addMapping("/api/**")
//                .allowedOrigins("http://domain2.com")
//                .allowedMethods("PUT", "DELETE")
//                .allowedHeaders("header1", "header2", "header3")
//                .exposedHeaders("header1", "header2")
//                .allowCredentials(false).maxAge(3600);
        registry.addMapping("/**").allowedHeaders("*")
                .allowCredentials(false)
                .allowedMethods("PUT", "GET")
                .allowedOrigins("http://127.0.0.1:8080").maxAge(3600);
    }
//    @Bean
//    public WebMvcConfigurer corsConfigurer() {
//        return new WebMvcConfigurerAdapter() {
//            @Override
//            public void addCorsMappings(CorsRegistry registry) {
////addMapping 跨域所能访问的路径
////allowedOrigins：那些域可以访问，默认为任何域都可以访问
//                registry.addMapping("/**").allowedHeaders("*")
//                        .allowCredentials(true)
//                        .allowedMethods("PUT", "GET")
//                        .allowedOrigins("http://127.0.0.1:8080");
//            }
//        };
//    }

}
