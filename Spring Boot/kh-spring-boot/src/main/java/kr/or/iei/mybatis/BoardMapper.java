package kr.or.iei.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import kr.or.iei.board.BoardVo;
import kr.or.iei.board.Page;

@Repository // 퍼시스선트 레이어, DB/file같은 외부 I/O 작업 처리 
@Mapper
public interface BoardMapper {
	public List<BoardVo> select(Page page);
		
	
}
