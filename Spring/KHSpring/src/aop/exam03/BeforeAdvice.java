package aop.exam03;

import org.aspectj.lang.JoinPoint;

public class BeforeAdvice {
	
	public Object check(JoinPoint point) {
		
		TvProduct product = (TvProduct) point.getTarget();
		
		System.out.println("beforeAdvice " + product.name);
		System.out.println("사전 로그인 체크 완료.");
		
		return true;
	}
}
