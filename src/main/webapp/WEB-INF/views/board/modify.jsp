<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <head>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member.css" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<script type="text/javascript">
	function checkValue2()
		{
			var form = document.boardform;
		
			if(!form.board_subject.value){
				alert("제목을 입력하세요.");
				return false;
			}
			
		
			
			if(!form.board_content.value){
				alert("내용을 입력하세요.");
				return false;
			}
		}
	</script>
	
 </head>

 <body>
  	<div class="wrap">
  		<c:choose>
  		<c:when test="${id eq 'admin'}">
  		<jsp:include page="/WEB-INF/views/admin/menu.jsp" flush="false"/>
  		</c:when>
  		<c:otherwise>
	  <jsp:include page="/WEB-INF/views/menu.jsp" flush="false"/>
	  </c:otherwise>
	  </c:choose>
		<div class="content">
<div class="boarddiv">
<form  name="boardform" action="${pageContext.request.contextPath}/boardmodifygo.do" method="post"  onsubmit="return checkValue2()"> 
<input type="hidden" name="board_id" value="${id}"> 
<input type="hidden" name="board_num" value="${vo.board_num}">
<table class="board" cellpadding="0" cellspacing="0">  
    <tr> 
        <th> 
            <div align="center">글쓴이</div> 
        </th> 
        <td> 
            ${id}
        </td> 
    </tr> 
        <tr> 
        <th> 
            <div align="center">제 목</div> 
        </th> 
        <td> 
            <input name="board_subject" type="text" size="50" maxlength="100" value="${vo.board_subject}"/> 
        </td>         
    </tr> 
    <tr> 
        <th> 
            <div align="center">내 용</div> 
        </th> 
        <td> 
            <textarea name="board_content" cols="67" rows="15" >${vo.board_content}</textarea>             
        </td>         
    </tr> 
     
    <tr bgcolor="cccccc"> 
        <td colspan="2" style="height:1px;"></td> 
    </tr> 
     
    <tr><td colspan="2">&nbsp;</td></tr> 
    <tr align="center" valign="middle"> 
        <td class="boardselect" colspan="5"> 
           	<input type="image" src="${pageContext.request.contextPath}/resources/images/btn_e.jpg"/>&nbsp;&nbsp;
            <a href="javascript:history.go(-1)"><img src="${pageContext.request.contextPath}/resources/images/btn_cancel.gif"></a>            
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