package mvc.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mvc.bean.MemberFactory;

public class MemberDao implements Dao {
	SqlSession sqlSession;

	public MemberDao() {

	}

	public MemberDao(MemberFactory memberFactory) {
		sqlSession = MemberFactory.getFactory().openSession();
	}

	@Override
	public boolean signin(String mid, String password) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int getTotalListSize(String findStr) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public Map<String, Object> select(Page page) {
		Map<String, Object> map = new HashMap<>();
		
		if (page == null) {
			page = new Page();
			page.setNowPage(1);
		} else if (page.getNowPage() < 1) {
			page.setNowPage(1);
		}
		
		int affectedRows = sqlSession.selectOne("member.totalListSize", page.getFindStr()); // 검색어를 파라미터로 넘겨서 전체 ListSize를 구함 
		page.setTotalListSize(affectedRows);
		
		List<MemberVo> list = sqlSession.selectList("member.select", page);
		
		map.put("list", list);
		map.put("page", page);
		
		return map;
		
	}

	@Override
	public String insert(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String delete(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVo view(String mid) {
		// TODO Auto-generated method stub
		return null;
	}

}
