<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 데이터베이스 탐색 (Connector) --%>
<%@ page import="java.sql.DriverManager" %>
<%-- 데이터베이스 통신 연결 --%>
<%@ page import="java.sql.Connection" %>
<%-- SQL 생성 및 전송 라이브러리 --%>
<%@ page import="java.sql.PreparedStatement" %>

<%@ page import="java.sql.ResultSet" %>

<%@ page import="java.time.LocalDate" %>

<%@ page import="java.util.Calendar"%>
<%  
    request.setCharacterEncoding("utf-8");

    String gradeIdx = (String) session.getAttribute("gradeIdx");
    String memberIdx = (String) session.getAttribute("memberIdx");

    String year = request.getParameter("year");
    String month = request.getParameter("month");
    String date = request.getParameter("date");


    Class.forName("org.mariadb.jdbc.Driver");

    // DB 통신 연결
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mySchedulePage","stageus","1234");

    // 게시글 전체 정보 받아오기 sql
    // String sql = "SELECT * FROM Schedule WHERE YEAR(ScheduleDateTime) = ? AND MONTH(ScheduleDateTime) = ? AND memberIdx = ?";
    // PreparedStatement query = connect.prepareStatement(sql);
    
    // query.setString(1, sy);
    // query.setString(2, sm);
    // query.setString(3, memberIdx);

    // ResultSet result = query.executeQuery();

    // session = request.getSession();


%>

<!DOCTYPE html>
<html lang="kr">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일일 페이지</title>
    <link rel="stylesheet" type="text/css" href="Css/DatePage.css">

</head>

<body>
    <input value="<%=gradeIdx%>" type="hidden" id="Schedule_GetGrade_Input">


    <div id="DatePage_Main_Container">
        <div id="DatePage_Main_MenuContainer">
            <div>
                <button id="DatePage_Today_Btn">오늘</button>
            </div>

            <div>
                <button>&lt;</button>

                <button id="DatePage_DateSelect_Btn">
                    <div id="DatePage_DateView_Container">
                        <p id="DatePage_DateViewYear_P"><%=year%></p>
                        <p id="DatePage_DateViewDate_P"><%=month%>월<%=date%>일</p>
                    </div>
                </button>
                
                <button>&gt;</button>
            </div>

            <div>
                <button id="DatePage_Write_Btn">글쓰기</button>
            </div>
        </div>





        <div id="DatePage_SelectDay_Container">
            <div id="DatePage_CloseSelectDay_Container">
                <button id="DatePage_CloseSelectDay_Btn">X</button>
            </div>
            <table border="1" id="Schedule_MainSchedule_Table">

            </table> 
        </div>


        <div id="DatePage_Schedule_Container">
            <div>
                <p>07:00</p>
                <p>아침운동</p>
                <p>
                    <button>수정</button>
                    <button>삭제</button>
                </p>
            </div>
        </div>

                <div id="DatePage_Schedule_Container">
            <div>
                <p>07:00</p>
                <p>아침운동</p>
                <p>
                    <button>수정</button>
                    <button>삭제</button>
                </p>
            </div>
        </div>

                <div id="DatePage_Schedule_Container">
            <div>
                <p>07:00</p>
                <p>아침운동</p>
                <p>
                    <button>수정</button>
                    <button>삭제</button>
                </p>
            </div>
        </div>

        <div id="DatePage_Schedule_Container">
            <div>
                <p>07:00</p>
                <p>아침운동</p>
                <p>
                    <button>수정</button>
                    <button>삭제</button>
                </p>
            </div>
        </div>

        <div id="DatePage_CreateSchedule_Container">

            <table id="DatePage_CreateSchedule_Table">

                <tr>
                    <td>
                        <p>일 시</p>
                    </td>

                    <td>
                        <select id="DatePage_ScheduleTime_Select">

                        </select>
                    </td>

                    <td>
                        <select id="DatePage_ScheduleMinutes_Select">

                        </select>
                    </td>

                    <td>
                    <button id="DataPage_CloseTable_Btn">X</button>
                    </td>

                </tr>

                <%-- 글쓰기 영역 --%>

                <tr>
                    <td>
                        <p>제 목</p>
                    </td>

                    <td colspan="2">
                        <input type="text" maxlength="10" id="DatePage_ScheduleTitle_Input">
                    </td>

                    <td>
                        
                    </td>
                </tr>

                <tr>
                    <td>

                    </td>

                    <td colspan="2">

                    </td>

                    <td>
                        <button id="DatePage_ScheduleCommit_Btn" onclick="createScheduleEvent()">작성</button>
                    </td>
                </tr>
                
            </table>
        </div>

    </div>

    <script src="Js/DatePage.js"></script>
    <script src="Js/Header.js"></script>
</body>
</html>