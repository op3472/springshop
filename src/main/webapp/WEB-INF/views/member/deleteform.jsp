<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <head>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member.css" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

 </head>

 <body>
  	<div class="wrap">
	  <jsp:include page="/WEB-INF/views/menu.jsp" flush="false"/>
		<div class="content">
		<jsp:include page="/WEB-INF/views/side.jsp" flush="false"/>
		<div class="info">
		  <form name="joinform" method="post" action="delete.do">
        <table border="0" width="400px" cellspacing="0" cellpadding="0" class="joinData">
            <tr>
            	<th colspan="2">비밀번호를 정확히 입력해주세요.</th>
            <tr>
            <tr>
                <th><label for="pass">비밀번호</label></th>
                <td>
                <input type="hidden" name="userId" value="${sessionScope.id}">
                <input type="password" name="userPw" id="pass"class="textBox"  ><p>8~15영문숫자조합</p></td>
            </tr>
         	<tr>
                <td colspan="2" align="center">
                   <p class="btn">
                    <input type="submit" class="check" value="회원탈퇴">
                  
         	</p>
                </td>
            </tr>
        </table>
     
    </form>
	</div>
		</div>
		<div class="footer">
		copyright-2017- email:rain_pero@naver.com
		</div>
	</div>
 </body>
</html>