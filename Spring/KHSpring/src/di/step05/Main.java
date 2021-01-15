package di.step05;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Main {
	
	public static void main(String[] args) {
		
		ApplicationContext context = new FileSystemXmlApplicationContext("src/di.step05/di_step05.xml");
		MemberDao dao = context.getBean("dao", MemberDao.class);
		
	}
}
