package kr.co.nandsoft.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.CacheControl;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.concurrent.TimeUnit;

@Configuration
@EnableWebMvc
@ComponentScan("kr.co.nandsoft.member.controller")
public class MvcWebConfig implements WebMvcConfigurer {

    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        registry.jsp("/WEB-INF/views/", ".jsp");
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        // Register resource handler for CSS and JS
        registry.addResourceHandler("/css/**").addResourceLocations("/css/")
                .setCacheControl(CacheControl.maxAge(1, TimeUnit.HOURS));

        registry.addResourceHandler("/util/**").addResourceLocations("/util/")
                .setCacheControl(CacheControl.maxAge(1, TimeUnit.HOURS));

        // Register resource handler for images
        registry.addResourceHandler("/images/**").addResourceLocations("/images/")
                .setCacheControl(CacheControl.maxAge(1, TimeUnit.HOURS));
    }
}