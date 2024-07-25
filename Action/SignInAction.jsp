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
    

<%

    request.setCharacterEncoding("utf-8");
    String nameValue = request.getParameter("name");
    String idValue = request.getParameter("id");
    String pwValue = request.getParameter("pw");
    String phoneNumberValue = request.getParameter("phonenumber");
    String gradeIdxValue = request.getParameter("gradeIdx");
    String teamIdxValue = request.getParameter("teamIdx");

    // 사용할 데이터베이스 설정
    if (nameValue == null || idValue == null || pwValue == null || phoneNumberValue == null || gradeIdxValue == null
            || nameValue.isEmpty() || idValue.isEmpty() || pwValue.isEmpty() || phoneNumberValue.isEmpty()
            || gradeIdxValue.isEmpty() ) {

%>
        <title>회원가입 실패</title>
        </head>
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

    //SQL 준비
    String checkIdSql = "SELECT memberId FROM Member WHERE memberId = ?";

    PreparedStatement checkIdQuery = connect.prepareStatement(checkIdSql);
    checkIdQuery.setString(1, idValue);

     // SQL 전송

    ResultSet checkIdResult = checkIdQuery.executeQuery();

        //SQL 준비
    String checkPhoneSql = "SELECT memberPhoneNumber FROM Member WHERE memberPhoneNumber = ?";

    PreparedStatement checkPhoneQuery = connect.prepareStatement(checkPhoneSql);
    checkPhoneQuery.setString(1, phoneNumberValue);

     // SQL 전송

    ResultSet result = checkPhoneQuery.executeQuery();

    if (checkIdResult.next() || result.next()){
%>

        <title>중복 아이디</title>
        </head>
        <script>
            alert("중복된 아이디 또는 전화번호 입니다.")
            history.back();
        </script>

<% } else {


    String sql = "INSERT INTO Member (memberName,memberId,memberPw,memberPhoneNumber,gradeIdx,teamIdx) VALUES (?, ?, ?, ?, ?, ?)";

    PreparedStatement query = connect.prepareStatement(sql);


    query.setString(1, nameValue);
    query.setString(2, idValue);
    query.setString(3, pwValue);
    query.setString(4, phoneNumberValue);
    query.setString(5, gradeIdxValue);
    query.setString(6, teamIdxValue);


    // SQL 전송

    query.executeUpdate();

%>

    <title>회원가입 성공</title>
    </head>
        <script>
            alert("회원 가입 성공.")
            location.href = "../LogIn.jsp"
        </script>

<%
}
%>
    </html>