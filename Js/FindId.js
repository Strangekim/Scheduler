var inputName = document.getElementById("Index_Input_Name");
var inputPhone = document.getElementById("Index_Input_PhoneNumber");
var findIdBtn = document.getElementById("Index_Button_FindId");

findIdBtn.disabled = true;

// 이름 예외처리
function exceptionalName () {
    inputName.onfocus = function(e) {
        inputName.placeholder = "";
    }

    inputName.onblur = function(e) {

        if (inputName.value === ''){
            inputName.style.borderColor = "red"
            inputName.placeholder = "이름을 입력해주세요!"
        }
        
        if (!regKor.test(inputName.value)){
            inputName.value = "";
            inputName.style.borderColor = "red";
            inputName.placeholder = "한글만 입력해주세요";
        } else {
            inputName.style.borderColor = "black";
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
    var checkValue = regId.test(inputName.value) && regPhone.test(inputPhone.value);
    findIdBtn.disabled = !checkValue;
}

// 아이디 찾기 이벤트
function findIdEvent () {
    location.href = "./Action/FindIdAction.jsp?name=" + inputName.value + "&phonenumber=" + inputPhone.value
}

exceptionalName();
exceptionalPhone();
