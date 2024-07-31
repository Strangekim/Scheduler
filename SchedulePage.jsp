<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- 데이터베이스 탐색 (Connector) --%>
<%@ page import="java.sql.DriverManager" %>
<%-- 데이터베이스 통신 연결 --%>
<%@ page import="java.sql.Connection" %>
<%-- SQL 생성 및 전송 라이브러리 --%>
<%@ page import="java.sql.PreparedStatement" %>

<%@ page import="java.sql.ResultSet" %>

<%@ page import="java.time.LocalDate" %>

<%@ page import="java.util.*"%>

<%@ page import="java.sql.Timestamp"%>


<%  
    request.setCharacterEncoding("utf-8");

    Calendar cal = Calendar.getInstance();

    // 오늘 날짜
    int ty = cal.get(Calendar.YEAR);
    int tm = cal.get(Calendar.MONTH)+1;  
    int td = cal.get(Calendar.DATE);

    int year = cal.get(Calendar.YEAR);
    int month = cal.get(Calendar.MONTH)+1;      

    String sy = request.getParameter("year");
    String sm = request.getParameter("month");

    if(sy != null){
        year = Integer.parseInt(sy);
    }
    if(sm != null){
        month = Integer.parseInt(sm);
    }

    cal.set(year, month-1, 1);
    year = cal.get(Calendar.YEAR);
    month = cal.get(Calendar.MONTH)+1;

    int week = cal.get(Calendar.DAY_OF_WEEK);

    Class.forName("org.mariadb.jdbc.Driver");

    // DB 통신 연결
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mySchedulePage","stageus","1234");

    String gradeIdx = (String) session.getAttribute("gradeIdx");
    String memberIdx = (String) session.getAttribute("memberIdx");

    String grade = request.getParameter("grade");
%>

<!DOCTYPE html>
<html lang="kr">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스케줄 페이지</title>
    <link rel="stylesheet" type="text/css" href="Css/SchedulePage.css">

</head>

<%
    if(memberIdx == null || memberIdx.isEmpty()){
%>
    <script>
    alert("잘못된 접근입니다.")
    location.href="LogIn.jsp"
    </script>
<% 
    } 
%>

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
                    <th><button onclick="changeMonthEvent(1)">1</button></th>
                    <th><button onclick="changeMonthEvent(2)">2</button></th>
                    <th><button onclick="changeMonthEvent(3)">3</button></th>
                    <th><button onclick="changeMonthEvent(4)">4</button></th>
                    <th><button onclick="changeMonthEvent(5)">5</button></th>
                    <th><button onclick="changeMonthEvent(6)">6</button></th>                 
                </tr>

                <tr>
                    <th><button onclick="changeMonthEvent(7)">7</button></th>
                    <th><button onclick="changeMonthEvent(8)">8</button></th>
                    <th><button onclick="changeMonthEvent(9)">9</button></th>
                    <th><button onclick="changeMonthEvent(10)">10</button></th>
                    <th><button onclick="changeMonthEvent(11)">11</button></th>
                    <th><button onclick="changeMonthEvent(12)">12</button></th>                 
                </tr>


            </table>

        </div>

        <%-- 년 선택 영역 --%>

        <table border="1" id="Schedule_MainSchedule_Table">

            <tr>
                <th colspan="7">
                    <button onclick="decreaseMonthEvent()">&lt;</button>
                    <button id="Schedule_ViewNow_Button"><%=sy%>.<%=sm%></button>
                    <button onclick="increaseMonthEvent()">&gt;</button>
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

<%
    if(grade == null) {

    // 게시글 전체 정보 받아오기 sql
    String sql = "SELECT * FROM Schedule WHERE YEAR(ScheduleDateTime) = ? AND MONTH(ScheduleDateTime) = ? AND memberIdx = ? ORDER BY ScheduleDateTime ASC";
    PreparedStatement query = connect.prepareStatement(sql);
    
    query.setString(1, sy);
    query.setString(2, sm);
    query.setString(3, memberIdx);

    ResultSet result = query.executeQuery();

    session = request.getSession();

    // 스케줄 데이터 처리
    Map<Integer, Integer> scheduleCounts = new HashMap<>(); // 날짜별 스케줄 개수 저장

    while (result.next()) {
        // String ScheduleDateTime = result.getString("ScheduleDateTime");
        Timestamp timestamp = result.getTimestamp("ScheduleDateTime");
        LocalDate scheduleDate = timestamp.toLocalDateTime().toLocalDate();
        int day = scheduleDate.getDayOfMonth();

        // 스케줄 개수 카운트
        scheduleCounts.put(day, scheduleCounts.getOrDefault(day, 0) + 1);
    }

    // 달력 출력
    // 1일 앞 달
    Calendar preCal = (Calendar) cal.clone();
    preCal.add(Calendar.DATE, -(week - 1));
    int preDate = preCal.get(Calendar.DATE);

    out.print("<tr>");
    // 1일 앞 부분
    for (int i = 1; i < week; i++) {
        //out.print("<td>&nbsp;</td>");
        out.print("<td class='gray'>" + (preDate++) + "</td>");
    }

    // 1일부터 말일까지 출력
    int lastDay = cal.getActualMaximum(Calendar.DATE);
    String cls;

    for (int i = 1; i <= lastDay; i++) {
        cls = year == ty && month == tm && i == td ? "today" : "";

        // 해당 날짜의 스케줄 개수 가져오기
        int scheduleCount = scheduleCounts.getOrDefault(i, 0);

        out.print("<td class='thisMonth' data-day='" + i + "'>");
        out.print("<span class='Schedule_ScheduleDate_Span'>" + i + "</span>");
        out.print("<div class='Schedule_ScheduleDate_Td'>" + scheduleCount + "</div>");
        out.print("</td>");

        if (lastDay != i && (++week) % 7 == 1) {
            out.print("</tr><tr>");
        }
    }

    // 마지막 주 마지막 일자 다음 처리
    int n = 1;
    for (int i = (week - 1) % 7; i < 6; i++) {
        // out.print("<td>&nbsp;</td>");
        out.print("<td class='gray'>" + (n++) + "</td>");
    }
    out.print("</tr>");
    }



    // 팀원 스케줄 보기 버튼 활성화시

    else if (Integer.parseInt(grade) == 1){

    String sql = "SELECT * FROM Schedule WHERE YEAR(ScheduleDateTime) = ? AND MONTH(ScheduleDateTime) = ? ORDER BY ScheduleDateTime ASC";
    PreparedStatement query = connect.prepareStatement(sql);
    
    query.setString(1, sy);
    query.setString(2, sm);

    ResultSet result = query.executeQuery();

    session = request.getSession();

    Map<Integer, Integer> scheduleCounts = new HashMap<>(); 

    while (result.next()) {
        Timestamp timestamp = result.getTimestamp("ScheduleDateTime");
        LocalDate scheduleDate = timestamp.toLocalDateTime().toLocalDate();
        int day = scheduleDate.getDayOfMonth();

        scheduleCounts.put(day, scheduleCounts.getOrDefault(day, 0) + 1);
    }


    Calendar preCal = (Calendar) cal.clone();
    preCal.add(Calendar.DATE, -(week - 1));
    int preDate = preCal.get(Calendar.DATE);

    out.print("<tr>");
    for (int i = 1; i < week; i++) {
        out.print("<td class='gray'>" + (preDate++) + "</td>");
    }

    // 1일부터 말일까지 출력
    int lastDay = cal.getActualMaximum(Calendar.DATE);
    String cls;

    for (int i = 1; i <= lastDay; i++) {
        cls = year == ty && month == tm && i == td ? "today" : "";

        // 해당 날짜의 스케줄 개수 가져오기
        int scheduleCount = scheduleCounts.getOrDefault(i, 0);

        out.print("<td class='thisMonth' data-day='" + i + "'>");
        out.print("<span class='Schedule_ScheduleDate_Span'>" + i + "</span>");
        out.print("<div class='Schedule_ScheduleDate_Td'>" + scheduleCount + "</div>");
        out.print("</td>");

        if (lastDay != i && (++week) % 7 == 1) {
            out.print("</tr><tr>");
        }
    }

    // 마지막 주 마지막 일자 다음 처리
    int n = 1;
    for (int i = (week - 1) % 7; i < 6; i++) {
        // out.print("<td>&nbsp;</td>");
        out.print("<td class='gray'>" + (n++) + "</td>");
    }
    out.print("</tr>");
    }
%>

        </table>
    </div>

    <script src="Js/CommonVar.js"></script>
    <script src="Js/Header.js"></script>
    <script src="Js/SchedulePage.js"></script>

    <script>
    </script>

</body>
</html>