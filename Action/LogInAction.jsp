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

<%@ page import="java.time.LocalDate" %>


    <html lang="kr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>

<%

    String idValue = request.getParameter("id");
    String pwValue = request.getParameter("pw");

    String regIdPwValue = "^.{1,20}$";

    boolean regId  = Pattern.matches(regIdPwValue, idValue);
    boolean regPw  = Pattern.matches(regIdPwValue, pwValue);

    if (!regId || !regPw) {

%>
        <title>로그인 실패</title>
        <script>
            alert("로그인 실패")
            history.back(); // 로그인 성공 후 이동할 페이지 지정
        </script>

<% 
    } else {

    Class.forName("org.mariadb.jdbc.Driver");

    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mySchedulePage","stageus","1234");

    LocalDate today = LocalDate.now();
    int year = today.getYear(); 
    int month = today.getMonthValue(); 

    //SQL 준비
    String checkIdSql = "SELECT memberPw, memberName, memberIdx, gradeIdx FROM Member WHERE memberId = ?";

    PreparedStatement checkIdQuery = connect.prepareStatement(checkIdSql);
    checkIdQuery.setString(1, idValue);

     // SQL 전송

    ResultSet checkIdResult = checkIdQuery.executeQuery(); 
    
    if (checkIdResult.next()){
        String storedPw = checkIdResult.getString("memberPw");
        String memberName = checkIdResult.getString("memberName");
        String memberIdx = checkIdResult.getString("memberIdx");
        String gradeIdx = checkIdResult.getString("gradeIdx");

        if(pwValue.equals(storedPw)){
            session = request.getSession();
            session.setAttribute("memberName", memberName);
            session.setAttribute("memberIdx", memberIdx);
            session.setAttribute("gradeIdx", gradeIdx);
            session.setAttribute("loginSuccess", true);
%>
    <title>로그인 성공</title>
    <script>
        location.href = "../SchedulePage.jsp?year=" + <%=year%> + "&month=" + <%=month%> + "&grade=" + "1" // 로그인 성공 후 이동할 페이지 지정
    </script>

<%
        } else {
%>
    <title>로그인 실패</title>
    <script>
        alert("비밀번호가 일치하지 않습니다.")
        history.back(); // 로그인 성공 후 이동할 페이지 지정
    </script>

<% 
    } } else {
%>
    <title>로그인 실패</title>
    <script>
        alert("일치하는 계정정보가 존재하지 않습니다.")
        history.back(); // 로그인 성공 후 이동할 페이지 지정
    </script>
<%
    }}
%>

    </body>
    </html>

    