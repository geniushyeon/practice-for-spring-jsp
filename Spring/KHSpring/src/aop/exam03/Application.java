package aop.exam03;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Application {
	
	public Application() {
		ApplicationContext context = 
				new FileSystemXmlApplicationContext("src/aop/exam03/aop_exam03.xml");
		
		Product product = (Product) context.getBean("tvProduct");
		
		String findStr = "";
		List<String> list = product.select(findStr);
		
	}
	
	
	public static void main(String[] args) {
		new Application();
	}
}
