# 20210114
# DI
Dependency Injection: `의존성 주입`
## 1단계
- 개발자별로 Database를 연결하는 프로그램을 개발하여 사용
  - 개발자의 성향대로 각기 다른 코드가 만들어짐 -> 공통 모듈로써 사용하기에는 어려움
  - 비즈니스 로직을 처리하는 코드 내에 new 연산자를 통해 객체를 생성하여 사용하므로 `의존성`이 강함
## 2단계
- Step 1의 문제점
  - 클래스가 모두 다르다.
  - 구현된 메소드명이 모두 다르며, 반환형의 종류가 일치하지 않는다.
    - `인터페이스`를 만들어 모든 클래스에서 상속받게 함으로써 해결
DB.java(interface)
```java
package di.step02;

import java.util.List;

public interface DB {
	
	public List<String> select(String findStr);
	public String insert(String id, String pwd);
	public String update(String id, int serial);
	public int delete(String id, String pwd, int serial);
	
}

```
# 20210115
# 1. `어노테이션`을 통한 의존성 주입
## 1.1. `@Autowired`
- byName: 이름이 동일한 친구를 주입시켜줘
- byType: 타입이 동일한 친구를 주입시켜줘
## 1.2. `constructor`
생성자를 주입시켜줘

# 2. AOP
Aspect-Oriented Programming: `관점 지향 프로그래밍`
- `횡단 관심사`(Cross Concern): 모든 레이어에 걸쳐 공통적으로 사용하는 모듈들
- 관심사를 분리하여 따로 정의한 후 필요한 부분에 자동으로 적용시키는 것.
  - 로깅(logging)
  - 퍼포먼스 측정
## 2.1. Aspect
공통 사항, 핵심 사항
## 2.2. Weaving
분리된 관심사(`Advice`)를 적용하는 행위
## 2.3. Advice
분리된 관심사
1. Before Advice: 대상 객체의 메소드 호출 전에 공통 기능 실행
2. After Returning Advice: 대상 객체의 메소드가 `예외 없이` 실행된 이후 공통된 기능 실행
3. After Throwing Advice: 대상 객체의 메소드를 실행하는 도중 `예외가 발생한 경우` 공통 기능 실행
4. Introduction: 대상 객체의 메소드를 실행하는 도중 `예외가 발생했는지의 여부와 상관없이` 메소드 실행 후 공통 기능 실행
- try~catch~finally의 finally와 비슷함.
5. Around Advice: 대상 객체의 메소드 실행 전후 또는 익셉션 발생 시점에 공통 기능을 실행
## 2.4. JoinPoint(PointCut)
- Advice가 적용되는 지점
- PointCut들의 모임이 JoinPoint. 굳이 구별하지는 않음.
## 2.5. Advisor
Advice들의 묶음. Spring에서만 나오는 개념.

# 3. 실습
## 3.1. POJO
### 3.1.1. 1단계
- BoardDao, SalesDao, MemberDao에서 모두 로그를 출력해야 한다.
  - 여기서 Log = Cross Concern(횡단적 관심사)
  - -> Log interface 만들어서 상속시킴.
### 3.1.2. 2단계
- 로그를 출력해야 하는 과정이 모든 프로그램에 있어야 하기 때문에 모든 개발자는 로그를 출력하기 위한 코드를 작성해야만 한다.
    - 횡단적으로 분포되어 있는 로그 출력 부분(= 관심사 = 관점 = 관심)을 분리하여 별도의 `Advice` 클래스 구성

