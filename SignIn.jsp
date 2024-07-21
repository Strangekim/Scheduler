<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html lang="kr">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 페이지</title>
    <link rel="stylesheet" type="text/css" href="Css/SignIn.css">

</head>

<body>
    <main id="Index_Main_Container">

        <div id="Index_Sub_Container">

            <div id="Index_InputBox_Container">

                <input type="text" placeholder="이름" maxlength="8" id="Index_Input_Name">
                <input type="text" placeholder="아이디" maxlength="20" id="Index_Input_Id">
                <input type="password" placeholder="비밀번호" maxlength="20" id="Index_Input_Pw">
                <input type="password" placeholder="비밀번호 확인" maxlength="20" id="Index_Input_Pwcheck">
                <input type="text" placeholder="전화번호" maxlength="12" id="Index_Input_Phonenumber">
                
                <div id="Index_RadioButtonBox_container">
                    <div class="Index_RadioButton_Container">
                        <input type="radio" name="position" id="Index_Member_Btn" checked><label for="Index_Member_Btn">팀원</lable>
                    </div>
                    <div class="Index_RadioButton_Container">
                        <input type="radio" name="position" id="Index_Leader_Btn"><label for="Index_Leader_Btn">팀장</lable>
                    </div> 
                </div>

            </div>

            <div id="Index_InButtonBox_Container">

                    <input type="button" id="Index_Button_SignIn" value="회원가입">

            </div>        



        </div>
          
    </main>

    <script src="Js/SignIn.js"></script>
    <script src="Js/Header.js"></script>
</body>
</html>