<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="side">
		</br>
		</br>
		<a href="${pageContext.request.contextPath}/cart/order/list.do?page=1">주문내역</a></br>
		<a href="${pageContext.request.contextPath}/cart/list.do">장바구니</a></br>
		<a href="${pageContext.request.contextPath}/info.do">내정보수정</a></br>
		<a href="${pageContext.request.contextPath}/memberdeleteform.do">회원탈퇴</a></br>
		
</div>
</body>
</html>