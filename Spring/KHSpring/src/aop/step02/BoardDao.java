package aop.step02;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class BoardDao implements Dao {

	public BoardDao() {
		
	}
	
	@Override
	public List<String> select() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String insert() {
		String temp = "BoardDao.insert()";
		
		return temp;
	}

	@Override
	public String update() {
		// TODO Auto-generated method stub
		return null;
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
