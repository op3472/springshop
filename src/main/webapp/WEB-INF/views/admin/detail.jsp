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
<h1>�ֹ�������</h1>
<p>�ֹ��� �ּ�:${order.address}</p>
<p>�ֹ��� ��ȭ��ȣ:${order.tele}</p>
<c:if test="${order.state==1}">
<p>[��� ������Դϴ�.]</p>
</c:if>
<c:if test="${order.state==2}">
<p>[��� ���Դϴ�.]</p>
<p>�ù�ȸ��:${deli.name}</p>
<p>������ȣ:${deli.address}</p>
</c:if>
<c:if test="${order.state==3}">
<p>[��� �Ϸ��߽��ϴ�.]</p>
</c:if>
<form name="form1" method="post">
 <table class="cart">
                <tr>
                    <th width="150">��ǰ��</th>
                    <th width="150">����</th>
                    <th>�ݾ�</th>
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
                        ��۷� : ${fee}<br>
                        ��ü �ֹ��ݾ�  :<fmt:formatNumber pattern="###,###,###" value="${allsum}"/>
                 </td>
               </tr>
            </table>
			<input class="close" id="cancelBtn" type="button" value="�ݱ�" onclick="window.close()">
			<c:if test="${order.state==1}">
			<input class="close" type="button" onclick="mySubmit(1)" value="������Է�">
			</c:if>
			<c:if test="${order.state==2}">
			<input class="close" type="button" onclick="mySubmit(2)" value="��ۿϷ�">
			</c:if>
		
			</form>
</div>

</body>
</html>