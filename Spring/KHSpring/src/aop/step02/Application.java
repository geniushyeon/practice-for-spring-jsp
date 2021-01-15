package aop.step02;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Application {
	
	public Application() {
		ApplicationContext context = 
				new FileSystemXmlApplicationContext("src/aop/step02/aop_step02.xml");
		
		Advice advice = (Advice)context.getBean("advice");
		System.out.println(advice.beforeAdvice());
		System.out.println("---------------");
		advice.afterReturning();
		System.out.println("---------------");
		advice.aroundAdvice();
	}
	
	public static void main(String[] args) {
		new Application();
	}
}
