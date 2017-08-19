<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <head>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member.css" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
	<script type="text/javascript">
	function order(){
		window.name = "parentForm";
		window.open("${pageContext.request.contextPath}/cart/order.do","chkForm","top=200 ,left=500 width=500, height=300, resizable=no, scrollbars=no");
	}
 
		function mySubmit(index){
			if(index==1){
				document.form1.action="${pageContext.request.contextPath}/cart/update.do"
			}
			if(index==2){
				document.form1.action="${pageContext.request.contextPath}/cart/order/insert.do"
			}
			document.form1.submit();
		}
		
</script>
 </head>

 <body>
  	<div class="wrap">
	  <jsp:include page="/WEB-INF/views/menu.jsp" flush="false"/>
		<div class="content">
		<jsp:include page="/WEB-INF/views/side.jsp" flush="false"/>
		<div class="cartinfo">
		 <div class="cartinfo2">
		  <c:choose>
        <c:when test="${map.count == 0}">
          <p>장바구니가 비어있습니다.</p>
        </c:when>
        <c:otherwise>
       
        <p><img src="${pageContext.request.contextPath}/resources/images/shopingcart.PNG"></br>
      	 장바구니에 담긴상품 </p>
      	   <form name="form1" id="form1" method="post">
            <table class="cart">
                <tr>
                    <th>상품명</th>
                    <th>단가</th>
                    <th>수량</th>
                    <th>금액</th>
                    <th>취소</th>
                </tr>
                <c:forEach var="row" items="${map.list}" varStatus="i">
                <tr>
                    <td class="cartcenter">
                    	<input type="hidden" name="productName" value="${row.productName}">
                        ${row.productName}
                    </td>
                    <td class="cartcenter" style="width: 150px">
                        <fmt:formatNumber pattern="###,###,###" value="${row.productPrice}"/>
                    </td>
                    <td class="cartcenter" style="width:80px">
                        <input type="number"  name="amount" value="${row.amount}" min="1" style = "text-align:right;" >
                        <input type="hidden" name="productId" value="${row.productId}">
                    </td>
                    <td class="cartcenter" style="width: 200px">
                        <fmt:formatNumber pattern="###,###,###" value="${row.money}"/>
                        <input type="hidden" name="money" value="${row.money}">
                    </td>
                    <td class="cartcenter" >
                        <a href="${pageContext.request.contextPath}/cart/delete.do?cartId=${row.cartId}">삭제</a>
                    </td>
                </tr>
                </c:forEach>
                <tr>
                    <td class="cartright" colspan="5">
                        장바구니 금액 합계 : <fmt:formatNumber pattern="###,###,###" value="${map.sumMoney}"/><br>
                        배송료 : ${map.fee}<br>
                        전체 주문금액  :<fmt:formatNumber pattern="###,###,###" value="${map.allSum}"/>
                       <input type="hidden" name="allsum" value="${map.allSum}"> 
                    </td>
              
                </tr>
            </table>
        	 <input type="hidden" name="count" value="${map.count}">  
        	 <input type="hidden" name="address">
        	 <input type="hidden" name="tele">       	 
          <button class="update" type="button" id="btnUpdate" onclick="mySubmit(1)">수정</button>
          <button class="update" type="button" id="btnUpdate" onclick="order()">주문하기</button>
            </form>
        </c:otherwise>
        
    </c:choose>	
    </div>
	</div>
		</div>
		<div class="footer">
		copyright-2017- email:rain_pero@naver.com
		</div>
	</div>
 </body>
</html>