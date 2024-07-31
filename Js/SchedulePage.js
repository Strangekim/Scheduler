const selectMonthContainer = document.getElementById("Schedule_SelectMonth_Container");
const selectMonthCloseBtn = document.getElementById("Schedule_SelectMonthClose_Btn");

var viewNowBtn = document.getElementById("Schedule_ViewNow_Button")
var selectMotnTable = document.getElementById("Schedule_SelectMonthContainer_Table");
var selectMotnTableHtml = selectMotnTable.innerHTML;
var selectYearBtn = document.getElementById("Schdule_SelectYear_Btn");

// 월 선택 영역 모달 열고 닫기
function seleectMonthModal () {
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
    };
};

// 년 & 월 선택 영역 스왑
function swapYearMonthModal () {
    selectYearBtn.innerHTML = headerYear;
    selectYearBtn.onclick = function event(e){
    selectMotnTable.innerHTML = "";
    selectYearBtn.innerHTML = 11;

        for(var i = 0; i < 9; i++){
            const createBtn = document.createElement("button")
            createBtn.setAttribute("id",`${(headerYear - 4) + i}`);
            createBtn.setAttribute("class", "Schduel_SelectYear_Class")
            createBtn.innerHTML = (headerYear - 4) + i;
            createBtn.style.width = "33%";
            selectMotnTable.appendChild(createBtn);

            createBtn.onclick = function(e) {
                selectMotnTable.innerHTML = selectMotnTableHtml;
                var getYear = e.target.innerHTML;
                selectYearBtn.innerText = getYear;
            };
        };
    };
};

// 좌우 월 이동 버튼 이벤트
function decreaseMonthEvent () {
    var decreaseMonth = headerMonth;
    var decreaseYear = headerYear;
    if (headerMonth > 1) {
    decreaseMonth = headerMonth - 1;
    } else if (headerMonth == 1) {
        decreaseYear = decreaseYear - 1
        decreaseMonth = 12;
    }
    if (headerGrade) {
        location.href = "./SchedulePage.jsp?year=" + decreaseYear + "&month=" + decreaseMonth + "&grade=" + headerGrade
    } else {
        location.href = "./SchedulePage.jsp?year=" + decreaseYear + "&month=" + decreaseMonth
    }
}
function increaseMonthEvent () {
    var increaseMonth = Number(headerMonth);
    var increaseYear = Number(headerYear);
    if (increaseMonth < 12) {
        increaseMonth = Number(headerMonth) + 1;
    } else if (headerMonth == 12) {
        increaseYear = increaseYear + 1
        increaseMonth = 1;
    }
    if (headerGrade) {
        location.href = "./SchedulePage.jsp?year=" + increaseYear + "&month=" + increaseMonth + "&grade=" + headerGrade
    } else {
        location.href = "./SchedulePage.jsp?year=" + increaseYear + "&month=" + increaseMonth
    }
}

//오늘 날짜에 해당하는 배경색 변경
function changeTodayColor () {
    var thisMonth = document.querySelectorAll('.thisMonth')

    for(var i = 0; i < thisMonth.length; i++){
    var changeToday = thisMonth[i].getAttribute("data-day");
    if(changeToday == viewdate && viewYear == headerYear && viewMonth == headerMonth) {
        thisMonth[i].style.backgroundColor = "tomato";
    }
    }
    thisMonth.forEach(function(td) {
        td.addEventListener('click', setDatePageEvent);
    });
};


// 일일페이지 이동 이벤트
function setDatePageEvent(e) {
    var target = e.target;
    if (target.tagName === 'DIV') {
        target = target.parentElement;
    }
    var date = target.getAttribute("data-day");

    if(headerGrade){
    location.href = "./DatePage.jsp?year=" + headerYear + "&month=" + headerMonth + "&date=" + date + "&grade=" + headerGrade
    } else {
    location.href = "./DatePage.jsp?year=" + headerYear + "&month=" + headerMonth + "&date=" + date       
    }
}

// 월 선택 영역
function changeMonthEvent(e) {
    location.href = "./SchedulePage.jsp?year=" + selectYearBtn.innerHTML + "&month=" + e 
}

seleectMonthModal();
swapYearMonthModal();
changeTodayColor();