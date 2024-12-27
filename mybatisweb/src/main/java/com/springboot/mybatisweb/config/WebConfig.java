package com.springboot.mybatisweb.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

// 사진 업로드 작동 코드 
// WebConfig 설정을 통해 외부 경로(C:/upload/)를 웹 애플리케이션의 /images/** URL 패턴으로 매핑

@Configuration
public class WebConfig implements WebMvcConfigurer {
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**").addResourceLocations("file:C:/upload/");
	}
}