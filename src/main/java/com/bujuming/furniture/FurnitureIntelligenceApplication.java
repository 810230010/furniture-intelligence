package com.bujuming.furniture;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.bujuming.furniture.mapper")
public class FurnitureIntelligenceApplication {

    public static void main(String[] args) {
        SpringApplication.run(FurnitureIntelligenceApplication.class, args);
    }

}
