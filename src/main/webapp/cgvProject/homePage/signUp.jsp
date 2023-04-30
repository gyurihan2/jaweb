<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/cgvProject/publicPage/topMenu.jsp"/>
<jsp:include page="/cgvProject/homePage/signScript.jsp"/>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<jsp:include page="/include/bs4.jsp" />
	<style>
        .top_title{
            width:1140px;
        }
        input[type="number"]::-webkit-outer-spin-button,
        input[type="number"]::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
    </style>
</head>
<body>
   <div class="container-fluid ">
        <div class="row justify-content-md-center"><div class="col"><hr style="margin: 0;"/></div></div>
        <div class="row">
            <div class="col-2"></div>
            <div class="col-8">
                <div class="container-xl top_title" >
                    <div class="row">
                        <h2 class="text-secondary mb-5 mt-5">회 원 가 입</h2>
                    </div>
                    <form name="signForm" id="signForm" action="${ctp}/cgvProject/signService">
                        <div class="row text-muted ">  <!-- text-mute 폰트 색상 -->
                            <!-- 아이디 입력 -->
                            <div class="col-1"></div>
                            <div class="col-2 text-right align-self-center font-weight-bold"><span>* 아이디</span></div>
                            <div class="col-2.5 pl-2"><input type="text" class="form-control" name="mid" id="mid" autofocus placeholder="아이디를 입력하세요" /></div>
                            <div class="col-1.5 ml-1" ><button type="button" class="btn btn-outline-info" onclick="chkMid()" style="border-radius: 30px;">ID중복확인</button></div>
                            <div class="col align-self-end"><span class="fw-normal" id="regMid">* 영문자, 숫자, _ 만 사용가능합니다.</span></div>
                            <div class="col-2"><div></div></div>
                        </div>
                        <div class="row text-muted mt-2">
                            <!-- 비밀번호 입력 -->
                            <div class="col-1"></div>
                            <div class="col-2 text-right align-self-center font-weight-bold pl-3"><span>* 비밀번호</span></div>
                            <div class="col-2.5 pl-2"><input type="password" class="form-control" name="pwd" id="pwd1" placeholder="비밀번호를 입력하세요" /></div>
                            <div class="col align-self-end"><span class="fw-normal" id="regPwd">* 비밀번호 최소 5자 이상 특수문자 1개이상</span></div>
                            <div class="col-1"><div></div></div>
                        </div>
                        <div class="row text-muted mt-2">
                            <!-- 비밀번호 확인 -->
                            <div class="col-1"></div>
                            <div class="col-2 text-right align-self-center font-weight-bold pl-3"><span>* 비밀번호 확인</span></div>
                            <div class="col-2.5 pl-2"><input type="password" class="form-control" name="pwd" id="pwd2" placeholder="비밀번호를 입력하세요" /></div>
                            <div class="col align-self-end"><span class="fw-normal" id="chkPwd"></span></div>
                            <div class="col-3"><div></div></div>
                        </div>
                        <div class="row text-muted mt-2">
                            <!-- 이름 입력 -->
                            <div class="col-1"></div>
                            <div class="col-2 text-right align-self-center font-weight-bold pl-3"><span>* 이름</span></div>
                            <div class="col-2.5 pl-2"><input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력하세요" /></div>
                            <div class="col align-self-end"><span class="fw-normal" id="chkPwd"></span></div>
                            <div class="col-3"><div></div></div>
                        </div>
                        <div class="row text-muted mt-2">
                            <!-- 주민번호 입력 -->
                            <div class="col-1"></div>
                            <div class="col-2 text-right align-self-center font-weight-bold pl-3"><span>* 주민번호</span></div>
                            <div class="col-2 pl-2"><input type="number" class="form-control" name="identiNum" id="identiNumFront" maxlength="6" oninput="numberMaxLength(this)"/></div>
                            <div class="col-0.5 pr-2 font-weight-bold">-</div>
                            <div class="col-2 pl-2"><input type="password" class="form-control" name="identiNum" id="identiNumBack" maxlength="7"/></div>
                            <div class="col align-self-end"><span class="fw-normal" id="resIdenti"></span></div>
                            <div class="col-2"><div></div></div>
                        </div>
                        <div class="row text-muted mt-2">
                            <!-- 이메일 입력 -->
                            <div class="col-1"></div>
                            <div class="col-2 text-right align-self-center font-weight-bold pl-3"><span>이메일</span></div>
                            <div class="col-3 pl-2"><input type="text" class="form-control" name="email" id="email" /></div>
                            <div class="col align-self-end"><span class="fw-normal" id="regEmail"></span></div>
                            <div class="col-2"><div></div></div>
                        </div>
                        <div class="row text-muted mt-2">
                            <!-- 연락처 입력 -->
                            <div class="col-1"></div>
                            <div class="col-2 text-right align-self-center font-weight-bold pl-3"><span>연락처</span></div>
                            <div class="col-1 pl-2"><input type="number" class="form-control" name="phone" id="phoneFront" maxlength="3" oninput="numberMaxLength(this)"/></div>
                            <div class="col-0.5 pr-2 font-weight-bold">-</div>
                            <div class="col-1 pl-2"><input type="number" class="form-control" name="phone" id="phoneCenter"  maxlength="4" oninput="numberMaxLength(this)"/></div>
                            <div class="col-0.5 pr-2 font-weight-bold">-</div>
                            <div class="col-1 pl-2"><input type="number" class="form-control" name="phone" id="phoneBack"  maxlength="4" oninput="numberMaxLength(this)"/></div>
                            <div class="col align-self-end"><span class="fw-normal" id="regPhone"></span></div>
                            <div class="col-2"><div></div></div>
                        </div>
                        <div class="row text-muted mt-2">
                            <!-- 주소 입력 -->
                            <div class="col-1"></div>
                            <div class="col-2 text-right align-self-center font-weight-bold pl-3"><span>주소</span></div>
                            <div class="col-3 pl-2"><input type="text" class="form-control" name="address" id="address" /></div>
                            <div class="col align-self-end"><span class="fw-normal" id="regaddress"></span></div>
                            <div class="col-3"><div></div></div>
                        </div>
                        <div class="row text-muted mt-5">
                            <div class="col-4"></div>
                            <div class="col"><button type="button" class="btn btn-outline-primary btn-lg" onclick="signSubmit()">회원가입</button></div>
                            <div class="col"><button type="reset" class="btn btn-outline-danger btn-lg">취소</button></div>
                            <div class="col-4"></div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-2"></div>
        </div>
    </div>
</body>
</html>