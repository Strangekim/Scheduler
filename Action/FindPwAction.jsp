<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%-- 데이터베이스 탐색 (Connector) --%>
<%@ page import="java.sql.DriverManager" %>
<%-- 데이터베이스 통신 연결 --%>
<%@ page import="java.sql.Connection" %>
<%-- SQL 생성 및 전송 라이브러리 --%>
<%@ page import="java.sql.PreparedStatement" %>

<%@ page import="java.sql.ResultSet" %>

<%

    request.setCharacterEncoding("utf-8");
    String idValue = request.getParameter("id");
    String phoneNumberValue = request.getParameter("phonenumber");

%>
    <html lang="kr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

<%
    // 사용할 데이터베이스 설정
    if (idValue == null || phoneNumberValue == null 
            || idValue.isEmpty() || phoneNumberValue.isEmpty()) {
%>

        <title>아이디 찾기 실패</title>
        </head>
        <script>
            alert("값이 비어있습니다")
            history.back();
        </script>

<%
    }
    // 사용할 데이터베이스 설정
    Class.forName("org.mariadb.jdbc.Driver");

    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mySchedulePage","stageus","1234");

    //SQL 준비
    String checkIdSql = "SELECT memberPw FROM Member WHERE memberId = ? AND memberPhoneNumber = ?";

    PreparedStatement checkIdQuery = connect.prepareStatement(checkIdSql);
    checkIdQuery.setString(1, idValue);
    checkIdQuery.setString(2, phoneNumberValue);
     // SQL 전송

    ResultSet checkIdResult = checkIdQuery.executeQuery(); 

    if(checkIdResult.next()){
    String memberPw = checkIdResult.getString("memberPw");
%>

<title>아이디 찾기 성공</title>
</head>
<script>
    alert("비밀번호는 <%=memberPw%> 입니다.")
    location.href = "../LogIn.jsp" 
</script>

<%
    } else {
%>

    <title>아이디 찾기 성공</title>
    </head>
    <script>
    alert("일치하는 아이디, 전화번호가 존재하지 않습니다.")
    history.back(); 
    </script>
<%        
    }
%>

</html>