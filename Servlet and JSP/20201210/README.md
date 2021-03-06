# JSP (Java Server Page)
# 1. 특징
- 웹페이지를 쉽게 개발, 유지
  - Java 기반의 기술.
- 일반적인 확장자는 `jsp`
- J2EE 규약의 일부(웹 규약)
- JVM을 사용

# 2. 구조
## 2.1. Directive(지시자, 지시문)
```jsp
<%@ ... %>
```
## 2.2. Scripting element
## 2.2.1. 선언문
- 전역형 멤버: 필드, 메소드
```jsp
<%! ... %>
```
### 2.2.2. 스크립틀릿(지역형)
```jsp
<% ... %>
```
### 2.2.3. 표현식(출력문)
```jsp
<%= ... %>
```
## 2.3. 주석
```html
<!-- html 타입-->
```
```jsp
<%-- jsp 타입 --%>
```
```java
//java 타입
/* java 타입 */
```

## 2.4. Action(Action Tag)
```jsp
<jsp: ... />
```
# 3. 외부 페이지 삽입
## 3.1. 동적 삽입
```jsp
<jsp: include page='F'/>
```
- 해당 위치에 `실행 결과`가 복사된다.
- page 속성에 파일명이나 변수를 사용할 수 있다.

## 3.2. 정적 삽입
```jsp
<%@ include file='F'%>
```
- 해당 위치에 `소스가 그대로` 복사된다.
- 파일명, 변수 사용 불가능