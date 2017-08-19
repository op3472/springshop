<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <head>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout.css" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%
	String id= (String)session.getAttribute("id");
	%>
 </head>

 <body>
  	<div class="wrap">
	  <jsp:include page="/WEB-INF/views/menu.jsp" flush="false"/>
		<div class="content">
			<div class="detail">
           <img src="${pageContext.request.contextPath}/resources/shopimages/${vo.productUrl}" style="float:left;">
          <table class="detailtable"border="1" style="height: 300px; width: 400px; float:left; margin:20px 0 0;">
                    <tr align="center">
                        <th>상품명</th>
                        <td>${vo.productName}</td>
                    </tr>
                    <tr align="center">
                        <th>가격</th>
                        <td><fmt:formatNumber value="${vo.productPrice}" pattern="###,###,###"/></td>
                    </tr>
                    <tr align="center">
                    	<td colspan="2">
                      <% if(id!=null){ %>
                            <form name="form1" method="post" action="${pageContext.request.contextPath}/cart/insert.do">
                                <input type="hidden" name="productId" value="${vo.productId}">
                                <select name="amount">
                                    <c:forEach begin="1" end="10" var="i">
                                        <option value="${i}">${i}</option>
                                    </c:forEach>
                                </select>&nbsp;개
                                <input type="submit" value="장바구니에 담기">
                            </form>
                          <%} %>
                            <a href="javascript:history.back(-1)">상품목록</a>
                        </td>
                    </tr>
                </table>
   			</div>
   			<div class="detail2">
   			 <img src="${pageContext.request.contextPath}/resources/images/detail.PNG">
              <p>${vo.productDesc}</p>
             </div> 
		</div>
		<div class="footer">
		copyright-2017- email:rain_pero@naver.com
		</div>
	</div>
 </body>
</html>