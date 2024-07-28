var createScheduleBtn = document.getElementById("DatePage_Write_Btn")
var createScheduleContainer = document.getElementById("DatePage_CreateSchedule_Container")
var colseContainerBtn = document.getElementById("DataPage_CloseTable_Btn")

var scheduleTitle = document.getElementById("DatePage_ScheduleTitle_Input")
var schduleCommitBtn = document.getElementById("DatePage_ScheduleCommit_Btn")


// 글쓰기 창 열고 닫기

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
    if(!scheduleTitle.value) {
        schduleCommitBtn.disabled = true;
        scheduleTitle.placeholder = "글자를 입력해주세요"
        scheduleTitle.style.borderColor = "red"
    } else {
        schduleCommitBtn.disabled = false;
        scheduleTitle.style.borderColor = ""
    }
}

// 일시:시간 생성

var timeSelect = document.getElementById("DatePage_ScheduleTime_Select")


for (let i = 0; i <= 23; i++){
    var createOptinTag = document.createElement("option");
    timeSelect.appendChild(createOptinTag)
    createOptinTag.innerHTML = i;
}



var minuteSelect = document.getElementById("DatePage_ScheduleMinutes_Select")


for (let i = 0; i <= 11; i++){
    var createOptinTag = document.createElement("option");
    minuteSelect.appendChild(createOptinTag)
    createOptinTag.innerHTML = i * 5;
}


// 일 선택 영역 날짜 생성

const date = new Date();
const viewYear = date.getFullYear();
const viewMonth = date.getMonth();
const viewdate = date.getDate();
const viewDay= date.getDay();
console.log(viewDay)


// 이전 달 마지막 날, 요일, 이번 달 마지막 날, 요일

const beforeLast = new Date (viewYear, viewMonth, 0);
const thisLast = new Date (viewYear, viewMonth + 1, 0);

const beforeLastDate = beforeLast.getDate();
const beforeLastDay = beforeLast.getDay();

const thisLastDate = thisLast.getDate();
const thisLastDay = thisLast.getDay();


const beforeDates = [];
const thisDates = [...Array(thisLastDate + 1).keys()].slice(1);
const nextDates = [];

// 지난달 마지막 요일에 토요일일 경우 추가하지 않음

if (beforeLastDay !== 6) {
    for (let i = 0; i < beforeLastDay + 1; i++) {
        beforeDates.unshift(beforeLastDate - i);
    }
}

// 이번달 마지막 요일에서 필요한만큼 추가함

for (let i = 1; i < 7 - thisLastDay; i++) {
    nextDates.push(i);
}

const scheduleDates = beforeDates.concat(thisDates, nextDates);

let scheduleTable = document.getElementById("Schedule_MainSchedule_Table")

function createCalenderDate () {

    for (let i = 0; i < 5; i++){

        let createTr = document.createElement("tr")
        createTr.setAttribute('id',`Schedule_ScheduleWeek_Tr${i}`)
        
        for(let j = 0; j < 7; j++){
            let createTd = document.createElement("td")
            createTd.setAttribute("class", "Schedule_ScheduleDate_Td")
            createTd.setAttribute("id", `Schedule_ScheduleDay_Tr${(i*7+j)+1}`)
            createTd.textContent = scheduleDates[i * 7 + j];

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


createCalenderDate();


// 창 여닫기

var datepageContainer = document.getElementById("DatePage_SelectDay_Container");
var dateSelectBtn = document.getElementById("DatePage_DateSelect_Btn");

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



document.getElementById("DatePage_DateViewYear_P").innerHTML = viewYear;
document.getElementById("DatePage_DateViewDate_P").innerHTML = `${viewMonth + 1}월 ${viewdate}일`;

if (viewDay == 0){
    document.getElementById("DatePage_DateViewDay_P").innerHTML = "일요일"
} else if (viewDay == 1) {
    document.getElementById("DatePage_DateViewDay_P").innerHTML = "월요일"
} else if (viewDay == 2) {
    document.getElementById("DatePage_DateViewDay_P").innerHTML = "화요일"
} else if (viewDay == 3) {
    document.getElementById("DatePage_DateViewDay_P").innerHTML = "수요일"
} else if (viewDay == 4) {
    document.getElementById("DatePage_DateViewDay_P").innerHTML = "목요일"
} else if (viewDay == 5) {
    document.getElementById("DatePage_DateViewDay_P").innerHTML = "금요일"
} else if (viewDay == 6) {
    document.getElementById("DatePage_DateViewDay_P").innerHTML = "토요일"
} else  {
    document.getElementById("DatePage_DateViewDay_P").innerHTML = "일요일"
}


function createScheduleEvent () {
    location.href = "./Action/CreateScheduleAction.jsp?time=" + timeSelect.value + "&minute=" + minuteSelect.value + "&title=" + scheduleTitle.value
}