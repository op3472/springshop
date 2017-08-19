<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout.css" />

<link href="${pageContext.request.contextPath}/resources/css/jquery.bxslider.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
$(document).ready(function(){
	var slider = $('.bxslider').bxSlider({
			auto: true, mode:'fade',
		});
		// 클릭시 멈춤 현상 해결 //
		$(document).on('click','.bx-next, .bx-prev',function() {
		slider.stopAuto();
		slider.startAuto();
		
		});
		$(document).on('mouseover','.bx-pager, #bx-pager1',function() {
		slider.stopAuto();
		slider.startAuto();
	
		});	
});
</script>
 </head>

 <body>
  	<div class="wrap">
	  <jsp:include page="/WEB-INF/views/menu.jsp" flush="false"/>
		<div class="content">
		<div class="banner">
		<div id="s_banner_wrap">
			<ul class="bxslider">
				<c:forEach var="row2" items="${banner}">
      			<li><a href="${pageContext.request.contextPath}/admin/bannerdetail/${row2.banner_num}"><img src="${pageContext.request.contextPath}/resources/bannerimage/${row2.banner_url}" style="margin:auto; "></a></li>
      			</c:forEach>
    		</ul>
		</div>
		</div>
		<div class="product">
		 <c:forEach var="row" items="${list}">
		<table class="productlist">
      	<tr>
           <td>
                <a href="${pageContext.request.contextPath}/product/detail/${row.productId}">
                    <img src="${pageContext.request.contextPath}/resources/shopimages/${row.productUrl}" width="200px" height="150px">
                </a>
            </td>
        </tr>
        <tr>
           <td>
                <a href=
                "${pageContext.request.contextPath}/product/detail/${row.productId}">${row.productName}</a>
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
		</div>
		<div class="footer">
		copyright-2017- email:rain_pero@naver.com
		</div>
	</div>
 </body>
</html>
