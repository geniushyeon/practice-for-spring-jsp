package di.step06;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Main {
	
	public static void main(String[] args) {
		ApplicationContext context = new FileSystemXmlApplicationContext("src/di.step06/di_step06.xml");
		
		MemberDao dao = context.getBean("dao", MemberDao.class);
	}
}
