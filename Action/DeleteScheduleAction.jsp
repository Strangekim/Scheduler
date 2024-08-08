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
    <title>스케줄 삭제</title>
</head>


<%
    String memberIdx = (String) session.getAttribute("memberIdx");

    String scheduleIdx = request.getParameter("scheduleIdx");
    String regScheduleIdxValue = "^[0-9]*$";

    boolean regScheduleIdx = Pattern.matches(regScheduleIdxValue, scheduleIdx);
    boolean regMemberIdx = Pattern.matches(regScheduleIdxValue, memberIdx);

    if(!regScheduleIdx || !regMemberIdx) {    
%>
    <script>
    alert("스케줄 삭제 실패")
    history.back()
    </script>

<% 
    } else if (scheduleIdx == null || scheduleIdx.isEmpty()) {
%>

    <script>
    alert("스케줄 삭제 실패")
    history.back()
    </script>

<% } 
    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mySchedulePage","stageus","1234");
    String checkMember = "SELECT * FROM Schedule WHERE memberIdx = ? AND ScheduleIdx = ?";
    PreparedStatement checkMemberQuery = connect.prepareStatement(checkMember);

    checkMemberQuery.setString(1, memberIdx);
    checkMemberQuery.setString(2, scheduleIdx);

    ResultSet checkMemberResult = checkMemberQuery.executeQuery(); 

    if(checkMemberResult.next()) {
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
    } else {
%>
    <title>스케줄 삭제 실패</title>
    <script>
        alert("본인의 스케줄이 아닙니다.")
        history.back(); 
    </script>
<%
    }
%>

</html>