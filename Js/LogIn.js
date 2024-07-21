
var inputId = document.getElementById("Index_Input_Id");
var inputPw = document.getElementById("Index_Input_Pw");
var loginBtn = document.getElementById("Index_Button_LogIn");

loginBtn.disabled = true; 

inputId.onfocus = function(e) {
    inputId.placeholder = "";
}

inputPw.onfocus = function(e) {
    inputPw.placeholder = "";
}

inputId.onblur = function(e) {

    if (inputId.value === ''){
        inputId.style.borderColor = "red"
        inputId.placeholder = "아이디를 입력해주세요!"
        loginBtn.disabled = true; 
    } else if (inputPw.value) {
        loginBtn.disabled = false;
        inputId.style.borderColor = "black" 
    } else {
            inputId.style.borderColor = "black"
            loginBtn.disabled = true;
    }
}

inputPw.onblur = function(e) {

    if(inputPw.value.length < 4){
        inputPw.value = ""
        inputPw.style.borderColor = "red"
        inputPw.placeholder = "4글자 이상 입력해주세요!"
        loginBtn.disabled = true; 
    } else {
        inputPw.style.borderColor = "black"
    }

    if (inputPw.value === ''){
        inputPw.style.borderColor = "red"
        inputPw.placeholder = "비밀번호를 입력해주세요!"
        loginBtn.disabled = true; 
    } else if (inputId.value === '') {
        loginBtn.disabled = true;
    } else {
        loginBtn.disabled = false; 
    }


}


