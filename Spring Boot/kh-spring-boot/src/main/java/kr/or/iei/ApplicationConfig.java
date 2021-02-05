package kr.or.iei;

import org.aspectj.lang.annotation.Aspect;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import kr.or.iei.board.BoardVo;

// Spring Boot에서 DI를 구성하는 또다른 방법 
@Aspect
@Configuration
public class ApplicationConfig {
	
	@Bean
	public BoardVo getBoardVo() {
		return new BoardVo();
	}

}
