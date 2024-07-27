<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 데이터베이스 탐색 (Connector) --%>
<%@ page import="java.sql.DriverManager" %>
<%-- 데이터베이스 통신 연결 --%>
<%@ page import="java.sql.Connection" %>
<%-- SQL 생성 및 전송 라이브러리 --%>
<%@ page import="java.sql.PreparedStatement" %>

<%@ page import="java.sql.ResultSet" %>

<%  

    request.setCharacterEncoding("utf-8");
    Class.forName("org.mariadb.jdbc.Driver");

    // DB 통신 연결
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mySchedulePage","stageus","1234");

    // 게시글 전체 정보 받아오기 sql
    // String sql = "SELECT * FROM userArticle NATURAL JOIN userInformation ORDER BY articleIdx DESC";
    // PreparedStatement query = connect.prepareStatement(sql);

    // ResultSet result = query.executeQuery();

    session = request.getSession();

    String gradeIdx = (String) session.getAttribute("gradeIdx");


%>
<!DOCTYPE html>
<html lang="kr">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스케줄 페이지</title>
    <link rel="stylesheet" type="text/css" href="Css/SchedulePage.css">

</head>

<body>
    <input value="<%=gradeIdx%>" type="hidden" id="Schedule_GetGrade_Input">

    <div id="Schedule_Scheduler_Container">


    <%-- 월 선택 영역 --%>

        <div id="Schedule_SelectMonth_Container">

            <button id="Schedule_SelectMonthClose_Btn">x</button>

            <table id="Schedule_SelectMonthContainer_Table">

                <tr>
                    <th colspan="6">
                        
                    </th>
                </tr>
                
                <tr>
                    <th colspan="6">
                        <button id="Schdule_SelectYear_Btn"></button>
                    </th>
                </tr>

                <tr>
                    <th><button>1</button></th>
                    <th><button>2</button></th>
                    <th><button>3</button></th>
                    <th><button>4</button></th>
                    <th><button>5</button></th>
                    <th><button>6</button></th>                 
                </tr>

                <tr>
                    <th><button>7</button></th>
                    <th><button>8</button></th>
                    <th><button>9</button></th>
                    <th><button>10</button></th>
                    <th><button>11</button></th>
                    <th><button>12</button></th>                 
                </tr>


            </table>

        </div>

        <%-- 년 선택 영역 --%>

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