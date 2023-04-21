<!-- board.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
    th{background-color: #ccc;}
    th, td{text-align: center;}
</style>
<script>
    'use strict';

    function loginCheck(){
        let mid = loginForm.mid.value;
        let pwd = document.getElementById("mid").value.trim();
        if(mid == ""){
            alert("아이디를 입력하세요");
            loginForm.mid.focus()
        }
        else if(pwd == ""){
            alert("비밀번호를 입력하세요");
            document.getElementById("pwd").focus()
        }
        else{
            loginForm.submit();
            
        }
    }
</script>
<p><br/><p>
<hr/>
<form id="loginForm" method="post" action="<%=request.getContextPath()%>/0421/Loginok">
    <table class="table table-border" style="width:500px;height:250px;" align="center">
        <tr>
            <th colspan="2" class="text-center">
                <h2>회원 로그인</h2>
            </th>
        </tr>
        <tr>
            <th>아이디</th>
            <td><input type="text" id="mid" name="mid" class="form-control" value="admin" autofocus></td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td><input type="password" id="pwd" name="pwd" value="1234" class="form-control"></td>
        </tr>
        <tr>
            <th colspan="2" class="text-center">
                <input type="button" value="login" onclick="loginCheck()" class="btn btn-success"/>
                <input type="reset" value="다시입력" class="btn btn-warning"/>
                <input type="button" value="홈으로" onclick="location.href='main.jsp';" class="btn btn-warning"/>
            </th>
        </tr>
    </table>

</form>