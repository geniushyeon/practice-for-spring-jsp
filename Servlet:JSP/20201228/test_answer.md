1. 회원 조회 페이지(searchUser.jsp)
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>회원 정보 조회</h1>
    <form action="/searchUser">
        <input type="text" name="userNo" placeholder="회원번호입력">
        <input type="submit" value="조회">
    </form>
</body>
</html>
```
2. 회원 조회 서블릿(SearchUserServlet.java)
```java
package user.controller;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import user.model.dao.UserDao;
import user.model.vo.User;

/**
* Servlet implementation class SearchUserServlet
*/

@WebServlet(name = "SearchUser", urlPatterns = { "/searchUser" })
public class SearchUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**

    * @see HttpServlet#HttpServlet()
    */
    public SearchUserServlet() {
    super();
    // TODO Auto-generated constructor stub
    }

    /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        int userNo = Integer.parseInt(request.getParameter("userNo"));
        User user = new UserDao().selectUser(userNo);

        if(user == null) {
            request.getRequestDispatcher("/WEB-INF/view/searchFail.jsp").forward(request, response);
        }else {
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/searchSuccess.jsp");
            request.setAttribute("user", user);
            rd.forward(request, response);
        }
    }

    /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
        doGet(request, response);
    
    }
}
```
3. 회원 조회 성공 페이지(searchSuccess.jsp)
```jsp
<%@page import="user.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
    User user = (User)request.getAttribute("user");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
th,td{width:100px;}
</style>
</head>
<body>
<h2>회원정보</h2>
    <table border="1">
        <tr>
            <th>회원번호</th><th>회원아이디</th><th>회원이름</th><th>회원나이</th>
        </tr>
        <tr>
            <th><%=user.getUserNo() %></th>
            <th><%=user.getUserId() %></th>
            <th><%=user.getUserName() %></th>
            <th><%=user.getUserAge() %></th>
        </tr>
    </table>
</body>
</html>
```
4. 회원 조회 실패 페이지(searchFail.jsp)
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>조회 결과가 없습니다.</h1>
<a href="/">메인페이지로 돌아가기</a>
</body>
</html>
```