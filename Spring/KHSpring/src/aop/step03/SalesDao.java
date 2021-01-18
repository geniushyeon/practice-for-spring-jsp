package aop.step03;

import java.util.List;

public class SalesDao implements Dao {

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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String delete() {
		String temp = "SalesDao.delete()";
		
		return temp;		
	}

	@Override
	public String comment() {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}
