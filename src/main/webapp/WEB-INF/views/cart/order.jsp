<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
	<style type="text/css">
		#wrap {
			width: 490px;
			text-align :center;
			margin: 0 auto 0 auto;
		}
		
		#chk{
			text-align :center;
		}
		
	

	</style>
	
	<script type="text/javascript">
	
		function idCheck(){

			var address = document.getElementById("address").value;
			var tele = document.getElementById("tele").value;

			if (!address) {
				alert("주소를 입력하지 않았습니다.");
				return false;
			} 
			else if(!tele) {
				alect("전화번호를 입력하지 않았습니다.")
				return false;
			}
			else
			{
				sendCheckValue();
			}
		}
		
		
		// 사용하기 클릭 시 부모창으로 값 전달 
		function sendCheckValue(){
			// 중복체크 결과인 idCheck 값을 전달한다.
			// 회원가입 화면의 ID입력란에 값을 전달
			opener.document.form1.address.value = document.getElementById("address").value;
			opener.document.form1.tele.value = document.getElementById("tele").value;
			
			if (opener != null) {
            	opener.document.form1.action="${pageContext.request.contextPath}/cart/order/insert.do";
            	opener.document.form1.submit();
            	self.close();
			}	
		}
		</script>
</head>
<body>

<div id="wrap">
	<br>
	<p><font size="4" color="gray">주문정보입력</font></p>
	<hr size="1" width="460">
	<br>
	<div id="chk">
	<form id="checkForm">
			  <label for="address">주소 :</label><input type="text" name="address" id="address"></br>
			</br>
			<label for="tele">전화번호:</label><input type="text" name="tele" id="tele">			
	</form>
		<div id="msg"></div>
		<br>
		
		<input id="useBtn" type="button" value="주문하기" onclick="idCheck()">
		<input id="cancelBtn" type="button" value="취소" onclick="window.close()">
	</div>
</div>	
</body>
</html>