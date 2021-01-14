package di.step02;

import java.util.List;
import java.util.Vector;

public class MyDB implements DB {

	@Override
	public List<String> select(String findStr) {
		List<String> list = new Vector<>();
		list.add("MyDB");
		
		return list;
		
	}

	@Override
	public String insert(String id, String pwd) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update(String id, int serial) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(String id, String pwd, int serial) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
