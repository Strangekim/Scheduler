var inputId = document.getElementById("Index_Input_Id");
var inputPhone = document.getElementById("Index_Input_PhoneNumber");

var findIdBtn = document.getElementById("Index_Button_FindId");


// 정규표현식

var regPhone = /^\d{2,3}\d{3,4}\d{4}$/;

findIdBtn.disabled = true;

// 아이디 예외 처리

inputId.onfocus = function(e) {
    inputId.placeholder = "";
}

inputId.onblur = function(e) {

    if (inputId.value === ''){
        inputId.style.borderColor = "red"
        inputId.placeholder = "아이디를 입력해주세요!"
    } else {
            inputId.style.borderColor = "black"
    }

    checkInputValue();
}


// 전화번호 예외 처리

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




function checkInputValue () {
    var checkValue = inputId.value !== "" && regPhone.test(inputPhone.value);

    findIdBtn.disabled = !checkValue;

    // 회원가입 placeholder 에 명시해줄지???
    
    if(checkValue) {
        console.log(0)
    } else {
        console.log(1)
    }
}


function findPwEvent () {
    location.href = "./Action/FindPwAction.jsp?id=" + inputId.value + "&phonenumber=" + inputPhone.value
}