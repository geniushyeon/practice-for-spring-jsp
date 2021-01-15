package aop.step01;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardDao implements Log {
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	public BoardDao() {
		System.out.println(printLog());
	}
	
	@Override
	public String printLog() {
		String date = sdf.format(new Date());
		
		return date;
	
	}
	
}
