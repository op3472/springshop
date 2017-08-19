<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
 <head>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/product.css" />
  
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
    $("#btnAdd2").click(function(){
        location.href="${pageContext.request.contextPath}/admin/bannerwrite.do";
    });
});

</script>
 </head>

 <body>
  	<div class="wrap">
	  <jsp:include page="/WEB-INF/views/admin/menu.jsp" flush="false"/>
		<div class="content">
    <button type="button" id="btnAdd2">배너등록</button><br>
	<div class="list5">
    <c:forEach var="row" items="${list}">
    <table class="list3">
    <tr>
        <td width="300" height="150">
            <img src="${pageContext.request.contextPath}/resources/bannerimage/${row.banner_url}"  width="300" height="150">
        </td>
     </tr>
     <tr>
      <td align="center">
           <a href="${pageContext.request.contextPath}/admin/banneredit/${row.banner_num}">[배너편집]</a>
        </td>
     </tr>
    </table>   
    </c:forEach>
    </div>
    <div class="select">
   <c:if test="${page>1}">
			<a href="${pageContext.request.contextPath}/admin/banner.do?page=${page-1}">이전</a>
		</c:if>
		<c:forEach var="pno" begin="${startpage}" end="${endpage}">
		<c:choose>
        <c:when test="${pno==page}">
            <a href="${pageContext.request.contextPath}/admin/banner.do?page=${pno}"><strong>${pno}</strong></a>
       </c:when>
        <c:otherwise>
       		<a href="${pageContext.request.contextPath}/admin/banner.do?page=${pno}">${pno}</a>
        </c:otherwise>
    </c:choose>
		</c:forEach>
		<c:if test="${page<maxpage}">
			<a href="${pageContext.request.contextPath}/admin/banner.do?page=${page+1}" class="direction">다음</a>
		</c:if>
    </div>
		</div>
		</div>
		<div class="footer">
		copyright-2017- email:rain_pero@naver.com
		</div>
	</div>
 </body>
</html>