<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <head>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/layout.css" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%
	String id= (String)session.getAttribute("id");
	%>
	 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
	    // 상품 수정 버튼 클릭이벤트
	    $("#editBtn").click(function(){
	        var productName = $("#productName").val();
	        var productPrice = $("#productPrice").val();
	        var productDesc = $("#productDesc").val();
	        // 상품 수정 폼 유효성 검사
	        if(productName == "") {
	            alert("상품명을 입력해주세요");
	            productName.foucs();
	        } else if (productPrice == "") {
	            alert("상품 가격을 입력해주세요");
	            productPrice.focus();
	        } else if (productDesc == "") {
	            alert("상품 설명을 입력해주세요");
	            productDesc.focus();
	        }
	        document.form1.action = "${pageContext.request.contextPath}/admin/update.do";
	        document.form1.submit();
	    });
	    // 상품 삭제 버튼 클릭이벤트
	    $("#deleteBtn").click(function(){
	        // 상품 삭제 확인
	        if(confirm("상품을 삭제하시겠습니까?")){
	            document.form1.action = "${pageContext.request.contextPath}/admin/delete.do?num=${vo.productNum}";
	            document.form1.submit();
	        }
	    });
	    // 상품 목록 버튼 클리이벤트
	    $("#listBtn").click(function(){
	        location.href = "javascript:history.back(-1)";
	    });
	});
</script>
 </head>
 
 <body>
  	<div class="wrap">
	  <jsp:include page="/WEB-INF/views/admin/menu.jsp" flush="false"/>
		<div class="content">
		<div class="detail">
		<form id="form1" name="form1" enctype="multipart/form-data" method="post">
    <table class="productdetail">
        <tr>
            <th>상품 이미지</th>
            <td>
                <img src="${pageContext.request.contextPath}/resources/shopimages/${vo.productUrl}" height="300px" width="310px">
                <br>
                <input type="file" id="productPhoto" name="productPhoto">
                <input type="hidden" name="productNum" value="${vo.productNum}">
            </td>
        </tr>
        <tr>
            <th>상품명</th>
            <td><input type="text" id="productName" name="productName" value="${vo.productName}"></td>
        </tr>
        <tr>
            <th>가격</th>
            <td><input type="number" id="productPrice" name="productPrice" value="${vo.productPrice}"></td>
        </tr>
        <tr>
            <th>상품소개</th>
            <td><textarea id="productDesc" name="productDesc" rows="5" cols="60">${vo.productDesc}</textarea></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="hidden" name="productId" value="${vo.productId}">
                <input type="button" id="editBtn" value="수정">
                <input type="button" id="deleteBtn"value="삭제">
                <input type="button" id="listBtn" value="상품목록">    
            </td>
        </tr>
    </table>
</form>
   			</div>
		</div>
		<div class="footer">
		copyright-2017- email:rain_pero@naver.com
		</div>
	</div>
 </body>
</html>