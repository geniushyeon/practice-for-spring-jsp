package di.step05;

import java.util.List;

public interface DB {
	
	public List<String> select(String id);
	public String insert(String id, String pwd);
	public String update(String id, String pwd);
	public int delete(String id, String pwd, int serial);
	
}
