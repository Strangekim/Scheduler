var createScheduleBtn = document.getElementById("DatePage_Write_Btn")
var createScheduleContainer = document.getElementById("DatePage_CreateSchedule_Container")
var colseContainerBtn = document.getElementById("DataPage_CloseTable_Btn")

var scheduleTitle = document.getElementById("DatePage_ScheduleTitle_Input")
var schduleCommitBtn = document.getElementById("DatePage_ScheduleCommit_Btn")


// 창 열고 닫기

createScheduleContainer.style.display ="none";

createScheduleBtn.onclick = function(e) {

    createScheduleContainer.style.display ="";

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

