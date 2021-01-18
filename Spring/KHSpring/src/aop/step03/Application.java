package aop.step03;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Application {
	
	public Application() {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
		ApplicationContext context = 
				new FileSystemXmlApplicationContext("src/aop/step03/aop_step03.xml");
		
		// 표면적으로 advice에 대한 코드가 없음 
		Dao dao = (Dao) context.getBean("proxy");
		String message = dao.insert();
		System.out.println(message);
		
	}
	
	public static void main(String[] args) {
		new Application();
	}
}
