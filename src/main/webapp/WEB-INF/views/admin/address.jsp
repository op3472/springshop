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

		function Check(){

			var address = document.getElementById("address").value;
			var name = document.getElementById("name").value;

			if (!name) {
				alert("�ù�縦 �Է����� �ʾҽ��ϴ�.");
				return false;
			} 
			if(!address) {
				alert("������ȣ�� �Է����� �ʾҽ��ϴ�.")
				return false;
			}
		}
		
		</script>
</head>
<body>

<div id="wrap">
	<br>
	<p><font size="4" color="gray">��������Է�</font></p>
	<hr size="1" width="460">
	<br>
	<div id="chk">
	<form id="checkForm" action="${pageContext.request.contextPath}/admin/deliinsert.do" method="post" onsubmit="return Check()">
			<label for="name">�ù��:</label><input type="text" name="name" id="name"></br>
			</br>
			<label for="tele">������ȣ:</label><input type="text" name="address" id="address">			
			<input type="hidden" name="num" value="${num}">
		<div id="msg"></div>
		<br>
		
		<input id="useBtn" type="submit" value="����ϱ�">
		<input id="cancelBtn" type="button" value="���" onclick="window.close()">
	</form>
	</div>
	
</div>	
</body>
</html>