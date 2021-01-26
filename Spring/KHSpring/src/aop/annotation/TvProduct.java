package aop.annotation;

import java.util.ArrayList;
import java.util.List;

public class TvProduct implements Product {

	@Override
	public List<String> select(String findStr) {
		List<String> list = new ArrayList<>();
		
		list.add("삼성");
		list.add("LG");
		
		return list;
	}

	@Override
	public int insert(String name) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(String name) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int serial) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
