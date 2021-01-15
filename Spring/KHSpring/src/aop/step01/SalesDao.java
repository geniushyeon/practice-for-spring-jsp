package aop.step01;

import java.util.Date;
import java.text.SimpleDateFormat;

public class SalesDao implements Log {

	public SalesDao() {
		System.out.println(printLog());
	}
	
	@Override
	public String printLog() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E)");
		String date = sdf.format(new Date());
		
		return date;
	}
	
}
