package com.hsshy.beam;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@SpringBootApplication(scanBasePackages = {"com.hsshy.beam"})
@EnableSwagger2
public class BeamRestApplication {

    public static void main(String[] args) {
        SpringApplication.run(BeamRestApplication.class, args);
    }
}
