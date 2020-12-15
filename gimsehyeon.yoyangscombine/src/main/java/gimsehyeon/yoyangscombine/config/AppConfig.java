package gimsehyeon.yoyangscombine.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import gimsehyeon.yoyangscombine.web.interceptor.AdminInterceptor;
import gimsehyeon.yoyangscombine.web.interceptor.LoginInterceptor;

@Configuration
@EnableWebMvc
@ImportResource("classpath:gimsehyeon/yoyangscombine/config/app.xml")
@ComponentScan("gimsehyeon.yoyangscombine")
public class AppConfig implements WebMvcConfigurer {
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}
	
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp("/WEB-INF/view/", ".jsp");
	}
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/").setViewName("main");
		//registry.addViewController("/admin").setViewName("admin/main");
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(loginInterceptor()).addPathPatterns("/communication/**");
		registry.addInterceptor(loginInterceptor()).addPathPatterns("/common/**");
		registry.addInterceptor(adminInterceptor()).addPathPatterns("/admin/**");
	}
	
	@Bean
	public LoginInterceptor loginInterceptor() {
		return new LoginInterceptor();
	}
	
	@Bean
	public AdminInterceptor adminInterceptor() {
		return new AdminInterceptor();
	}
}