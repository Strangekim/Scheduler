<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%-- 데이터베이스 탐색 (Connector) --%>
<%@ page import="java.sql.DriverManager" %>
<%-- 데이터베이스 통신 연결 --%>
<%@ page import="java.sql.Connection" %>
<%-- SQL 생성 및 전송 라이브러리 --%>
<%@ page import="java.sql.PreparedStatement" %>

<%
    request.setCharacterEncoding("utf-8");
    String time = request.getParameter("time");
    String minute = request.getParameter("minute");
    String title = request.getParameter("title");


    // 작성자 idx 받아오기
    String memberIdx = (String) session.getAttribute("memberIdx");
    String gradeIdx = (String) session.getAttribute("gradeIdx");

    Class.forName("org.mariadb.jdbc.Driver");

    // DB 통신 연결
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mySchedulePage","stageus","1234");

    //SQL 준비
    // String sql = "INSERT INTO userArticle (userIdx, articleTitle, articleText) VALUES (?, ?, ?)";

    // PreparedStatement query = connect.prepareStatement(sql);

    // query.setString(1, userIdx);
    // query.setString(2, articleTitle);
    // query.setString(3, articleText);


    // // SQL 전송

    // query.executeUpdate();

    
%>

<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <script>
    alert("게시글 작성 완료")
    location.href="../Board.jsp"

    </script>
</body>
</html>