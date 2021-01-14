package di.step02;

import java.util.List;

public interface DB {
	
	public List<String> select(String findStr);
	public String insert(String id, String pwd);
	public String update(String id, int serial);
	public int delete(String id, String pwd, int serial);
	
}
