var inputId = document.getElementById("Index_Input_Id");
var inputPw = document.getElementById("Index_Input_Pw");
var inputPwCheck = document.getElementById("Index_Input_Pwcheck");
var inputPhone = document.getElementById("Index_Input_Phonenumber");
var SignInBtn = document.getElementById("Index_Button_SignIn");

// 회원가입 버튼 비활성화

SignInBtn.disabled = true;

function exceptionalId () {
    inputId.onfocus = function(e) {
        inputId.placeholder = "";
    }
    inputId.onblur = function(e) {

        if (!regId.test(inputId.value)){
            inputId.style.borderColor = "red"
            inputId.placeholder = "아이디를 입력해주세요!"
        } else {
                inputId.style.borderColor = "black"
        }
        checkInputValue();
    }
};

// 비밀번호 예외 처리
function exceptionalPw () {
    inputPw.onfocus = function(e) {
        inputPw.placeholder = "";
    }

    inputPwCheck.onfocus = function(e) {
        inputPwCheck.placeholder = "";
    }

    inputPw.onblur = function(e) {
        if(!regPW.test(inputPw.value)){
            inputPw.value = ""
            inputPw.style.borderColor = "red"
            inputPw.placeholder = "4글자 이상 입력해주세요!"
        } else {
            inputPw.style.borderColor = "black"
        }

        if(inputPw.value != inputPwCheck.value){
            inputPwCheck.style.borderColor = "red"
        } else if (inputPw.value == inputPwCheck.value){
            inputPwCheck.style.borderColor = "black"
        }
        checkInputValue();
    }

    inputPwCheck.onblur = function(e) {
        if(inputPw.value != inputPwCheck.value){
        inputPwCheck.style.borderColor = "red"
        } else if (inputPw.value == inputPwCheck.value){
            inputPwCheck.style.borderColor = "black"
        }

        if (inputPwCheck.value === ''){
            inputPwCheck.style.borderColor = "black"
            inputPwCheck.placeholder = "비밀번호 확인"
        }

        checkInputValue();
    }
};

// 전화번호 예외 처리
function exceptionalNumber () {
    inputPhone.onfocus = function(e) {
        inputPhone.placeholder = "-없이 숫자만 입력해주세요";
    }
    inputPhone.onblur = function(e) {
        if (regPhone.test(inputPhone.value) != true){
            inputPhone.value = "";
            inputPhone.placeholder = "전화번호를 제대로 입력해주세요.";
            inputPhone.style.borderColor = "red"
        } else if (regPhone.test(inputPhone.value) == true) {
            inputPhone.style.borderColor = "black"
        }

        checkInputValue();
    }
};

// 조건 검증 및 회원가입 버튼 활성화 함수
function checkInputValue () {
    var checkValue = regId.test(inputId.value) && regPW.test(inputPw.value) && inputPw.value == inputPwCheck.value && regPhone.test(inputPhone.value);
    SignInBtn.disabled = !checkValue;
}

// 정보 수정 이벤트
SignInBtn.onclick = function(e) {
    if (confirm("정말 바꾸시겠습니까?")) {
        const getGrade = document.querySelector("input[name='position']:checked");
        console.log(getGrade)
        var gradeIdx = "";
        var defaultTeam = 1;
    
        if (getGrade.id == "Index_Member_Btn"){
            gradeIdx = 1;
        } else {
            gradeIdx = 2;
        }
        console.log(gradeIdx)
        location.href =  "./Action/ChangeMemberAction.jsp?id=" + inputId.value + "&pw=" + inputPw.value + "&phonenumber=" + inputPhone.value + "&gradeIdx=" + gradeIdx + "&teamIdx=" + defaultTeam
       
    }
}

exceptionalId();
exceptionalPw();
exceptionalNumber();