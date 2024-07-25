
// 헤더 태그 추가
const createHeaderTag = document.createElement("header")
createHeaderTag.setAttribute("id", "Main_Header")

let bodyTag = document.querySelector("body");


bodyTag.prepend(createHeaderTag)


// 전체 헤더 생성
var headerTag = document.getElementById("Main_Header")

const createHeaderDiv = document.createElement("div");

createHeaderDiv.setAttribute("id","Header_Container_Div");

headerTag.appendChild(createHeaderDiv)

var getHeader = document.getElementById("Header_Container_Div")

getHeader.style.cssText = 
`
width: 100%;
height: 100px;
background-color: tomato;
border-radius: 7px;
display: flex;
`;

// console.log(getHeader)


// 좌측 홈 로고 버튼 생성

const createLogoDiv = document.createElement("div");

createLogoDiv.setAttribute("id","Header_Logo_Div");

getHeader.appendChild(createLogoDiv)

var getLogoHeader = document.getElementById("Header_Logo_Div")

getLogoHeader.style.cssText = 
`
width: 50%;
height: 100%;
`;

// console.log(getLogoHeader)

// 좌측 임시 로고 버튼 생성

const createLogoButton = document.createElement("button")

createLogoButton.setAttribute("id", "Header_Logo_Btn")

createLogoButton.innerHTML = "로고"
createLogoButton.style.cssText = 
`
width: 100px;
height: 100%;
border-radius: 7px;
background-color: beige;
`

getLogoHeader.appendChild(createLogoButton)

// 우측 Div 생성

const createButtonsDiv = document.createElement("div")

createButtonsDiv.setAttribute("id", "Header_Btn_Div")

createButtonsDiv.style.cssText = 
`
width: 50%;
height: 100%;
border-radius: 7px;
display: flex;
flex-direction: row-reverse;
`
getHeader.appendChild(createButtonsDiv)

console.log(window.location.pathname)



// 첫번째 버튼 추가

const createFirstButtons = document.createElement("input")

createFirstButtons.setAttribute("id", "Header_BtnStyle_Btn")


createFirstButtons.type = "button"


createFirstButtons.style.cssText = 
`
width: 100px;
height: 50%;
margin-top: 20px;
margin-right: 3%;
border-radius: 7px;
background-color: gray;
color: white;
`


createButtonsDiv.appendChild(createFirstButtons)

// 두번째 버튼 추가

const createSecondButtons = document.createElement("input")

createSecondButtons.setAttribute("id", "Header_BtnStyle_Btn")


createSecondButtons.type = "button"
createSecondButtons.style.cssText = 
`
width: 100px;
height: 50%;
margin-top: 20px;
margin-right: 3%;
border-radius: 7px;
background-color: gray;
color: white;
`

createButtonsDiv.appendChild(createSecondButtons)

// 세번째 버튼 추가

const createThirdButtons = document.createElement("input")

createThirdButtons.setAttribute("id", "Header_BtnStyle_Btn")


createThirdButtons.type = "button"
createThirdButtons.style.cssText = 
`
width: 100px;
height: 50%;
margin-top: 20px;
margin-right: 3%;
border-radius: 7px;
background-color: gray;
color: white;
`


createButtonsDiv.appendChild(createThirdButtons)


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
    createThirdButtons.style.display = "none";

    createFirstButtons.value = "로그아웃"
    createSecondButtons.value = "마이페이지"

    createSecondButtons.onclick = function () {
        window.location.href= 'MyPage.jsp'
    }

    createLogoButton.onclick = function () {
        console.log(createLogoButton)
        window.location.href= 'SchedulePage.jsp'
    }
    
    // 일일 페이지

} else if (window.location.pathname == "/scheduler/DatePage.jsp"
    || window.location.pathname == "/scheduler/MyPage.jsp"){
    createThirdButtons.style.display = "none";

    createFirstButtons.value = "로그아웃"
    createSecondButtons.value = "HOME"

    createSecondButtons.onclick = function () {
        window.location.href= 'SchedulePage.jsp'
    }



    createLogoButton.onclick = function () {
        console.log(createLogoButton)
        window.location.href= 'SchedulePage.jsp'
    }

    }
};


headerBtnDisplay();