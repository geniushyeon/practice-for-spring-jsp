package aop.step02;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Advice implements Log {
	Dao dao;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E) hh:mm:ss");
	
	public Advice(Dao dao) {
		this.dao = dao;
	}
	
	@Override
	public String printLog() {
		String date = sdf.format(new Date());
		
		return date;
	}
	
	public String beforeAdvice() {
		// 비즈니스 로직을 처리하기 전에 로그 출력 
		System.out.println(printLog());
		String temp = dao.insert();
		return temp;

	}
	
	public void afterReturning() {
		String temp = dao.insert();
		System.out.println(temp);
		// 비즈니스 로직을 처리한 후에 로그 출력 
		System.out.println(printLog());
			
		
	}
	
	public void aroundAdvice() {
		System.out.println(printLog());
		System.out.println(dao.insert());
		System.out.println(printLog());
		
	}
	
}
