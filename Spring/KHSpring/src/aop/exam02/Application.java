package aop.exam02;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Application {
	
	public Application() {
		ApplicationContext context = 
				new FileSystemXmlApplicationContext("src/aop/exam02/aop_exam02.xml");
		
		Product product = (Product) context.getBean("proxy");
		
		String findStr = "";
		List<String> list = product.select(findStr);
		
	}
	
	
	public static void main(String[] args) {
		new Application();
	}
}
