// 헤더 태그 추가
const createHeaderTag = document.createElement("header")
createHeaderTag.setAttribute("id", "Main_Header")

let bodyTag = document.querySelector("body");

bodyTag.prepend(createHeaderTag)


// 헤더 css 추가
const createLinkTag = document.createElement("link")

createLinkTag.rel = "stylesheet"
createLinkTag.type= "text/css"
createLinkTag.href= "Css/Header.css"

let linkTag = document.querySelector("head");

linkTag.append(createLinkTag)


// 전체 헤더 생성

var headerTag = document.getElementById("Main_Header")

const createHeaderDiv = document.createElement("div");

createHeaderDiv.setAttribute("id","Header_Container_Div");

headerTag.appendChild(createHeaderDiv)

var getHeader = document.getElementById("Header_Container_Div")


// 좌측 홈 로고 버튼 생성

const createLogoDiv = document.createElement("div");

createLogoDiv.setAttribute("id","Header_Logo_Div");

getHeader.appendChild(createLogoDiv)

var getLogoHeader = document.getElementById("Header_Logo_Div")


// 좌측 임시 로고 버튼 생성

const createLogoButton = document.createElement("button")

createLogoButton.setAttribute("id", "Header_Logo_Btn")

createLogoButton.innerHTML = "로고"

getLogoHeader.appendChild(createLogoButton)


// 우측 Div 생성

const createButtonsDiv = document.createElement("div")

createButtonsDiv.setAttribute("id", "Header_Btn_Div")

getHeader.appendChild(createButtonsDiv)

// 첫번째 버튼 추가

const createFirstButtons = document.createElement("input")

createFirstButtons.setAttribute("class", "Header_BtnStyle_Btn")

createFirstButtons.type = "button"

createFirstButtons.onclick = function(e) {
    location.href = "Action/LogOutAction.jsp"
}

createButtonsDiv.appendChild(createFirstButtons)


// 두번째 버튼 추가

const createSecondButtons = document.createElement("input")

createSecondButtons.setAttribute("class", "Header_BtnStyle_Btn")

createSecondButtons.type = "button"

createButtonsDiv.appendChild(createSecondButtons)


// 세번째 버튼 추가

const createThirdButtons = document.createElement("input")

createThirdButtons.setAttribute("class", "Header_BtnStyle_Btn")

createThirdButtons.type = "button"

createButtonsDiv.appendChild(createThirdButtons)


// 팀장 버튼 추가

const createForthButtons = document.createElement("input")

createForthButtons.setAttribute("class", "Header_ChiefBtnStyle_Btn")

createForthButtons.type = "button"

createButtonsDiv.appendChild(createForthButtons)


// 경로에 따라 나올 버튼 선택
function headerBtnDisplay () {

    
    // 로그인 페이지
if (window.location.pathname == "/scheduler/LogIn.jsp") {
    createButtonsDiv.style.display = "none";

    createLogoButton.onclick = function () {
        console.log(createLogoButton)
        window.location.href= 'LogIn.jsp'
    }

    // 회원가입, ID 비밀번호 찾기
} else if (window.location.pathname == "/scheduler/SignIn.jsp"
    || window.location.pathname == "/scheduler/FindId.jsp"
    || window.location.pathname == "/scheduler/FindPw.jsp"
) {
    createSecondButtons.style.display = "none";
    createThirdButtons.style.display = "none";
    createForthButtons.style.display = "none";

    createFirstButtons.value = "로그인"

    createFirstButtons.onclick = function () {
        window.location.href= 'LogIn.jsp'
    }

    createLogoButton.onclick = function () {
        console.log(createLogoButton)
        window.location.href= 'LogIn.jsp'
    }


    // 스케줄 페이지
} else if (window.location.pathname == "/scheduler/SchedulePage.jsp") {
    
    var gradeIdxGet = document.getElementById("Schedule_GetGrade_Input").value

    createThirdButtons.style.display = "none"; 
    
    if(gradeIdxGet == 1){
        createForthButtons.style.display = "none"
    }

    createFirstButtons.value = "로그아웃"
    createSecondButtons.value = "마이페이지"
    createForthButtons.value = "팀원스케줄보기"

    createSecondButtons.onclick = function () {
        window.location.href= 'MyPage.jsp'
    }

    createLogoButton.onclick = function () {
        if (headerGrade == 2) {
            location.href = 'SchedulePage.jsp?year=' + viewYear + "&month=" + viewMonth + "&grade=" + 2; 
            } else {
            location.href = 'SchedulePage.jsp?year=' + viewYear + "&month=" + viewMonth + "&grade=" + 1;
            }
    }

    createForthButtons.onclick = function () {
        if (headerGrade == 1) {
            location.href = 'SchedulePage.jsp?year=' + headerYear + "&month=" + headerMonth + "&grade=" + 2;
        } else {
            location.href = 'SchedulePage.jsp?year=' + headerYear + "&month=" + headerMonth + "&grade=" + 1;
        }
    }
    
    // 마이 페이지

} else if (window.location.pathname == "/scheduler/MyPage.jsp") {

    createForthButtons.style.display = "none";
    createThirdButtons.style.display = "none";

    createFirstButtons.value = "로그아웃"
    createSecondButtons.value = "HOME"

    createSecondButtons.onclick = function () {
        location.href = 'SchedulePage.jsp?year=' + viewYear + "&month=" + viewMonth + "&grade=" + 1;
    }

    createLogoButton.onclick = function () {
        location.href = 'SchedulePage.jsp?year=' + viewYear + "&month=" + viewMonth + "&grade=" + 1;
    }
    
    // 일일 페이지

} else if (window.location.pathname == "/scheduler/DatePage.jsp"){

    var gradeIdxGet = document.getElementById("Schedule_GetGrade_Input").value

    if(gradeIdxGet == 1){
        createForthButtons.style.display = "none"
    }

    createThirdButtons.style.display = "none";

    createFirstButtons.value = "로그아웃"
    createSecondButtons.value = "HOME"
    createForthButtons.value = "팀원스케줄보기"

    createSecondButtons.onclick = function () {
        if (headerGrade == 2) {
        location.href = 'SchedulePage.jsp?year=' + headerYear + "&month=" + headerMonth + "&grade=" + 2; 
        } else {
        location.href = 'SchedulePage.jsp?year=' + headerYear + "&month=" + headerMonth + "&grade=" + 1;
        }
    }

    createLogoButton.onclick = function () {
        if (headerGrade == 2) {
            location.href = 'SchedulePage.jsp?year=' + headerYear + "&month=" + headerMonth + "&grade=" + 2; 
            } else {
            location.href = 'SchedulePage.jsp?year=' + headerYear + "&month=" + headerMonth + "&grade=" + 1;
            }
    }

    createForthButtons.onclick = function () {
        if (headerGrade == 1) {
            location.href = 'DatePage.jsp?year=' + headerYear + "&month=" + headerMonth + "&date=" + headerDate + "&grade=" + 2;
        } else {
            location.href = 'DatePage.jsp?year=' + headerYear + "&month=" + headerMonth + "&date=" + headerDate + "&grade=" + 1;
        }
    }
}

    if (headerGrade == 2){
        createForthButtons.style.background = "red";
    } else if (window.location.pathname == "/scheduler/DatePage.jsp"){

        if(gradeIdxGet == 1){
            createForthButtons.style.display = "none"
        }
        createThirdButtons.style.display = "none";
        createFirstButtons.value = "로그아웃"
        createSecondButtons.value = "HOME"
        createForthButtons.value = "팀원스케줄보기"

        createSecondButtons.onclick = function () {
            location.href = 'SchedulePage.jsp?year=' + viewYear + "&month=" + viewMonth + "&grade=" + 1;
        }
        createLogoButton.onclick = function () {
            console.log(createLogoButton)
            location.href = 'SchedulePage.jsp?year=' + viewYear + "&month=" + viewMonth + "&grade=" + 1;
        }
        createForthButtons.onclick = function () {
            if (headerGrade == 1) {
                location.href = 'DatePage.jsp?year=' + headerYear + "&month=" + headerMonth + "&date=" + headerDate + "&grade=" + 2;
            } else {
                location.href = 'DatePage.jsp?year=' + headerYear + "&month=" + headerMonth + "&date=" + headerDate + "&grade=" + 1;
            }
        }
    }
    if (headerGrade == 2){
        createForthButtons.style.background = "red";
    }
    
};

headerBtnDisplay();


