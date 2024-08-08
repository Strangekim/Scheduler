<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%-- 데이터베이스 탐색 (Connector) --%>
<%@ page import="java.sql.DriverManager" %>
<%-- 데이터베이스 통신 연결 --%>
<%@ page import="java.sql.Connection" %>
<%-- SQL 생성 및 전송 라이브러리 --%>
<%@ page import="java.sql.PreparedStatement" %>

<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.*"%>
<%@ page import="java.util.regex.*"%>

<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스케줄 작성</title>
</head>
<body>

<%
    String memberIdx = (String) session.getAttribute("memberIdx");

    String scheduleDatetime = request.getParameter("scheduleDatetime");
    String title = request.getParameter("title");

    String regMemberIdx = "^[0-9]*$";
    String regScheduleDateTimeValue = "\\d{4}-(1[0-2]|[1-9])-(3[01]|2[0-9]|1[0-9]|0[1-9]|[1-9]) ([0-9]|1[0-9]|2[0-4]):([0-9]|[0-5][0-9]):(0[1-9]|[0-5][0-9])";
    String regTitleValue = "^.{1,10}$";

    boolean regMember = Pattern.matches(regMemberIdx, memberIdx);
    boolean regScheduleDateTime = Pattern.matches(regScheduleDateTimeValue, scheduleDatetime);
    boolean regTitle = Pattern.matches(regTitleValue, title);

    if (!regMember || !regTitle || !regScheduleDateTime) {
%>

    <script>
    alert("스케줄 작성 실패")
    history.back()
    </script>

<% 
    } else if (memberIdx == null || memberIdx.isEmpty()) {
%>

    <script>
    alert("로그인 후 작성해주세요.")
    location.href="../LogIn.jsp"
    </script>

<% } else {

    Class.forName("org.mariadb.jdbc.Driver");

    // DB 통신 연결
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mySchedulePage","stageus","1234");

    //SQL 준비
    String sql = "INSERT INTO Schedule (ScheduleDateTime, ScheduleTitle, memberIdx) VALUES (?, ?, ?)";

    PreparedStatement query = connect.prepareStatement(sql);

    query.setString(1, scheduleDatetime);
    query.setString(2, title);
    query.setString(3, memberIdx);


    // SQL 전송

    query.executeUpdate();
%>
    <script>
    alert("스케줄 작성 완료")
    var referrer = document.referrer;
    location.href = referrer;
    </script>

<%
    }
%>
</body>
</html>