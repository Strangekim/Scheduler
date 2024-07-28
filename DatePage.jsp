<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html lang="kr">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일일 페이지</title>
    <link rel="stylesheet" type="text/css" href="Css/DatePage.css">

</head>

<body>


    <div id="DatePage_Main_Container">
        <div id="DatePage_Main_MenuContainer">
            <div>
                <button id="DatePage_Today_Btn">오늘</button>
            </div>

            <div>
                <button>&lt;</button>

                <button id="DatePage_DateSelect_Btn">
                    <div id="DatePage_DateView_Container">
                        <p id="DatePage_DateViewYear_P"></p>
                        <p id="DatePage_DateViewDate_P"></p>
                        <p id="DatePage_DateViewDay_P"></p>
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