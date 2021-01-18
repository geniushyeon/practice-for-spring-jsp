package aop.step03;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;

public class Advice implements MethodInterceptor {

	@Override
	public Object invoke(MethodInvocation invocation) throws Throwable {
		Object o = null;
		if (signinCheck()) {
			o = invocation.proceed(); // joinpoint		
		}
		// 반환 타입이 Object이므로 String, List, Object 모두 반환 가능 
		return o;
	}
	
	public boolean signinCheck() {
		// 로그인 여부를 판단하는 프로세스 
		System.out.println("signin check");
		return true;
	}
	
}
