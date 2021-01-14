package di.step02;

import java.util.ArrayList;
import java.util.List;

public class OracleDB implements DB {

	@Override
	public List<String> select(String findStr) {
		List<String> list = new ArrayList<>();
		String r = "오라클에서 검색됨.";
		
		list.add(r);
		
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
