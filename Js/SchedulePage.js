const date = new Date();
const viewYear = date.getFullYear();
const viewMonth = date.getMonth();

var viewNowBtn = document.getElementById("Schedule_ViewNow_Button")


// 현재 날짜 버튼에 

viewNowBtn.textContent = `${viewYear}.${viewMonth + 1}`

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

// 배열 합치기

const scheduleDates = beforeDates.concat(thisDates, nextDates);

let scheduleTable = document.getElementById("Schedule_MainSchedule_Table")

function createCalenderDate () {

    for (let i = 0; i < 5; i++){

        let createTr = document.createElement("tr")
        createTr.setAttribute('id',`Schedule_ScheduleWeek_Tr${i}`)
        
        for(let j = 0; j < 7; j++){
            let createTd = document.createElement("td")
            createTd.setAttribute("class", "Schedule_ScheduleDate_Td")
            createTd.textContent = scheduleDates[i * 7 + j];
            createTr.appendChild(createTd);

            let createDiv = document.createElement("div")
            createTd.appendChild(createDiv);
        }
        
        scheduleTable.appendChild(createTr);
    }

};

createCalenderDate();

console.log(scheduleTable)
