package aop.aspectj;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BoardDao implements Dao {

	public BoardDao() {
		
	}
	
	@Override
	public List<String> select() {
		List<String> list = new ArrayList<>();
		
		list.add("kim");
		list.add("lee");
		list.add("yoon");
		
		System.out.println("BoardDao.select()");
		
		return list;
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
