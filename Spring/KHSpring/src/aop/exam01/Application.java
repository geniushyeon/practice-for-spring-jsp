package aop.exam01;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Application {
	
	public Application() {
		ApplicationContext context = 
				new FileSystemXmlApplicationContext("src/aop/exam01/aop_exam01.xml");
		
		Advice advice = (Advice)context.getBean("advice");
		advice.beforeAdvice();
	}
	
	public static void main(String[] args) {
		new Application();
	}
	
}
