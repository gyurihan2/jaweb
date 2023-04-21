<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
    <script>
        let idx=0;
        let newText="";
        

      
        jQuery(function(){
	        $("#test").on("click",function(){
	        	fCheck();
	        });
	        
        });

        //박스추가버튼을 클릭 할때마다 입력폼 동적 추가: 각 TextField마다 고유한 idx를 지정해야한다.
        function inputBox(){
            newText="";
            idx++;
           
            newText +="<div id='proText"+idx+"'>";
            newText +="<table class='table' width='100%'>";
            newText +="<tr>";
            newText +="<td><input type='text' name='product' id='product"+idx+"'/></td>";
            newText +="<td><input type='text' name='price' id='price"+idx+"'/></td>";
            newText +="<td><input type='text' name='su' id='su"+idx+"'/></td>";
            newText +="<td><input type='hidden' name='idx' value='"+idx+"'/></td>";
            newText +="<td><input type='button' value='삭제' onclick='deleteBox("+idx+")' class='btn btn-warning'/></td>";
            newText +="</tr>";
            newText +="</table>";
            newText +="</div>";

            demo.innerHTML += newText;
        }

        function reloadCheck(){
            idx="";
            location.reload();
        }

        function deleteBox(idx){
            let proText= "proText"+idx;
            let item = document.getElementById(proText);
/*             item.parentNode.remove(item); */
            item.remove(item);
        }
	
        
        //상품 등록하기 전에 기본적인 사항을 체크하고 값을 서버로 전송
	        function fCheck(){
	            let name = document.getElementById("name");
	            let part = document.getElementById("part");
	
	            let products = document.getElementsByName("product");
	            let prices = document.getElementsByName("price");
	            let sus = document.getElementsByName("su");
	            let idxChk = document.getElementsByName("idx");
	         
	            if(name.value.trim() == ""){ 
	                alert("상품 등록자 성명을 입력하세요!");
	                name.focus();
	                return false;
	            }
	            else if(part.value == ""){
	                alert("상품 분류 선택하세요!");
	                part.focus();
	                return false;
	            }
	            console.log("상품 갯수"+products.length);
	            
	            for(let i=0; i<idxChk.length;i++){
	            	console.log(idxChk[i].value);
	            }
	            
	            for(let i=0; i<products.length;i++){
	            	console.log(i+"번째");
	            	console.log(idxChk[i].value);
	            	console.log("------------------------------------------------------------------");
					console.log("상품명"+products[i].value +"    가격:"+prices[i].value+"     수:"+sus[i].value+"     IDX:"+idxChk[i].value);
		            console.log("------------------------------------------------------------------");
		            
	                
		            if(products[i].value == ""){
	                    alert("상품명을 입력하세요");
	                    products[i].focus();
	                    return false;
	                }
	                else if(prices[i].value==""){
	                    alert("가격을 입력하세요");
	                    prices[i].focus();
	                    return false;
	                }
	                else if(sus[i].value==""){
	                    alert("수량을 입력하세요");
	                    sus[i].focus();
	                    return false;
	                }
	            }
	            myform.submit();
	        }
    </script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>판매 상품 등록</h2>
    <form name="myform" method="post" action="${pageContext.request.contextPath}/0420/test07ok">
        <p>상품등록:
            <input type="text" name="name" id="name" autofocus required class="form-control" value="홍길동"/>
        </p>
        <p>상품분류:
            <select name="part" id="part" class="form-control">
                <option>상품을 선택하세요</option>
                <option>의류</option>
                <option>가구류</option>
                <option>신발</option>
                <option selected>생활용품</option>
            </select>
        </p>
        <hr/>
        <p>
            <input type="button" value="입력창추가" onclick="inputBox()" class="btn btn-primary"/>
            <input type="button" value="입력창 모두 제거" onclick="reloadCheck()" class="btn btn-danger"/>
        </p>
        <table class="table table-borderless">
            <tr class="text-center">
                <th>상품명</th>
                <th>가격</th>
                <th>수량</th>
                <th>비고</th>
            </tr>
            <tr>
                <td colspan="4" class="text-center">
                    <table class="table">
                        <tr>
                            <td><input type="text" name="product" id="product0" value="냉장고"/></td>
                            <td><input type="number" name="price" id="price0" value="50000"/></td>
                            <td><input type="number" name="su" id="su0" value="1"/></td>
                            <td><input type="hidden" name="idx" value="0"/></td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        </tr>
                    </table>
                    <div id="demo"></div>
                </td>
            </tr>
        </table>
        <p><input type="button" value="상품가격 계산" id="test" class="btn btn-success form-control"/></p>
    </form>
</div>
<p><br/></p>
</body>
</html>