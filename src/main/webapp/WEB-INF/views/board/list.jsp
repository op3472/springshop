<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <head>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member.css" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

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
	<table class="board2" width=700 border="0" cellpadding="0" cellspacing="0"> 
    			<tr align="center" valign="middle" bgcolor = "FAFAFA"> 
        			<td align=right> Total : ${listcount}</td> 
        		</tr>
   				  
    </table>
   	<table class="board" width=700 border="0" cellpadding="0" cellspacing="0"> 
    <tr align="center" valign="middle" > 
        <th width="400"> 
            <div align="center"> 제목</div> 
        </th> 
        <th> 
            <div align="center"> 작성자</div> 
        </th> 
        <th> 
            <div align="center"> 날짜</div> 
        </th> 
        <th> 
            <div align="center"> 조회수</div> 
        </th>                 
    </tr>     
    <tr height="2" bgcolor="#e5e5e5"><td colspan="5"></td></tr>


    <c:forEach var="row" items="${list}">
    <tr align="center" valign="middle" > 
 
        <td> 
            <div align="left"> 
            <c:if test="${row.board_re_lev>0}">  
                <c:forEach var="a" begin="0" end="${row.board_re_lev*2}"> 
                    &nbsp;
                </c:forEach>
                    <img src="${pageContext.request.contextPath}/resources/images/reply_icon.gif">
          	</c:if>
            <a href="${pageContext.request.contextPath}/boardDetail/${row.board_num}">${row.board_subject}</a></div>                
        </td>         
        <td> 
            <div align="center">관리자</div> 
        </td> 
        <td> 
        	  <div align="center"><fmt:formatDate value="${row.board_date}"  pattern="yyyy.MM.dd"/></div> 
           
        </td> 
        <td> 
            <div align="center">${row.board_readcount}</div> 
        </td> 
    </tr> 
    <tr height="1" bgcolor="#e5e5e5"><td colspan="5"></td></tr>
    </c:forEach>
    <tr height="1" bgcolor="#e5e5e5"><td colspan="5"></td></tr>
	<tr>
	<td colspan="5">
	<div class="pagination">
         <c:if test="${page>1}">
			<a href="${pageContext.request.contextPath}/boardlist.do?page=${page-1}">이전</a>
		</c:if>
		<c:forEach var="pno" begin="${startpage}" end="${endpage}">
		<c:choose>
        <c:when test="${pno==page}">
            <a href="${pageContext.request.contextPath}/boardlist.do?page=${pno}"><strong>${pno}</strong></a>
       </c:when>
        <c:otherwise>
       		<a href="${pageContext.request.contextPath}/boardlist.do?page=${pno}">${pno}</a>
        </c:otherwise>
    </c:choose>
		</c:forEach>
		<c:if test="${page<maxpage}">
			<a href="${pageContext.request.contextPath}/boardlist.do?page=${page+1}" class="direction">다음</a>
		</c:if>
    </div>
	</td>
	</tr>
	<c:if test="${id eq 'admin'}">
	 <tr align="right"> 
        <td class="write" colspan="5"> 
     		<a href="${pageContext.request.contextPath}/boardwrite.do"><img src="${pageContext.request.contextPath}/resources/images/btn_m.jpg"></td></a>
        	
    </tr> 
    </c:if>
</table>
		</div>
		<div class="footer">
		copyright-2017- email:rain_pero@naver.com
		</div>
	</div>
 </body>
</html>