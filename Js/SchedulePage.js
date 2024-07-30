// 오늘 날짜 받아오기

const date = new Date();
const viewYear = date.getFullYear();
const viewMonth = date.getMonth() + 1;
const viewdate = date.getDate();

// url 데이터 받아오기
const urlParams = new URL(location.href).searchParams;

const year = urlParams.get('year');
const month = urlParams.get('month');
const grade = urlParams.get('grade');

var viewNowBtn = document.getElementById("Schedule_ViewNow_Button")

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

selectYearBtn.onclick = function event(e){

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

// document.querySelectorAll('.Schedule_ScheduleDate_Td').forEach(function(e) {
//     e.addEventListener('click', moveDateEvent);
// });

// function moveDateEvent (event) {
//     console.log(event.target)
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

    if (grade) {
        location.href = "./SchedulePage.jsp?year=" + decreaseYear + "&month=" + decreaseMonth + "&grade=" + grade
    } else {
        location.href = "./SchedulePage.jsp?year=" + decreaseYear + "&month=" + decreaseMonth
    }
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

    if (grade) {
        location.href = "./SchedulePage.jsp?year=" + increaseYear + "&month=" + increaseMonth + "&grade=" + grade
    } else {
        location.href = "./SchedulePage.jsp?year=" + increaseYear + "&month=" + increaseMonth
    }

}

//오늘 날짜에 해당하는 배경색 변경

var thisMonth = document.querySelectorAll('.thisMonth')

for(var i = 0; i < thisMonth.length; i++){
   var changeToday = thisMonth[i].getAttribute("data-day");

   if(changeToday == viewdate && viewYear == year && viewMonth == month) {
    thisMonth[i].style.backgroundColor = "tomato";
   }
}

thisMonth.forEach(function(td) {
    td.addEventListener('click', setDatePageEvent);
});


// 각 날짜 클릭시 해당 일일페이지 이동
function setDatePageEvent(e) {

    var target = e.target;

    if (target.tagName === 'DIV') {
        target = target.parentElement;
    }

    var date = target.getAttribute("data-day");

    console.log(date);

    location.href = "./DatePage.jsp?year=" + year + "&month=" + month + "&date=" + date
}

// 월 선택 영역

function changeMonthEvent(e) {
    location.href = "./SchedulePage.jsp?year=" + selectYearBtn.innerHTML + "&month=" + e 
}