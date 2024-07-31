var inputId = document.getElementById("Index_Input_Id");
var inputPhone = document.getElementById("Index_Input_PhoneNumber");
var findIdBtn = document.getElementById("Index_Button_FindId");

findIdBtn.disabled = true;

// 아이디 예외 처리
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

// 전화번호 예외 처리
function exceptionalPhone () {
    inputPhone.onfocus = function(e) {
        inputPhone.placeholder = "-없이 숫자만 입력해주세요";
    }

    inputPhone.onblur = function(e) {
        if (!regPhone.test(inputPhone.value)){
            inputPhone.value = "";
            inputPhone.placeholder = "전화번호를 제대로 입력해주세요.";
            inputPhone.style.borderColor = "red"
        } else if (regPhone.test(inputPhone.value)) {
            inputPhone.style.borderColor = "black"
        }

        checkInputValue();
    }
};

// 버튼 활성화
function checkInputValue () {
    var checkValue = regId.test(inputId.value) && regPhone.test(inputPhone.value);
    findIdBtn.disabled = !checkValue;
};

// 비밀번호 찾기 이벤트
function findPwEvent () {
    location.href = "./Action/FindPwAction.jsp?id=" + inputId.value + "&phonenumber=" + inputPhone.value
};

exceptionalId();
exceptionalPhone();