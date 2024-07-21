<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html lang="kr">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 페이지</title>
    <link rel="stylesheet" type="text/css" href="Css/LogIn.css">

</head>

<body>

    <%-- <header id="Main_Header"></header> --%>

    <main id="Index_Main_Container">

        <div id="Index_Sub_Container">

            <div id="Index_InputBox_Container">

                <input type="text" placeholder="아이디" id="Index_Input_Id">
                <input type="password" placeholder="비밀번호" id="Index_Input_Pw"> 

            </div>

            <div id="Index_InButtonBox_Container">

                    <input type="button" id="Index_Button_LogIn" value="로그인">
                    <a href="SignIn.jsp"><button id="Index_Button_SigIn">회원 가입</button></a>
            </div>        

            <div id="Index_FindButtonBox_Container">

                <a href="FindId.jsp"><button id="Index_Button_FineId">아이디 찾기</button></a>
                <a href="FindPw.jsp"><button id="Index_Button_FindPw">비밀번호 찾기</button></a>

            </div>

        </div>
          
    </main>

    <script src="Js/LogIn.js"></script>
    <script src="Js/Header.js"></script>
</body>
</html>