var createScheduleBtn = document.getElementById("DatePage_Write_Btn")
var createScheduleContainer = document.getElementById("DatePage_CreateSchedule_Container")
var colseContainerBtn = document.getElementById("DataPage_CloseTable_Btn")
var scheduleTitle = document.getElementById("DatePage_ScheduleTitle_Input")
var schduleCommitBtn = document.getElementById("DatePage_ScheduleCommit_Btn")
var datepageContainer = document.getElementById("DatePage_SelectDay_Container");
var dateSelectBtn = document.getElementById("DatePage_DateSelect_Btn");
var timeSelect = document.getElementById("DatePage_ScheduleTime_Select")
var minuteSelect = document.getElementById("DatePage_ScheduleMinutes_Select")
let scheduleTable = document.getElementById("Schedule_MainSchedule_Table")
var goTodayBtn = document.getElementById("DatePage_Today_Btn")

// 이전 달 마지막 날, 요일, 이번 달 마지막 날, 요일
const beforeLast = new Date (viewYear, viewMonth, 0);
const thisLast = new Date (headerYear, headerMonth, 0);
const beforeLastDate = beforeLast.getDate();
const beforeLastDay = beforeLast.getDay();
const thisLastDate = thisLast.getDate();
const thisLastDay = thisLast.getDay();

// 일 선택 영역 날짜 생성
const beforeDates = [];
const thisDates = [...Array(thisLastDate + 1).keys()].slice(1);
const nextDates = [];
const scheduleDates = beforeDates.concat(thisDates, nextDates);

// 글쓰기 창 열고 닫기
function writeModal() {

    createScheduleContainer.style.display ="none";

    createScheduleBtn.onclick = function(e) {

        if(createScheduleContainer.style.display == "") {
            createScheduleContainer.style.display = "none";
        } else {
            createScheduleContainer.style.display = "";
        }

    }
    colseContainerBtn.onclick = function(e) {
        createScheduleContainer.style.display ="none";
    }
    // 예외처리

    scheduleTitle.placeholder = "제목을 입력해주십시오."

    schduleCommitBtn.disabled = true;

    scheduleTitle.onfocus = function(e) {
        scheduleTitle.placeholder = "최대 10글자 까지 입력 가능합니다."
    }

    scheduleTitle.onblur = function(e) {
        if(!regScheduleTitle.test(scheduleTitle.value)) {
            schduleCommitBtn.disabled = true;
            scheduleTitle.placeholder = "글자를 입력해주세요"
            scheduleTitle.style.borderColor = "red"
        } else {
            schduleCommitBtn.disabled = false;
            scheduleTitle.style.borderColor = ""
        }
    }

};

//todo
// 달력 생성 , 클릭시 일일 페이지 이동
function createCalenderDate () {

    for (let i = 0; i < 5; i++){

        let createTr = document.createElement("tr")

        for(let j = 0; j < 7; j++){
            let createTd = document.createElement("td")
            createTd.setAttribute("class", "Schedule_ScheduleDate_Td")
            createTd.setAttribute("id", `Schedule_ScheduleDay_Tr${(i*7+j)+1}`)
            createTd.textContent = scheduleDates[i * 7 + j];

            createTd.onclick = function(e){
                var getDay = e.target.innerText;
                if (headerGrade == 1) {
                location.href = "./DatePage.jsp?year=" + headerYear + "&month=" + headerMonth + "&date=" + getDay + "&grade=" + headerGrade
                } else {
                location.href = "./DatePage.jsp?year=" + headerYear + "&month=" + headerMonth + "&date=" + getDay         
                }
            }

            createTr.appendChild(createTd);

            let createDiv = document.createElement("div")
            createTd.appendChild(createDiv);

            if(createTd.textContent == viewdate){
                createTd.style.background = "orange";
            }
        }
        scheduleTable.appendChild(createTr);
    }
};

// 일일 이동페이지 창 여닫기
function dateModal () {
    datepageContainer.style.display = "none"

    dateSelectBtn.onclick = function(e) {

        if(datepageContainer.style.display == ""){
            datepageContainer.style.display = "none"
        } else {
            datepageContainer.style.display = "";
        }
    }

    document.getElementById("DatePage_CloseSelectDay_Btn").onclick = function(e){
        datepageContainer.style.display ="none"
    }
};

//todo
// 수정 버튼
function fixScheduleEvent(event) {

    var scheduleIdx = event;

    var myScheduleContainer = document.getElementById(`DatePage_Schedule_MyContainer${event}`)
    myScheduleContainer.innerHTML = "";

    // p 태그 생성
    const createP = document.createElement("p")

    const createSmallP = document.createElement("p")
    createP.setAttribute("class", "ChangePage_ScheduleTime_P")
    myScheduleContainer.appendChild(createP)

    const createChildP1 = document.createElement("p") 
    // 시간

    const createSelect = document.createElement("select")

    createP.appendChild(createChildP1)
    createChildP1.appendChild(createSelect)
    createSelect.setAttribute("id", "ChangePage_ScheduleTime_Select")

    var fixTimeSelect = document.getElementById("ChangePage_ScheduleTime_Select")

    for (let i = 0; i <= 23; i++){
        var createOptinTag = document.createElement("option");
        fixTimeSelect.appendChild(createOptinTag)
        createOptinTag.innerHTML = i;
    }

    // 분
    const createMinuteSelect = document.createElement("select")

    createChildP1.appendChild(createMinuteSelect)
    createMinuteSelect.setAttribute("id", "ChangePage_ScheduleMinute_Select")

    var fixMinuteSelect = document.getElementById("ChangePage_ScheduleMinute_Select")

    for (let i = 0; i <= 11; i++){
        var createOptinTag = document.createElement("option");
        fixMinuteSelect.appendChild(createOptinTag)
        createOptinTag.innerHTML = i * 5;
    }

    // 제목 입력칸

    const createChildP2 = document.createElement("p") 
    createP.appendChild(createChildP2)

    const createTitleInput = document.createElement("input")
    createChildP2.appendChild(createTitleInput)
    createTitleInput.type = "text";
    createTitleInput.maxLength = "10"

    // 버튼들

    const createChildP3 = document.createElement("p") 
    createP.appendChild(createChildP3)

    const createFixButtons1 = document.createElement("button")
    const createFixButtons2 = document.createElement("button")

    createChildP3.appendChild(createFixButtons1)
    createFixButtons1.innerText = "수정"
    createChildP3.appendChild(createFixButtons2)
    createFixButtons2.innerText = "X"


    createFixButtons1.onclick = function () {
    
        if(confirm("수정하시겠습니까?")){{
            var scheduleFixDatetime = `${headerYear}-${headerMonth}-${headerDate} ${fixTimeSelect.value}:${fixMinuteSelect.value}:00`
            console.log(scheduleFixDatetime)

            location.href = "./Action/FixScheduleAction.jsp?scheduleDatetime=" + scheduleFixDatetime + "&title=" + createTitleInput.value + "&scheduleIdx=" + scheduleIdx
        }}
    }

    createFixButtons2.onclick = function () {
            location.href = "./DatePage.jsp?year=" + headerYear + "&month=" + headerMonth + "&date=" + headerDate + "&grade=" + headerGrade        
    }
};

// 일시:시간 생성
function createSelect () {
    for (let i = 0; i <= 23; i++){
        var createOptinTag = document.createElement("option");
        timeSelect.appendChild(createOptinTag)
        createOptinTag.innerHTML = i;
    }

    for (let i = 0; i <= 11; i++){
        var createOptinTag = document.createElement("option");
        minuteSelect.appendChild(createOptinTag)
        createOptinTag.innerHTML = i * 5;
    }
};

// 좌우 이동 버튼 이벤트
function beforeDayEvent () {
    var changeYear = Number(headerYear);
    var changeMonth = Number(headerMonth);
    var changeDate = Number(headerDate);

    
    if(changeDate == 1) {
        var lastDay = new Date(headerYear, changeMonth - 1, 0);
        if(changeMonth == 1){
            changeYear = changeYear - 1;
            changeMonth = 12;
        }else {
            changeMonth = changeMonth - 1;
        }
        changeDate = lastDay.getDate();

    } else {
        changeDate = changeDate - 1;
    }

    if (headerGrade) {
        location.href = "./DatePage.jsp?year=" + changeYear + "&month=" + changeMonth + "&date=" + changeDate + "&grade=" + headerGrade        
    } else {
        location.href = "./DatePage.jsp?year=" + changeYear + "&month=" + changeMonth + "&date=" + changeDate
    }

}
function afterDayEvent () {
    var changeYear = Number(headerYear);
    var changeMonth = Number(headerMonth);
    var changeDate = Number(headerDate);

    var lastDay = new Date(headerYear, changeMonth, 0);

    if(changeDate == lastDay.getDate()) {
        if(changeMonth == 12) {
            changeYear = changeYear + 1;
            changeMonth = 1;
        } else {
        changeMonth = changeMonth + 1;
        }
        changeDate = 1;
    } else {
        changeDate = changeDate + 1;
    }
    if (headerGrade) {
        location.href = "./DatePage.jsp?year=" + changeYear + "&month=" + changeMonth + "&date=" + changeDate + "&grade=" + headerGrade        
    } else {
        location.href = "./DatePage.jsp?year=" + changeYear + "&month=" + changeMonth + "&date=" + changeDate
    }
}

// 글 작성 이벤트
function createScheduleEvent () {
    let scheduleDatetime = `${headerYear}-${headerMonth}-${headerDate} ${timeSelect.value}:${minuteSelect.value}:00`
    console.log(scheduleDatetime)
    location.href = "./Action/CreateScheduleAction.jsp?scheduleDatetime=" + scheduleDatetime + "&title=" + scheduleTitle.value +
    "&year=" + headerYear + "&month=" + headerMonth + "&date=" + headerDate
};

// 글 삭제 이벤트
function deleteSchedule () {
    document.querySelectorAll('.Schedule_GetScheduleIdx_Input').forEach(function(e) {
        e.addEventListener('click', scheduleDeleteEvent);
    });

    function scheduleDeleteEvent (event) {
        var scheduleIdx = event.target.name;

        if (confirm("정말 삭제하시겠습니까?")){ 
        location.href = "./Action/DeleteScheduleAction.jsp?scheduleIdx=" + scheduleIdx
        };
    };
};

// 오늘 버튼 이벤트
goTodayBtn.onclick = function () {
    if (headerGrade == 1) {
        location.href = "./DatePage.jsp?year=" + viewYear + "&month=" + viewMonth + "&date=" + viewDay + "&grade=" + headerGrade
        } else {
        location.href = "./DatePage.jsp?year=" + viewYear + "&month=" + viewMonth + "&date=" + viewDay         
        }
}

writeModal();
createCalenderDate();
dateModal();
deleteSchedule();
createSelect();