package di.step04;

import java.util.List;
import java.util.Vector;

public class DataBase implements DB {

	@Override
	public List<String> select(String id) {
		List<String> list = new Vector<>();
		list.add("DataBase " + id);
		
		return list;
	}

	@Override
	public String insert(String id, String pwd) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update(String id, String pwd) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(String id, String pwd, int serial) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
