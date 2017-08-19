<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/order.css" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
 
		function mySubmit(index){
			if(index==1){
				document.form1.action="${pageContext.request.contextPath}/admin/address.do?num=${order.num}"
			}
			if(index==2){
				document.form1.action="${pageContext.request.contextPath}/admin/complete.do?num=${order.num}"
			}
			document.form1.submit();
		}
		
</script>
</head>
<body>
<div class="detailwrap">
<h1>주문상세정보</h1>
<p>주문자 주소:${order.address}</p>
<p>주문자 전화번호:${order.tele}</p>
<c:if test="${order.state==1}">
<p>[배송 대기중입니다.]</p>
</c:if>
<c:if test="${order.state==2}">
<p>[배송 중입니다.]</p>
<p>택배회사:${deli.name}</p>
<p>운송장번호:${deli.address}</p>
</c:if>
<c:if test="${order.state==3}">
<p>[배송 완료했습니다.]</p>
</c:if>
<form name="form1" method="post">
 <table class="cart">
                <tr>
                    <th width="150">상품명</th>
                    <th width="150">수량</th>
                    <th>금액</th>
                </tr>
                <c:forEach var="row" items="${list}" varStatus="i">
                <tr>
                    <td class="cartcenter">
                
                        ${row.productName}
                    </td>
                    <td class="cartcenter" >
                     	${row.amount}
                        
                    </td>
                    <td class="cartcenter">
                        <fmt:formatNumber pattern="###,###,###" value="${row.money}"/>
                       
                    </td>
                </tr>
                </c:forEach>
                <tr>
                    <td class="cartright" colspan="5">
                        배송료 : ${fee}<br>
                        전체 주문금액  :<fmt:formatNumber pattern="###,###,###" value="${allsum}"/>
                 </td>
               </tr>
            </table>
			<input class="close" id="cancelBtn" type="button" value="닫기" onclick="window.close()">
			<c:if test="${order.state==1}">
			<input class="close" type="button" onclick="mySubmit(1)" value="운송장입력">
			</c:if>
			<c:if test="${order.state==2}">
			<input class="close" type="button" onclick="mySubmit(2)" value="배송완료">
			</c:if>
		
			</form>
</div>

</body>
</html>