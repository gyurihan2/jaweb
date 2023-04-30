<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>

</style>
<script>
'use strict';
function chkReg(str, reg) {
    return reg.test(str);
}

function signSubmit(){
    let statusPwd = chkPwd();
    let statusIdentifiaction = chkIdentifiaction();
    let statusEmail = chkEmail();
    let statusPhone = chkPhone();

    if(statusPwd && statusIdentifiaction && statusEmail &&statusPhone) signForm.submit();
}

function numberMaxLength(e){
    if(e.value.length > e.maxLength) e.value = e.value.slice(0, e.maxLength);
}

function chkMid(){
    const regExp = /^[\w]{5,19}$/g; //영어 대/소문자, 숫자, '_' 입력 가능
    let mid = document.getElementById("mid").value;
    let status=document.getElementById("regMid");
   
    if(!regExp.test(mid)){
        status.style.color="red";
        status.style.fontWeight="bold";
        status.innerText="사용 불가합니다.(최소5~15문자(영문자, 숫자, '_'))";
    }
    else{
        status.innerText="사용 가능합니다.";
        status.style.color="green";
        status.style.fontWeight="bold";
    }
}
function chkPwd(){
    const regExp =  /^(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{5,20}/g;
    let pwd = document.getElementsByName("pwd");
    let pwd1 = pwd[0].value;
    let pwd2 = pwd[1].value;
    let status1=document.getElementById("regPwd");
    let status2=document.getElementById("chkPwd");
   
    if(!regExp.test(pwd1)){
        status1.style.color="red";
        status1.style.fontWeight="bold";
        status1.innerText="사용 불가합니다.(최소5~15문자(특수문자 1개 이상, 5~20문자))";
        status1.focus();
        return false;
    }
    else if(pwd1 != pwd2){
        status2.style.color="red";
        status2.style.fontWeight="bold";
        status2.innerText="패스워드가 일치하지 않습니다.";
        status2.focus();
        return false;
    }
    
    status1.innerText="";
    status2.innerText="";
    return true;
   
}
function chkIdentifiaction(){
    const regExp = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/g;
    let identify = document.getElementsByName("identiNum");
    let sumIdentify = identify[0].value +"-" +identify[1].value;
    let status=document.getElementById("resIdenti");
   
    if(!regExp.test(sumIdentify)){
        status.style.color="red";
        status.style.fontWeight="bold";
        status.innerText="주민번호를 확인하세요";
        identify[0].focus();
        return false;
    }
    else{
        status.innerText="";
        return true;
    }
}
function chkEmail(){
    const regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    let email = document.getElementById("email").value;
    let status=document.getElementById("regEmail");
   
    if(!regExp.test(email)){
        status.style.color="red";
        status.style.fontWeight="bold";
        status.innerText="이메일 형식을 확인하세요";
        email.focus();
        return false;
    }
    else{
        status.innerText="";
        return true;
    }
}
function chkPhone(){
    const regExp = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$/;
    let phone = document.getElementsByName("phone");
    console.log(typeof(phone));
    console.log(phone[0].value)
    let sumPhone = phone[0].value+"-"+phone[1].value+"-"+phone[2].value;
    let status=document.getElementById("regPhone");
   
    if(!regExp.test(sumPhone)){
        status.style.color="red";
        status.style.fontWeight="bold";
        status.innerText="핸드폰번호를 확인하세요";
        phone[0].focus();
        return false;
    }
    else{
        status.innerText="";
        return true;
    }
}
</script>