package com.pv.productversion;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import springfox.documentation.swagger2.annotations.EnableSwagger2;
//配置swagger2
@EnableSwagger2
@SpringBootApplication
@MapperScan("com.pv.productversion.mapper")
//扫描的包路径
//@ComponentScan(basePackages = {"com.pv.*"})
public class ProductversionApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(ProductversionApplication.class, args);
    }
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(ProductversionApplication.class);
    }

}

