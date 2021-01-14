package di.step03;

import java.util.ArrayList;
import java.util.List;

public class DataBase implements DB {

	@Override
	public List<String> select(String id) {
		List<String> list = new ArrayList<>();
		list.add("오라클에서 처리된 결과");
		
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
