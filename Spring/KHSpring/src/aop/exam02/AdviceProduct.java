package aop.exam02;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;

public class AdviceProduct implements MethodInterceptor {

	@Override
	public Object invoke(MethodInvocation invocation) throws Throwable {
		Object o = null;
		aroundAdvice();
		o = invocation.proceed(); // joinpoint
		System.out.println(o);
		aroundAdvice();
		
		return o;
	}
	
	public boolean aroundAdvice() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E) hh:mm:ss"); 
		System.out.println(sdf.format(new Date()));
		
		return true;
	}
	
}
