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
				alert("�ּҸ� �Է����� �ʾҽ��ϴ�.");
				return false;
			} 
			else if(!tele) {
				alect("��ȭ��ȣ�� �Է����� �ʾҽ��ϴ�.")
				return false;
			}
			else
			{
				sendCheckValue();
			}
		}
		
		
		// ����ϱ� Ŭ�� �� �θ�â���� �� ���� 
		function sendCheckValue(){
			// �ߺ�üũ ����� idCheck ���� �����Ѵ�.
			// ȸ������ ȭ���� ID�Է¶��� ���� ����
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
	<p><font size="4" color="gray">�ֹ������Է�</font></p>
	<hr size="1" width="460">
	<br>
	<div id="chk">
	<form id="checkForm">
			  <label for="address">�ּ� :</label><input type="text" name="address" id="address"></br>
			</br>
			<label for="tele">��ȭ��ȣ:</label><input type="text" name="tele" id="tele">			
	</form>
		<div id="msg"></div>
		<br>
		
		<input id="useBtn" type="button" value="�ֹ��ϱ�" onclick="idCheck()">
		<input id="cancelBtn" type="button" value="���" onclick="window.close()">
	</div>
</div>	
</body>
</html>