
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

console.log(getHeader)


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

console.log(getLogoHeader)

// 좌측 임시 로고 버튼 생성

const createLogoButton = document.createElement("button")

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

createButtonsDiv.style.cssText = 
`
width: 50%;
height: 100%;
border-radius: 7px;
background-color: pink;
`
getHeader.appendChild(createButtonsDiv)

const createButtons = document.createElement("button")