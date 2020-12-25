# MyBatis

# 1. 개요
`자바 퍼시스턴트 프레임워크` 중 하나
- `XML 서술자`나 `어노테이션`을 사용하여 저장 프로시저나 SQL문으로 객체들을 연결시킴
  - `POJO`를 통해 비즈니스를 처리하게 하고 SQL 문장은 `XML 문서`로 분리하여 사용한다.

## 1.1. 라이브러리 다운로드
https://code.google.com/p/mybatis 접속 후 라이브러리 다운받아 압축해제
- mybatis-3.5.6.jar -> WEB-INF/lib 경로에 복사

## 1.2. `SqlSessionFactory` 빌드하기
`SqlSessionFactory`: DB 연결을 위한 정보와 SQL, Transaction 등과 같은 관련된 정보를 가지고 있는 요소
- Java Bean이나 Servlet에서 JDBC를 연결하기 위한 클래스를 정의한 후 해당 클래스를 생성하여 Connection을 가져오는 역할과 유사함
XML로 빌드해보자.
- `WEB-INF/classes` 또는 `src` 안에 존재해야 함
- `<configuration/>` 안에 `<enviroments/>`, `<mappers/>` 요소 존재
  - <enviroments/>: 데이터베이스 연결 정보와 같은 내용 기술
  - <mappers/>: SQL 문장들이 기술되어 있는 xml 파일들의 경로와 파일명 기술

## 1.3. 환경설정
### 1.3.1. 프로퍼티 사용하지 않고 설정
config.xml
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE configuration
	PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
	"http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
	<environments default="development">
		<environment id="development">
			<transactionManager type="JDBC" />
			<dataSource type="POOLED">
				<property name="driver"
					value="oracle.jdbc.driver.OracleDriver" />
				<property name="url"
					value="jdbc:oracle:thin:@localhost:1521:XE" />
				<property name="username" value="system" />
				<property name="password" value="oracle" />
			</dataSource>
		</environment>
	</environments>

	<mappers>
		<mapper resource="board/board.xml" />
	</mappers>
</configuration>
```
- transactionManager
  - 1) `JDBC`: 커밋과 롤백을 간단하게 처리. 트랜잭션의 스코프를 관리하기 위해 dataSource로부터 커넥션을 가져옴. ✔︎
  - 2) `MANAGED`: 커밋이나 롤백을 실행하지 않음.
- dataSource
  - `UNPOOLED`: 매 요청에 대해 커넥션을 열고 닫는다.
  - `POOLED`: DataSource에 풀링이 적용된 JDBC Connection을 사용한다. ✔︎
  - `JNDI`: 컨테이너 설정에 따라 설정이 변경되며 JNDI 컨텍스트를 참조한다.
- Mappers
  - SQL 문장들이 기술되어 있는 xml 파일들을 지정함.
  - 경로를 설정하지 않으면 `WEB-INF/classes` 안에, 설정했다면 `src` 안에 존재해야 함

### 1.3.2. 프로퍼티 사용하여 설정
Database 연결과 관련한 정보를 별도의 프로퍼티 파일을 작성하여 사용하는 방법
1. 외부 프로퍼티 파일 작성
- config.properties
```text
driver = oracle.jdbc.driver.OracleDriver
url = jdbc:oracle:thin:@127.0.0.1:1521:xe
username = system
password = oracle
```
2. 외부 프로퍼티 파일 정보를 `<properties/>`를 사용하여 정의
3. 프로퍼티로 적용할 부분을 `${프로퍼티명}`으로 수정
```xml
<property name="driver" value="${driver}"/>
<property name="url" value="${url}"/>
<property name="username" value="${username}"/>
<property name="password" value="${password}"/>
```