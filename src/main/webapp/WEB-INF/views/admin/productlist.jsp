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
    $("#btnAdd").click(function(){
        location.href="${pageContext.request.contextPath}/admin/write.do?num=${num}";
    });
});

$(function(){
    $("ul.navsub").hide();
	 $("ul.nav li").hover(function(){
	    $("ul:not(:animated)",this).slideDown("fast");
		},
		function(){"WebContent/joinForm.jsp"
		   $("ul",this).slideUp("fast");
		});
 });
</script>
 </head>

 <body>
  	<div class="wrap">
	  <jsp:include page="/WEB-INF/views/admin/menu.jsp" flush="false"/>
		<div class="content">
		<div class="produ">
		<div class="nav">
		<ul class="nav">
		<li><a href="#">신발</a>
		<ul class="navsub">
			<li><a href="${pageContext.request.contextPath}/admin/list.do?num=1&page=1">나이키</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/list.do?num=2&page=1">아디다스</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/list.do?num=3&page=1">퓨마</a></li>
		</ul>
		</li>
		<li><a href="">상의</a></li>
		<li><a href="">하의</a></li>
		<li><a href="">액세서리</a></li>
		<li><a href=""></a></li>
		</ul>
		</div>
    <button type="button" id="btnAdd">상품등록</button><br>
	<div class="list5">
    <c:forEach var="row" items="${list}">
    <table class="list3">
    <tr><td>
    		${row.productId}
        <td>
            <a href="${pageContext.request.contextPath}/product/detail/${row.productId}">
                <img src="${pageContext.request.contextPath}/resources/shopimages/${row.productUrl}" width="120px" height="110px">
            </a>
        </td>
        <td width="100" align="center">
            <a href="${pageContext.request.contextPath}/product/detail/${row.productId}">${row.productName}</a><br>
                <a href="${pageContext.request.contextPath}/admin/edit/${row.productId}">[상품편집]</a></br>
             <fmt:formatNumber value="${row.productPrice}" pattern="###,###,###"/>
        </td>
     </tr>
    </table>   
    </c:forEach>
    </div>
    <div class="select">
   <c:if test="${page>1}">
			<a href="${pageContext.request.contextPath}/admin/list.do?num=${num}&page=${page-1}">이전</a>
		</c:if>
		<c:forEach var="pno" begin="${startpage}" end="${endpage}">
		<c:choose>
        <c:when test="${pno==page}">
            <a href="${pageContext.request.contextPath}/admin/list.do?num=${num}&page=${pno}"><strong>${pno}</strong></a>
       </c:when>
        <c:otherwise>
       		<a href="${pageContext.request.contextPath}/admin/list.do?num=${num}&page=${pno}">${pno}</a>
        </c:otherwise>
    </c:choose>
		</c:forEach>
		<c:if test="${page<maxpage}">
			<a href="${pageContext.request.contextPath}/admin/list.do?num=${num}&page=${page+1}" class="direction">다음</a>
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