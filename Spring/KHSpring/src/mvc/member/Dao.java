package mvc.member;

import java.util.List;
import java.util.Map;

public interface Dao {
	public boolean signin(String mid, String password);
	public int getTotalListSize(String findStr);
	public Map<String, Object> select(Page page);
	public String insert(MemberVo memberVo);
	public String update(MemberVo memberVo);
	public String delete(MemberVo memberVo);
	public MemberVo view(String mid);

}
