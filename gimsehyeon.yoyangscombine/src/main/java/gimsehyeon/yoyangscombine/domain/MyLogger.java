package gimsehyeon.yoyangscombine.domain;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class MyLogger {
private final Logger logger;
	public MyLogger() {
		logger = LogManager.getLogger(MyLogger.class);
	}
	
	@After("@annotation(gimsehyeon.yoyangscombine.domain.Log)")
	public void log(JoinPoint jp) {
		logger.info(jp.toShortString());
	}
	
	@AfterThrowing(pointcut = "@annotation(gimsehyeon.yoyangscombine.domain.Log)", throwing = "ex")
	public void logError(JoinPoint jp, Throwable ex) {
		logger.error(jp.toShortString() + ": " + ex.getMessage());
	}
}