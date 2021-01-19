package aop.aspectj;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;

public class Advice {
	
	// before
	public boolean signinCheck(JoinPoint joinpoint) {
		// 로그인 여부를 판단하는 프로세스 
		System.out.println("signin check");
		
		return true;
	}
	
	// around
	public Object around(ProceedingJoinPoint pJoinPoint) throws Throwable {
		System.out.println(log());
		
		Object o = pJoinPoint.proceed();
		System.out.println(log());
		
		return o;
	}

	private String log() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E) hh:mm:ss:SS");
		
		return sdf.format(new Date());
	}
	
}
