const date = new Date();
const viewYear = date.getFullYear();
const viewMonth = date.getMonth();
const viewdate = date.getDate();


const urlParams = new URL(location.href).searchParams;

const year = urlParams.get('year');
const month = urlParams.get('month');



var viewNowBtn = document.getElementById("Schedule_ViewNow_Button")


// const beforeLast = new Date (viewYear, viewMonth, 0);
// const thisLast = new Date (viewYear, viewMonth + 1, 0);

// const beforeLastDate = beforeLast.getDate();
// const beforeLastDay = beforeLast.getDay();

// const thisLastDate = thisLast.getDate();
// const thisLastDay = thisLast.getDay();


// const beforeDates = [];
// const thisDates = [...Array(thisLastDate + 1).keys()].slice(1);
// const nextDates = [];

// // 지난달 마지막 요일에 토요일일 경우 추가하지 않음

// if (beforeLastDay !== 6) {
//     for (let i = 0; i < beforeLastDay + 1; i++) {
//         beforeDates.unshift(beforeLastDate - i);
//     }
// }

// // 이번달 마지막 요일에서 필요한만큼 추가함

// for (let i = 1; i < 7 - thisLastDay; i++) {
//     nextDates.push(i);
// }

// // 배열 합치기

// const scheduleDates = beforeDates.concat(thisDates, nextDates);

// let scheduleTable = document.getElementById("Schedule_MainSchedule_Table")

// function createCalenderDate () {

//     for (let i = 0; i < 5; i++){

//         let createTr = document.createElement("tr")
//         createTr.setAttribute('id',`Schedule_ScheduleWeek_Tr${i}`)
        
//         for(let j = 0; j < 7; j++){
//             let createTd = document.createElement("td")
//             createTd.setAttribute("class", "Schedule_ScheduleDate_Td")
//             createTd.setAttribute("id", `Schedule_ScheduleDay_Tr${(i*7+j)+1}`)
//             createTd.textContent = scheduleDates[i * 7 + j];

//             createTr.appendChild(createTd);

//             let createDiv = document.createElement("div")
//             createTd.appendChild(createDiv);


//             if(createTd.textContent == viewdate){
//                 createTd.style.background = "orange";
//             }

//         }
        
//         scheduleTable.appendChild(createTr);
//     }

// };


// createCalenderDate();



// 월 선택 페이지 컨트롤

const selectMonthContainer = document.getElementById("Schedule_SelectMonth_Container");
const selectMonthCloseBtn = document.getElementById("Schedule_SelectMonthClose_Btn");


selectMonthContainer.style.display ="none";

viewNowBtn.onclick = function (e) {

    if(selectMonthContainer.style.display == ""){
        selectMonthContainer.style.display ="none";
        viewNowBtn.style.backgroundColor = "gray";
    } else {
        selectMonthContainer.style.display ="";
        viewNowBtn.style.backgroundColor = "orange";
    }

};

selectMonthCloseBtn.onclick = function(e) {
    selectMonthContainer.style.display ="none";
    viewNowBtn.style.backgroundColor = "gray";
}

// 년 & 월 선택 영역 스왑
var selectMotnTable = document.getElementById("Schedule_SelectMonthContainer_Table")
var selectMotnTableHtml = selectMotnTable.innerHTML;


var selectYearBtn = document.getElementById("Schdule_SelectYear_Btn");

selectYearBtn.innerHTML = year;

selectYearBtn.onclick = function(e){

    selectMotnTable.innerHTML = "";
    console.log(selectYearBtn.innerHTML)
    selectYearBtn.innerHTML = 11;
    for(var i = 0; i < 9; i++){
        
        const createBtn = document.createElement("button")

        createBtn.setAttribute("id",`${(year - 4) + i}`);
        createBtn.setAttribute("class", "Schduel_SelectYear_Class")
        createBtn.innerHTML = (year - 4) + i;
        createBtn.style.width = "33%";
        selectMotnTable.appendChild(createBtn);
        createBtn.onclick = function(e) {
            selectMotnTable.innerHTML = selectMotnTableHtml;
            var getYear = e.target.innerHTML;
            selectYearBtn.innerHTML = getYear;
            console.log(selectYearBtn.innerHTML)
        }
        };

        console.log(selectYearBtn.innerHTML)
}

// var tmp = document.querySelectorAll("Schduel_SelectYear_Class")[0]

// tmp.onclick = function(e){
//     console.log(1)
// }


// 좌우 월 이동 버튼

function decreaseMonthEvent () {
    var decreaseMonth = month;
    var decreaseYear = year;

    if (month > 1) {
    decreaseMonth = month - 1;
    } else if (month == 1) {
        decreaseYear = decreaseYear - 1
        decreaseMonth = 12;
    }

    location.href = "./SchedulePage.jsp?year=" + decreaseYear + "&month=" + decreaseMonth
}

function increaseMonthEvent () {
    var increaseMonth = Number(month);
    var increaseYear = Number(year);

    if (increaseMonth < 12) {
        increaseMonth = Number(month) + 1;
    } else if (month == 12) {
        increaseYear = increaseYear + 1
        increaseMonth = 1;
    }

    
    location.href = "./SchedulePage.jsp?year=" + increaseYear + "&month=" + increaseMonth
}


document.querySelectorAll('.thisMonth').forEach(function(td) {
    td.addEventListener('click', setDatePageEvent);
});

function setDatePageEvent(e) {

    var target = e.target;

    if (target.tagName === 'DIV') {
        target = target.parentElement;
    }

    var date = target.innerText

    console.log(date);

    location.href = "./DatePage.jsp?year=" + year + "&month=" + month + "&=date" + date
}
