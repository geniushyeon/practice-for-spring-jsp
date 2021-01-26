package aop.annotation;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class BeforeAdvice {
	
	// @어노테이션("포인트컷표현식")
	@Before("execution(* insert(..))")
	public Object check(JoinPoint joinPoint) {
		TvProduct tvProduct = (TvProduct) joinPoint.getTarget();
		
		System.out.println("BeforeAdvice");
		System.out.println("로그인 체크 완료");
		
		return tvProduct;
	}
}
