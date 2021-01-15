package aop.step01;

import java.text.SimpleDateFormat;
import java.util.Date;


public class MemberDao implements Log {
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E) hh:mm:ss:SS");
	
	public MemberDao() {
		System.out.println(printLog());
	}
	
	@Override
	public String printLog() {
		String date = sdf.format(new Date());
		
		return date;
	}
	
}
