<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member.css" />
  <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/join.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
function openIdChk(){
		window.name = "parentForm";
		window.open("IdCheckForm.do","chkForm","top=200 ,left=500 width=500, height=300, resizable=no, scrollbars=no");
		}

</script>
 </head>
 <body>
	  <form name="joinform" method="post" action="insert.do" onsubmit="return checkValue()">
        <table border="0" width="400px" cellspacing="0" cellpadding="0" class="joinData">
            <tr>
                <th><label for="id">아이디</label></th>
                <td><input name="userId" id="id"  maxlength="15" onkeydown="inputIdChk()"class="textBox" >
                <a onclick="openIdChk()"><img src="${pageContext.request.contextPath}/resources/images/btn_id_doubleCheck.gif" alt="id중복확인" /></a>
              	<input type="hidden" name="idDuplication" value="idUncheck" ></td>
            </tr>
            <tr>
                <th><label for="pass">비밀번호</label></th>
                <td><input type="password" name="userPw" id="pass"class="textBox"  ><p>8~15영문숫자조합</p></td>
                
            </tr>
            <tr>
              <th>
              <label for="repassword">패스워드 확인</label></th>
              <td><input type="password" name="repassword" id="repassword" class="textBox"  maxlength="10"/></td>
            </tr>
            <tr>
                <th><label for="name">이름</label></th>
                <td><input name="userName" id="name" class="textBox" ></td>
            </tr>
            <tr>
                <th><label for="email">이메일주소</label></th>
                <td><input name="userEmail" id="email" class="textBox" ></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                   <p class="btn">
                    <input type="submit" class="check" value="회원가입">
                    <input type="button" class="check" onclick="closed()" value="취소">
         	</p>
                </td>
            </tr>
        </table>
     
    </form>
 </body>
</html>
