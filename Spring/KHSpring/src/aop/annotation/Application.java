package aop.annotation;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Application {
	
	public Application() {
		ApplicationContext context = 
				new FileSystemXmlApplicationContext("src/aop/annotation/aop_annotation.xml");
		
		Product product = (Product) context.getBean("tvProduct");
		
		String findStr = "";
		List<String> list = product.select(findStr);
		System.out.println(list);
		
		int i = product.insert(findStr);
		System.out.println(i);
	}
	
	
	public static void main(String[] args) {
		new Application();
	}
}
