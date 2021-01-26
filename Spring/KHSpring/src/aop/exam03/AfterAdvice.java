package aop.exam03;

import org.aspectj.lang.JoinPoint;

public class AfterAdvice {
	
	public Object log(JoinPoint point) {
		TvProduct product = (TvProduct) point.getTarget();
		
		System.out.println("AfterAdvice " + product.name);
		System.out.println("after 형태로 log 출력.");
		
		return null;
	}
}
