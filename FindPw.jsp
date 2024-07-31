<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html lang="kr">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" type="text/css" href="Css/FindPw.css">

</head>

<body>
    <main id="Index_Main_Container">

        <div id="Index_Sub_Container">

            <div id="Index_InputBox_Container">

                <input type="text" placeholder="아이디" id="Index_Input_Id">
                <input type="text" placeholder="전화번호" id="Index_Input_PhoneNumber"> 

            </div>

            <div id="Index_InButtonBox_Container">

                    <input onclick="findPwEvent()" type="button" id="Index_Button_FindId" value="비밀번호 찾기">

            </div>        

        </div>
          
    </main>

    <script src="Js/CommonVar.js"></script>
    <script src="Js/Header.js"></script>
    <script src="Js/FindPw.js"></script>
</body>
</html>