package aop.step02;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class MemberDao implements Dao {

	@Override
	public List<String> select() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String insert() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update() {
		String temp = "MemberDao.update()";
		
		return temp;
		
	}

	@Override
	public String delete() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String comment() {
		// TODO Auto-generated method stub
		return null;
	}
	
}