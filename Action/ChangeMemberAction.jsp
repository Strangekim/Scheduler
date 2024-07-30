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
    <title>회원정보변경</title>

    </head>
<%

    request.setCharacterEncoding("utf-8");
    String idValue = request.getParameter("id");
    String pwValue = request.getParameter("pw");
    String phoneNumberValue = request.getParameter("phonenumber");
    String gradeIdxValue = request.getParameter("gradeIdx");
    String teamIdxValue = request.getParameter("teamIdx");

    // 사용할 데이터베이스 설정
    if (idValue == null || pwValue == null || phoneNumberValue == null || gradeIdxValue == null
            || idValue.isEmpty() || pwValue.isEmpty() || phoneNumberValue.isEmpty()
            || gradeIdxValue.isEmpty() ) {

%>
        <script>
            alert("값이 비어있습니다")
            history.back();
        </script>

<%
    } 

    // 사용할 데이터베이스 설정
    Class.forName("org.mariadb.jdbc.Driver");

    // DB 통신 연결
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mySchedulePage","stageus","1234");

    session = request.getSession();

    String memberIdx = (String) session.getAttribute("memberIdx");

    //SQL 준비
    String checkIdSql = "SELECT memberId FROM Member WHERE memberId = ?";
    PreparedStatement checkIdQuery = connect.prepareStatement(checkIdSql);

    checkIdQuery.setString(1, idValue);


    String checkPhoneSql = "SELECT memberId FROM Member WHERE memberId = ?";
    PreparedStatement checkPhoneQuery = connect.prepareStatement(checkPhoneSql);

    checkPhoneQuery.setString(1, phoneNumberValue);


     // SQL 전송

    ResultSet checkIdResult = checkIdQuery.executeQuery();
    ResultSet checkPhoneResult = checkPhoneQuery.executeQuery();

    if (checkIdResult.next()) {
%>
        <script>
            alert("중복된 아이디 입니다.")
            history.back();
        </script>
<%
    } else if (checkPhoneResult.next()) {
%>
        <script>
            alert("중복된 전화번호 입니다.")
            history.back();
        </script>
<%    

    } else {

    //SQL 준비
    String sql = "UPDATE Member SET memberId = ?, memberPw = ?, memberPhoneNumber = ?, gradeIdx = ? WHERE memberIdx = ?";

    PreparedStatement changeMemberQuery = connect.prepareStatement(sql);

    changeMemberQuery.setString(1, idValue);
    changeMemberQuery.setString(2, pwValue);
    changeMemberQuery.setString(3, phoneNumberValue);
    changeMemberQuery.setString(4, gradeIdxValue);
    changeMemberQuery.setString(5, memberIdx);

     // SQL 전송

    changeMemberQuery.executeUpdate();

    session.invalidate();
%>
        <script>
            alert("정보 변경 성공.")
            location.href = "../LogIn.jsp"
        </script>

<%
    }
%>
    </html>