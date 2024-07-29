<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%-- 데이터베이스 탐색 (Connector) --%>
<%@ page import="java.sql.DriverManager" %>
<%-- 데이터베이스 통신 연결 --%>
<%@ page import="java.sql.Connection" %>
<%-- SQL 생성 및 전송 라이브러리 --%>
<%@ page import="java.sql.PreparedStatement" %>

<%
    request.setCharacterEncoding("utf-8");
    String scheduleIdx = request.getParameter("scheduleIdx");

    // 작성자 idx 받아오기
    String memberIdx = (String) session.getAttribute("memberIdx");
    // String teamIdx = (String) session.getAttribute("teamIdx");
%>

<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스케줄 삭제</title>
</head>
<body>

<% 
    if (scheduleIdx == null || scheduleIdx.isEmpty()) {
%>

    <script>
    alert("스케줄 삭제 실패")
    history.back()
    </script>

<% } else {

    Class.forName("org.mariadb.jdbc.Driver");

    // DB 통신 연결
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mySchedulePage","stageus","1234");

    //SQL 준비
    String sql = "DELETE FROM Schedule WHERE ScheduleIdx = ?";

    PreparedStatement query = connect.prepareStatement(sql);

    query.setString(1, scheduleIdx);

    // SQL 전송

    query.executeUpdate();
    
%>

    <script>
    alert("스케줄 삭제 완료")
    var referrer = document.referrer;
    location.href = referrer;
    </script>

<%
    }
%>
</body>
</html>