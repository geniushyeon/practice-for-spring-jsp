package kr.or.iei.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.iei.board.BoardVo;
import kr.or.iei.board.Page;

@Service // 서비스 레이어, 내부에서 자바 로직 처리 
@Transactional
public class BoardService {

	@Autowired
	BoardMapper boardMapper;
	
	public List<BoardVo> select() {
		Page page = new Page();
		
		List<BoardVo> list = boardMapper.select(page);
		System.out.println("BoardService.select()"); // 확인
		for (BoardVo vo : list) {
			System.out.println(vo.getSubject());
		}
		
		return list;
	}
}
