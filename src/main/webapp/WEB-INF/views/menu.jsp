<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/join.js"></script>
  
<title>Insert title here</title>

<script type="text/javascript">
function popupOpen(){

	var popUrl = "member/write.do";

	var popOption = "top=200 ,left=500,width=450, height=360, resizable=yes, scrollbars=yes, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"",popOption);
}
function checklogin()
{
	var form = document.loginform;
	if(!form.userId.value){
		alert("아이디를 입력하세요.");
		return false;
	}
	if(!form.userPw.value){
		alert("비밀번호를 입력하세요.");
		return false;
	}
}
$(function(){
    $("ul.sub").hide();
	 $("ul.menu li").hover(function(){
	    $("ul:not(:animated)",this).slideDown("fast");
		},
		function(){"WebContent/joinForm.jsp"
		   $("ul",this).slideUp("fast");
		});
 });
</script>
<%
	String id= (String)session.getAttribute("id");
	%>
	
</head>
<body>
	<% if(id==null){ %>
	<div class="member">
		
		<div class="member2">
		<form name="loginform" action="${pageContext.request.contextPath}/login.do" method="post" onsubmit="return checklogin()"> 
		<label for="username">아이디</label></th>
		<input type="text" name="userId" id="username"  maxlength="15" />
		<label for="userpass">비밀번호</label></th>
		<input type="password" name="userPw" id="userpass"  maxlength="15" />
		<input type="submit" value="로그인">
	    <input type="button" value="회원가입"  onclick="popupOpen()" >

		</form>
		</div>
		</div>
	<%}else{ %>
		<div class="member">
	
		<div class="member2">
		
		<form action="${pageContext.request.contextPath}/logout.do" method="post"> 
		<%= id%>님 환영합니다.
		<input type="submit" value="로그아웃">
		</form>
		</div>
		<div class="member3">
		<a href="${pageContext.request.contextPath}/cart/list.do" ><img class="myinfo" src="${pageContext.request.contextPath}/resources/images/cart.PNG"/></a>
		<a href="${pageContext.request.contextPath}/myinfo.do" ><img class="myinfo" src="${pageContext.request.contextPath}/resources/images/myinfo.PNG"/></a>
		
		</div>
		</div>
	<%}%>
		<div class="menu">
	
		 <ul class="menu">
		 <li class="logo"><a href="${pageContext.request.contextPath}/home.do">Hoseo</a></li>
       <li class="menu2" ><a class="menu3" href="#">운동화</a>
	     <ul class="sub">
		    <li><a href="${pageContext.request.contextPath}/list.do?num=1&page=1">나이키</a></li>
			<li><a href="${pageContext.request.contextPath}/list.do?num=2&page=1">아디다스</a></li>
			<li><a href="${pageContext.request.contextPath}/list.do?num=3&page=1">퓨마</a></li>
		 </ul>
		 </li>
	    <li class="menu2" ><a class="menu3" href="#">상의</a>
	    <ul class="sub">
		    <li><a href="#">티셔츠</a></li>
			<li><a href="#">아우터</a></li>
			<li><a href="#">셔츠</a></li>
		</ul>
		</li>
		<li class="menu2"><a class="menu3" href="#">하의</a>
	    <ul class="sub">
		    <li><a href="#">청바지</a></li>
			<li><a href="#">면바지</a></li>
			<li><a href="#">반바지</a></li>
		</ul>
		</li>
		<li class="menu2"><a class="menu3" href="#">게시판</a>
	    <ul class="sub">
		    <li><a href="${pageContext.request.contextPath}/boardlist.do?page=1">공지사항</a></li>
			<li><a href="${pageContext.request.contextPath}/qaboardlist.do?page=1">Q&A게시판</a></li>
		</ul>
		</li>
		
   </ul>
		</div>
</body>
</html>