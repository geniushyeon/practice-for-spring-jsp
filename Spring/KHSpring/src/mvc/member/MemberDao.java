package mvc.member;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mvc.bean.MemberFactory;

public class MemberDao implements Dao {
	MemberFactory memberFactory;
	SqlSession sqlSession;

	public MemberDao() {

	}

	public MemberDao(MemberFactory memberFactory) {
		this.memberFactory = memberFactory;
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
		sqlSession = MemberFactory.getFactory().openSession();
		Map<String, Object> map = new HashMap<>();

		if (page == null) {
			page = new Page();
			page.setNowPage(1);
		} else if (page.getNowPage() < 1) {
			page.setNowPage(1);
		}

		int affectedRows = sqlSession.selectOne("member.totalListSize", page); // 검색어를 파라미터로 넘겨서 전체 ListSize를 구함 
		page.setTotalListSize(affectedRows);
		page.pageCompute();

		List<MemberVo> list = sqlSession.selectList("member.select", page);

		map.put("list", list);
		map.put("page", page);

		sqlSession.close();

		return map;

	}

	@Override
	public String insert(MemberVo memberVo) {
		String message = "회원 정보가 정상적으로 저장되었습니다.";
		sqlSession = MemberFactory.getFactory().openSession();
		int affectedRows = sqlSession.insert("member.insert", memberVo);

		if (affectedRows < 1) {
			message = "회원 정보 저장 중 오류 발생";
			sqlSession.rollback();
		}

		sqlSession.commit();
		sqlSession.close();

		return message;
	}

	@Override
	public String update(MemberVo memberVo) {
		String message = "회원 정보가 정상적으로 수정되었습니다.";
		sqlSession = MemberFactory.getFactory().openSession();
		
		int affectedRows = sqlSession.update("member.update", memberVo);
		
		if (affectedRows > 0) {
			
		} else {
			message = "회원 정보 수정 중 오류 발생.";
		}
		return message;
	}

	@Override
	public String delete(MemberVo memberVo) {
		String message = "회원 정보가 정상적으로 삭제되었습니다.";
		sqlSession = MemberFactory.getFactory().openSession();
		
		int affectedRows = sqlSession.delete("member.delete", memberVo);
		
		if (affectedRows > 0) {
			// 파일 삭제
			File file = new File(FileUpload.saveDir + memberVo.getDelFile());
			
			if (file.exists())
				file.delete();
			
			sqlSession.commit();
		} else {
			message = "회원 정보 삭제 중 오류 발생";
			sqlSession.rollback();
		}
		
		sqlSession.close();
		
		return message;
		 
	}

	@Override
	public MemberVo view(String mid) {
		sqlSession = MemberFactory.getFactory().openSession();

		MemberVo memberVo = sqlSession.selectOne("member.view", mid);

		sqlSession.close();

		return memberVo;
	}

}
