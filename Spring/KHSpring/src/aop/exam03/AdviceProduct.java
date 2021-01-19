package aop.exam03;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.aspectj.lang.JoinPoint;

public class AdviceProduct {

	// before 
	public boolean signinCheck(JoinPoint joinpoint) {
		System.out.println("signin check");
		
		return true;
	}
	
	// after
	// ProceedingJoinPoint는 around advice일때만 지원 
	public Object afterAdvice(JoinPoint joinpoint) {
		System.out.println(printLog());
		
		return null;
	}
	
	
	public String printLog() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E) hh:mm:ss:SS");
		
		return sdf.format(new Date());
	}
	
	
}
