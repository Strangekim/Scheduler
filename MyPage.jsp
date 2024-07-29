<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%-- 데이터베이스 탐색 (Connector) --%>
<%@ page import="java.sql.DriverManager" %>
<%-- 데이터베이스 통신 연결 --%>
<%@ page import="java.sql.Connection" %>
<%-- SQL 생성 및 전송 라이브러리 --%>
<%@ page import="java.sql.PreparedStatement" %>

<%@ page import="java.sql.ResultSet" %>

<%@ page import="java.time.LocalDate" %>

<%
    Class.forName("org.mariadb.jdbc.Driver");

    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mySchedulePage","stageus","1234");

    session = request.getSession();

    String memberIdx = (String) session.getAttribute("memberIdx");

    //SQL 준비
    String sql = "SELECT memberName, memberPhoneNumber, gradeIdx FROM Member WHERE memberIdx = ?";

    PreparedStatement query = connect.prepareStatement(sql);
    
    query.setString(1, memberIdx);

    ResultSet result = query.executeQuery();

%>

<!DOCTYPE html>
<html lang="kr">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이 페이지</title>
    <link rel="stylesheet" type="text/css" href="Css/MyPage.css">

</head>

<%-- <%
    if (!result.next()) {
%>
    <body>
        <script>
        alert("잘못된 접근입니다.")
        location.href="LogIn.jsp"
        </script>
    </body>
</html>

<%
   } else {  --%>

<%
    while (result.next()) {
        String memberName = result.getString("memberName");
        String memberPhoneNumber = result.getString("memberPhoneNumber");
        String gradeIdx = result.getString("gradeIdx");
    
%>

<body>
    <main id="Index_Main_Container">

        <div id="Index_Sub_Container">

            <div id="Index_InputBox_Container">

                <input type="text" placeholder="아이디" maxlength="20" id="Index_Input_Id" value="<%=memberName%>">
                <input type="text" placeholder="전화번호" maxlength="12" id="Index_Input_Phonenumber" value="<%=memberPhoneNumber%>">
                <input type="password" placeholder="비밀번호" maxlength="20" id="Index_Input_Pw">
                <input type="password" placeholder="비밀번호 확인" maxlength="20" id="Index_Input_Pwcheck">

<%
    if (Integer.parseInt(gradeIdx) == 1) {
%>
                <div id="Index_RadioButtonBox_container">
                    <div class="Index_RadioButton_Container">
                        <input type="radio" name="position" id="Index_Member_Btn" checked><label for="Index_Member_Btn">팀원</lable>
                    </div>
                    <div class="Index_RadioButton_Container">
                        <input type="radio" name="position" id="Index_Leader_Btn"><label for="Index_Leader_Btn">팀장</lable>
                    </div> 
                </div>
<% 
    } else if (Integer.parseInt(gradeIdx) == 2) {
%>
                <div id="Index_RadioButtonBox_container">
                    <div class="Index_RadioButton_Container">
                        <input type="radio" name="position" id="Index_Member_Btn"><label for="Index_Member_Btn">팀원</lable>
                    </div>
                    <div class="Index_RadioButton_Container">
                        <input type="radio" name="position" id="Index_Leader_Btn" checked><label for="Index_Leader_Btn">팀장</lable>
                    </div> 
                </div>
<%
    }
%>

            </div>

            <div id="Index_InButtonBox_Container">

                    <input type="button" id="Index_Button_SignIn" value="정보수정">
                    <input type="button" id="Index_Button_SignIn" value="회원탈퇴">

            </div>        

        </div>
          
    </main>

    <script src="Js/MyPage.js"></script>
    <script src="Js/Header.js"></script>
</body>
</html>

<%
    }
%>