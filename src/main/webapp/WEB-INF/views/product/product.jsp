<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
 <head>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout.css" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

 </head>

 <body>
  	<div class="wrap">
	  <jsp:include page="/WEB-INF/views/menu.jsp" flush="false"/>
		<div class="content">
		<div class="product">
		 <c:forEach var="row" items="${list}">
		<table class="productlist">
      	<tr>
           <td>
                <a href="${pageContext.request.contextPath}/product/detail/${row.productId}">
                    <img src="${pageContext.request.contextPath}/resources/shopimages/${row.productUrl}" width="200ox" height="150px">
                </a>
            </td>
        </tr>
        <tr>
           <td>
                <a href="${pageContext.request.contextPath}/product/detail/${row.productId}">${row.productName}</a>
            </td>
         </tr>
         <tr>
         	<td>
                <fmt:formatNumber value="${row.productPrice}" pattern="###,###,###"/>
            </td>
         </tr>
        </table>
        </c:forEach>
    	</div>
    	  <div class="select">
   <c:if test="${page>1}">
			<a href="${pageContext.request.contextPath}/list.do?num=${num}&page=${page-1}">이전</a>
		</c:if>
		<c:forEach var="pno" begin="${startpage}" end="${endpage}">
		<c:choose>
        <c:when test="${pno==page}">
            <a href="${pageContext.request.contextPath}/list.do?num=${num}&page=${pno}"><strong>${pno}</strong></a>
       </c:when>
        <c:otherwise>
       		<a href="${pageContext.request.contextPath}/list.do?num=${num}&page=${pno}">${pno}</a>
        </c:otherwise>
    </c:choose>
		</c:forEach>
		<c:if test="${page<maxpage}">
			<a href="${pageContext.request.contextPath}/list.do?num=${num}&page=${page+1}" class="direction">다음</a>
		</c:if>
    </div>
		</div>
		<div class="footer">
		copyright-2017- email:rain_pero@naver.com
		</div>
	</div>
 </body>
</html>