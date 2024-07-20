var inputName = document.getElementById("Index_Input_Name");
var inputPhone = document.getElementById("Index_Input_PhoneNumber");

var findIdBtn = document.getElementById("Index_Button_FindId");


// 정규표현식

var regKor = /^[가-힣]+$/;

var regPhone = /^\d{2,3}\d{3,4}\d{4}$/;

findIdBtn.disabled = true;

// 이름 예외처리

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
    var checkValue = inputName.value !== "" && regPhone.test(inputPhone.value);

    findIdBtn.disabled = !checkValue;

    // 회원가입 placeholder 에 명시해줄지???
    
    if(checkValue) {
        console.log(0)
    } else {
        console.log(1)
    }
}