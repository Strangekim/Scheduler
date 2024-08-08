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
<%@ page import="java.util.regex.*"%>

<%@ page import="java.sql.Timestamp"%>

<!DOCTYPE html>
<html lang="kr">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스케줄 페이지</title>
    <link rel="stylesheet" type="text/css" href="Css/SchedulePage.css">

</head>

<%
    String gradeIdx = (String) session.getAttribute("gradeIdx");
    String memberIdx = (String) session.getAttribute("memberIdx");

    String grade = request.getParameter("grade");
    String urlYear = request.getParameter("year");
    String urlMonth = request.getParameter("month");

    String regGradeIdx = "^[12]$";
    String regMemberIdx = "^[0-9]*$";
    String regUrlMonth = "^(1[0-2]|[1-9])$";
    String regUrlYear = "^\\d{4}$";

    boolean regGrade = Pattern.matches(regGradeIdx, gradeIdx);
    boolean regMember = Pattern.matches(regMemberIdx, memberIdx); 
    boolean regUrlGrade = Pattern.matches(regGradeIdx, grade);  
    boolean regMonth = Pattern.matches(regUrlMonth, urlMonth);
    boolean regYear = Pattern.matches(regUrlYear, urlYear);

    out.print(regMonth);

    if(!regGrade|| !regMember || !regYear || !regMonth || !regUrlGrade || 
    memberIdx == null || memberIdx.isEmpty() || gradeIdx == null || gradeIdx.isEmpty()){ 
    session.invalidate();
%>
    <script>
    alert("잘못된 접근입니다.")
    location.href="LogIn.jsp"
    </script>
<% 
    } else {

    Calendar cal = Calendar.getInstance();
    Calendar preCal = Calendar.getInstance();

    // 오늘 날짜
    int todayYear = cal.get(Calendar.YEAR);
    int todayMonth = cal.get(Calendar.MONTH)+1;  
    int todayDate = cal.get(Calendar.DATE);
    int todayDayOfWeek = cal.get(Calendar.DAY_OF_WEEK);

    int year = Integer.parseInt(urlYear);
    int month = Integer.parseInt(urlMonth);

    cal.set(year, month - 1, 1);
    todayDayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
    int lastDay = cal.getActualMaximum(Calendar.DATE);

    preCal.set(year, month - 2, 1);
    int lastMonthLastDay = preCal.getActualMaximum(Calendar.DATE);
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
                    <button id="Schedule_ViewNow_Button"><%=urlYear%>.<%=urlMonth%></button>
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

            <tr>

<%  
    // 이전 달 날짜들
    for(int i = todayDayOfWeek; i > 1; i--){
%>

        <td class='gray'>
            <%=(lastMonthLastDay-i) + 2%>
        </td>

<%  
    }
      
    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mySchedulePage","stageus","1234");

    if(Integer.parseInt(grade) == 1) {

    // 게시글 전체 정보 받아오기 sql
    String sql = "SELECT EXTRACT(day FROM ScheduleDateTime) AS date, COUNT(*) AS ScheduleCount FROM Schedule WHERE YEAR(ScheduleDateTime) = ? AND MONTH(ScheduleDateTime) = ? AND memberIdx = ? GROUP BY DAY(ScheduleDateTime);";
    PreparedStatement query = connect.prepareStatement(sql);
    
    query.setString(1, urlYear);
    query.setString(2, urlMonth);
    query.setString(3, memberIdx);

    ResultSet result = query.executeQuery();

    Map<Integer, Integer> scheduleCounts = new HashMap<>();

    while (result.next()){
        int scheduleDate = Integer.parseInt(result.getString("date"));
        int scheduleCount = Integer.parseInt(result.getString("scheduleCount"));

        scheduleCounts.put(scheduleDate, scheduleCount);
    };


    // 첫번째 주 이번달 날짜들
   for(int i = 1; i <= 8 - todayDayOfWeek; i++){
    int dateScheduleCount = scheduleCounts.getOrDefault(i,0);
%>

        <td class='thisMonth' data-day="<%=i%>">
            <span class='Schedule_ScheduleDate_Span'>
                <%=i%>
            </span>
            <div class='Schedule_ScheduleDate_Td'>
                <%=dateScheduleCount%>
            </div>    
        </td>

<%
    }
%>

    </tr>
    <tr>
    
<%
    for(int i = 1; i <= lastDay - (8- todayDayOfWeek); i++){
    int dateScheduleCount = scheduleCounts.getOrDefault(i+(8-todayDayOfWeek),0);
%>

        <td class='thisMonth' data-day="<%=i+(8-todayDayOfWeek)%>">
            <span class='Schedule_ScheduleDate_Span'>
                <%=i+(8-todayDayOfWeek)%>
            </span>
            <div class='Schedule_ScheduleDate_Td'>
                <%=dateScheduleCount%>
            </div>  
        </td>

<%
    if(i % 7 == 0){
%>

    </tr>
    <tr>

<%
    };
    }}

    // 팀원 스케줄 보기 버튼 활성화시

    else if (Integer.parseInt(grade) == 2 && Integer.parseInt(gradeIdx) == 2){

    // 게시글 전체 정보 받아오기 sql
    String sql = "SELECT EXTRACT(day FROM ScheduleDateTime) AS date, COUNT(*) AS ScheduleCount FROM Schedule WHERE YEAR(ScheduleDateTime) = ? AND MONTH(ScheduleDateTime) = ? GROUP BY DAY(ScheduleDateTime);";
    PreparedStatement query = connect.prepareStatement(sql);
    
    query.setString(1, urlYear);
    query.setString(2, urlMonth);

    ResultSet result = query.executeQuery();

    Map<Integer, Integer> scheduleCounts = new HashMap<>();

    while (result.next()){
        int scheduleDate = Integer.parseInt(result.getString("date"));
        int scheduleCount = Integer.parseInt(result.getString("scheduleCount"));

        scheduleCounts.put(scheduleDate, scheduleCount);
    };


    // 첫번째 주 이번달 날짜들
   for(int i = 1; i <= 8 - todayDayOfWeek; i++){
    int dateScheduleCount = scheduleCounts.getOrDefault(i,0);
%>

        <td class='thisMonth' data-day="<%=i%>">
            <span class='Schedule_ScheduleDate_Span'>
                <%=i%>
            </span>
            <div class='Schedule_ScheduleDate_Td'>
                <%=dateScheduleCount%>
            </div>    
        </td>

<%
    }
%>

    </tr>
    <tr>
    
<%
    for(int i = 1; i <= lastDay - (8- todayDayOfWeek); i++){
    int dateScheduleCount = scheduleCounts.getOrDefault(i+(8-todayDayOfWeek),0);
%>

        <td class='thisMonth' data-day="<%=i+(8-todayDayOfWeek)%>">
            <span class='Schedule_ScheduleDate_Span'>
                <%=i+(8-todayDayOfWeek)%>
            </span>
            <div class='Schedule_ScheduleDate_Td'>
                <%=dateScheduleCount%>
            </div>  
        </td>

<%
    if(i % 7 == 0){
%>

    </tr>
    <tr>

<%
    }}} else if (Integer.parseInt(gradeIdx) != 2) {
        session.invalidate();
%>

    <script>
    alert("권한이 없습니다.")
    location.href="LogIn.jsp"
    </script>    

<%
    }}
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