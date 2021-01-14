# 모범답안

1. Kh.java
```java
package kh.model.vo;

public class Kh {
    private int khNo;
    private String khName;
    private String addr;
    private String fax;

    public Kh() {
        super();
    }

    public Kh(int khNo, String khName, String addr, String fax) {
        super();
        this.khNo = khNo;
        this.khName = khName;
        this.addr = addr;
        this.fax = fax;
    }

    public int getKhNo() {
        return khNo;
    }

    public void setKhNo(int khNo) {
        this.khNo = khNo;
    }

    public String getKhName() {
        return khName;
    }

    public void setKhName(String khName) {
        this.khName = khName;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

}
```
2. 학원조회 페이지
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>학원 조회 페이지</title>
        <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
        <script>
        $(function(){
            $("#btn").click(function(){
                var khName = $("#khName").val();
                    $.ajax({
                        url : "/searchKH",
                        data : {khName:khName},
                        type : "get",
                        dataType : "json",
                        success : function(data){
                        $("#result").empty();
                        var html = "";
                        if(data != null){
                            html += "<ul>";
                            html += "<li>"+data.khName+"</li>";
                            html += "<li>"+data.addr+"</li>";
                            html += "<li>"+data.fax+"</li>";
                            html += "</ul>";
                            $("#result").append(html);
                        }else{
                            html += "<ul>";
                            html += "<li>정보가 없습니다.</li>";
                            html += "</ul>";
                            $("#result").append(html);
                        }
                    }
                });
            });
        });
        </script>
    </head>
    <body>
        <h2>학원 정보 조회하기</h2>
        <hr>
        <input type="text" id="khName">
        <button id="btn">조회하기</button>
        <div id="result"></div>
    </body>
    </html>
```
3. 학원 조회 서블릿
```java
package kh.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import kh.model.dao.Dao;
import kh.model.vo.Kh;

/**
* Servlet implementation class SearchKHServlet
*/

@WebServlet(name = "SearchKH", urlPatterns = { "/searchKH" })

public class SearchKHServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
    * @see HttpServlet#HttpServlet()
    */

    public SearchKHServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        String khName = request.getParameter("khName");
        Kh kh = new Dao().selectOneKh(khName);

        response.setCharacterEncoding("utf-8");
        new Gson().toJson(kh,response.getWriter());

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