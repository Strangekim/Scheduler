<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%

    session.invalidate();

%>

<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그아웃 성공</title>
    <script>
        alert("로그아웃 완료");
        location.href = "../LogIn.jsp" 
    </script>
</head>
<body>
</body>
</html>