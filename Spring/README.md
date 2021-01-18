# 20210114
# 1. DI
Dependency Injection: `의존성 주입`
## 1.1. 1단계
- 개발자별로 Database를 연결하는 프로그램을 개발하여 사용
  - 개발자의 성향대로 각기 다른 코드가 만들어짐 -> 공통 모듈로써 사용하기에는 어려움
  - 비즈니스 로직을 처리하는 코드 내에 new 연산자를 통해 객체를 생성하여 사용하므로 `의존성`이 강함
## 1.2. 2단계
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

# 20200118

# Spring AOP 라이브러리 삽입 후 AOP 실습
## 1. mvnrepository.com 접속 후 `spring aop`, `aspectj` 검색하여 pom.xml에 삽입
```xml
<!-- https://mvnrepository.com/artifact/org.springframework/spring-aop -->
<dependency>
	<groupId>org.springframework</groupId>
	<artifactId>spring-aop</artifactId>
	<version>5.2.12.RELEASE</version>
</dependency>

<!-- https://mvnrepository.com/artifact/org.aspectj/aspectjweaver -->
<dependency>
	<groupId>org.aspectj</groupId>
	<artifactId>aspectjweaver</artifactId>
	<version>1.9.6</version>
</dependency>
```

## 싱글톤 
스프링의 bean은 기본적으로 싱글톤임.
- 1개의 객체만 생성 -> 재사용

## 2. MethodInterceptor
특정 메소드가 실행되기 전에 끼어들어서(인터셉트!) 먼저 특정 행위를 함.
- Advice.java
```java
package aop.step03;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;

public class Advice implements MethodInterceptor {

	@Override
	public Object invoke(MethodInvocation invocation) throws Throwable {
		Object o = null;
		if (signinCheck()) {
			o = invocation.proceed(); // joinpoint		
		}
		// 반환 타입이 Object이므로 String, List, Object 모두 반환 가능 
		return o;
	}
	
	public boolean signinCheck() {
		// 로그인 여부를 판단하는 프로세스 
		System.out.println("signin check");
		return true;
	}
	
}

```
pom.xml에 Bean 추가
```xml
<?xml version="1.0" encoding="UTF-8"?>

<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="
	   http://www.springframework.org/schema/beans
	   http://www.springframework.org/schema/beans/spring-beans-4.0.xsd">

	<!-- 의존성 주입 -->
	<bean id="boardDao" class="aop.step03.BoardDao"></bean>
	<bean id="memberDao" class="aop.step03.MemberDao"></bean>
	<bean id="salesDao" class="aop.step03.SalesDao"></bean>

	<!-- 공통적 관심사인 signincheck가 존재하는 클래스-->
	<bean id="advice" class="aop.step03.Advice"></bean>

	<!-- spring aop -->
	<bean id="proxy" class="org.springframework.aop.framework.ProxyFactoryBean">
		<property name="target" ref="boardDao"></property>
		<property name="interceptorNames">
			<list>
				<value>advisor</value>
			</list>
		</property>
	</bean>
	<!-- joinpoint -->
	<bean id="advisor" class="org.springframework.aop.support.DefaultPointcutAdvisor">
		<property name="advice" ref="advice"></property>
		<property name="pointcut">
			<bean class="org.springframework.aop.support.JdkRegexpMethodPointcut">
				<property name="patterns">
					<list>
						<value>.*insert.*</value>
						<value>.*delete.*</value>
						<value>.*update.*</value>
					</list>
				</property>
			</bean>
		</property>

	</bean>

</beans>
```
## 3. 응용
aop.exam02 패키지
1. Dao 기능을 하는 interface인 Product 작성
- CRUD를 처리하는 메소드를 갖는다.
2. Product를 구현한 TvProduct, RadioProduct, PhoneProduct를 작성한다.
3. AdviceProduct.java - `Advice`(공통적 관심사)를 갖는다.
- 현재 시간을 로그로 화면에 출력하도록 작성한다.
```java
package aop.exam02;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;

public class AdviceProduct implements MethodInterceptor {

	@Override
	public Object invoke(MethodInvocation invocation) throws Throwable {
		Object o = null;
		aroundAdvice();
		o = invocation.proceed(); // joinpoint
		System.out.println(o);
		aroundAdvice();
		
		return o;
	}
	
	public boolean aroundAdvice() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E) hh:mm:ss"); 
		System.out.println(sdf.format(new Date()));
		
		return true;
	}
	
}
```
4. Application.java
- 메인 메소드
```java
package aop.exam02;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Application {
	
	public Application() {
		ApplicationContext context = 
				new FileSystemXmlApplicationContext("src/aop/exam02/aop_exam02.xml");
		
		Product product = (Product) context.getBean("proxy");
		
		String findStr = "";
		List<String> list = product.select(findStr);
		
	}
	
	
	public static void main(String[] args) {
		new Application();
	}
}

```
5. aop_exam02.xml
```xml
<?xml version="1.0" encoding="UTF-8"?>

<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="
	   http://www.springframework.org/schema/beans
	   http://www.springframework.org/schema/beans/spring-beans-4.0.xsd">

	<!-- bean 등록 -->
	<bean id="tvProduct" class="aop.exam02.TvProduct"></bean>
	<bean id="phoneProduct" class="aop.exam02.PhoneProduct"></bean>
	<bean id="radioProduct" class="aop.exam02.RadioProduct"></bean>
	<bean id="advice" class="aop.exam02.AdviceProduct"></bean>

	<!-- spring aop -->
	<bean id="proxy"
		class="org.springframework.aop.framework.ProxyFactoryBean">
		<property name="target" ref="tvProduct"></property>
		<property name="interceptorNames">
			<list>
				<value>advisor</value>
			</list>
		</property>
	</bean>

	<bean id="advisor"
		class="org.springframework.aop.support.DefaultPointcutAdvisor">
		<property name="advice" ref="advice"></property>
		<property name="pointcut">
			<bean
				class="org.springframework.aop.support.JdkRegexpMethodPointcut">
				<property name="patterns">
					<list>
					<!-- 정규식 패턴으로 pointcut을 만듦 -->
						<value>.*select.*</value>
						<value>.*insert.*</value>
						<value>.*update.*</value>
						<value>.*delete.*</value>
					</list>
				</property>
			</bean>
		</property>

	</bean>

</beans>
```