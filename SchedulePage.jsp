<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html lang="kr">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스케줄 페이지</title>
    <link rel="stylesheet" type="text/css" href="Css/SchedulePage.css">

</head>

<body>

    <header></header>

    <div id="Schedule_Scheduler_Container">

        <table border="1" id="Schedule_MainSchedule_Table">

            <tr>
                <th colspan="7">
                    <button>&lt;</button>
                    <button id="Schedule_ViewNow_Button"></button>
                    <button>&gt;</button>
                </th>
            </tr>

            <tr>
                <th>일</th>
                <th>월</th>
                <th>화</th>
                <th>수</th>
                <th>목</th>
                <th>금</th>
                <th>토</th>
            </tr>

        </table>
    </div>

    <script src="Js/SchedulePage.js"></script>
    <script src="Js/Header.js"></script>

</body>
</html>