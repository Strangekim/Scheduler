<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html lang="kr">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
    <link rel="stylesheet" type="text/css" href="Css/FindId.css">

</head>

<body>
    <main id="Index_Main_Container">

        <div id="Index_Sub_Container">

            <div id="Index_InputBox_Container">

                <input type="text" placeholder="이름" id="Index_Input_Name">
                <input type="text" placeholder="전화번호" id="Index_Input_PhoneNumber"> 

            </div>

            <div id="Index_InButtonBox_Container">

                    <input type="button" id="Index_Button_FindId" value="ID 찾기">

            </div>        

        </div>
          
    </main>

    <script src="Js/FindId.js"></script>
    <script src="Js/Header.js"></script>
</body>
</html>