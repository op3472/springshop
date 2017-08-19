<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <head>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member.css" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
	<script type="text/javascript">
	function openIdChk(num){
		window.name = "parentForm";
		window.open("${pageContext.request.contextPath}/cart/admin/detail.do?num="+num,"chkForm","top=200 ,left=500 width=510, height=800, resizable=no, scrollbars=yes");
	}

</script>
<%
	String id= (String)session.getAttribute("id");
	%>
 </head>

 <body>
  	<div class="wrap">
	  <jsp:include page="/WEB-INF/views/admin/menu.jsp" flush="false"/>
		<div class="content">
		<div class="cartinfo">
		 <div class="cartinfo3">
	
       	<p><img src="${pageContext.request.contextPath}/resources/images/order.PNG"></p>
            <table class="cart2">
        
   
                <tr>
                    <th width="140">주문번호</th>
                    <th width="120">아이디</th>
                    <th width="150">날짜</th>
                    <th width="*">금액</th>
                    <th width="140">정보</th>
                    <th width="100">배송정보</th>
                </tr>
         
                <c:forEach var="row" items="${list}" varStatus="i">
                <tr>
                    <td width="140" class="cartcenter">
                    ${row.num}
                    </td>
                    <td width="120" class="cartcenter">
                    ${row.user_id}    
                    </td>
                    <td width="150" class="cartcenter">
                    <fmt:formatDate value="${row.date}"  pattern="yyyy.MM.dd"/>   
                    </td>
                    <td width="*" class="cartcenter">
                      <fmt:formatNumber value="${row.money}" pattern="###,###,###"/>
                    </td>
                    <td width="140" class="cartcenter">
                        <a onclick="openIdChk(${row.num})">상세정보</a>
                    </td>
                    <td width="150" class="cartcenter">
                    <c:if test="${row.state==1}">
                    	배송대기
                    </c:if>
                    <c:if test="${row.state==2}">
                    	배송중
                    </c:if>
                    <c:if test="${row.state==3}">
                    	배송완료
                    </c:if>
                    </td>
                </tr>
             
                </c:forEach>
    		
            </table>
            <div class="select2">
                 <c:if test="${page>1}">
					<a href="${pageContext.request.contextPath}/admin/delivery.do?page=${page-1}">이전</a>
					</c:if>
					<c:forEach var="pno" begin="${startpage}" end="${endpage}">
					<c:choose>
        			<c:when test="${pno==page}">
          		  <a href="${pageContext.request.contextPath}/admin/delivery.do?page=${pno}"><strong>${pno}</strong></a>
      				 </c:when>
       			 <c:otherwise>
       			<a href="${pageContext.request.contextPath}/admin/delivery.do?page=${pno}">${pno}</a>
       		</c:otherwise>
    				</c:choose>
		</c:forEach>
		<c:if test="${page<maxpage}">
			<a href="${pageContext.request.contextPath}/admin/delivery.do?page=${page+1}" class="direction">다음</a>
		</c:if>
		</div>
    </div>
	</div>
		</div>
		<div class="footer">
		copyright-2017- email:rain_pero@naver.com
		</div>
	</div>
 </body>
</html>