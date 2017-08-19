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
<form  name="boardform" action="${pageContext.request.contextPath}/boardinsert.do" method="post"  onsubmit="return checkValue2()"> 
<input type="hidden" name="board_id" value="${id}"> 

<table class="board" cellpadding="0" cellspacing="0">  
    <tr> 
        <th width="100"> 
            <div align="center">글쓴이</div> 
        </th> 
        <td width="500"> 
            ${vo.board_id }
        </td> 
    </tr> 
     <tr bgcolor="cccccc"> 
        <td colspan="2" style="height:1px;"></td> 
    </tr> 
        <tr> 
        <th> 
            <div align="center">제 목</div> 
        </th> 
        <td> 
            ${vo.board_subject} 
        </td>         
    </tr> 
     <tr bgcolor="cccccc"> 
        <td colspan="2" style="height:1px;"></td> 
    </tr> 
    <tr> 
        <th> 
            <div align="center">내 용</div> 
        </th> 
        <td width="500" height="400"> 
            ${vo.board_content}             
        </td>         
    </tr> 
     
    <tr bgcolor="cccccc"> 
        <td colspan="2" style="height:1px;"></td> 
    </tr> 
     
    <tr><td colspan="2">&nbsp;</td></tr> 
    <tr align="center" valign="middle"> 
        <td class="boardselect" colspan="5"> 
           	    <font size=2> 
           	    <c:if test="${id eq 'admin' }">
           	    <a href="${pageContext.request.contextPath}/qaboardreply.do?num=${vo.board_num}"><img src="${pageContext.request.contextPath}/resources/images/btn_r.png"></a>
           	    </c:if>
           	    <c:if test="${id eq 'admin' || id eq vo.board_id}">
                <a href="${pageContext.request.contextPath}/qaboardmodify.do?num=${vo.board_num}"><img src="${pageContext.request.contextPath}/resources/images/btn_e.jpg"></a>                 
                <a href="${pageContext.request.contextPath}/qaboarddelete.do?num=${vo.board_num}"><img src="${pageContext.request.contextPath}/resources/images/btn_d1.jpg"></a> 
                </c:if>
                <a href="javascript:history.go(-1)"><img src="${pageContext.request.contextPath}/resources/images/btn_l.jpg"></a>                 
            </font> 
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