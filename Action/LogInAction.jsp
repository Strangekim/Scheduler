<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%-- 데이터베이스 탐색 (Connector) --%>
<%@ page import="java.sql.DriverManager" %>
<%-- 데이터베이스 통신 연결 --%>
<%@ page import="java.sql.Connection" %>
<%-- SQL 생성 및 전송 라이브러리 --%>
<%@ page import="java.sql.PreparedStatement" %>

<%@ page import="java.sql.ResultSet" %>


    <html lang="kr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>로그인 성공</title>
        <script>
            alert("로그인 성공")
            location.href = "../SchedulePage.jsp" // 로그인 성공 후 이동할 페이지 지정
        </script>
    </head>
    <body>
    </body>
    </html>