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
    // 상품 등록 유효성검사
    $("#addBtn").click(function(){
        var productName = $("#productName").val();
        var productPrice = $("#productPrice").val();
        var productDesc = $("#productDesc").val();
        var productPhoto = $("#productPhoto").val();

        if(productName == "") {
            alert("상품명을 입력해주세요");
            productName.foucs();
        } else if (productPrice == "") {
            alert("상품 가격을 입력해주세요");
            productPrice.focus();
        } else if (productDesc == "") {
            alert("상품 설명을 입력해주세요");
            productDesc.focus();
        } else if (productPhoto == "") {
            alert("상품 사진을 입력해주세요");
            productPhoto.focus();
        }
        // 상품 정보 전송
        document.form1.action = "${pageContext.request.contextPath}/admin/insert.do";
        document.form1.submit();
    });
    // 상품 목록이동
    $("#listBtn").click(function(){
        location.href='${pageContext.request.contextPath}/admin/list.do?num=${num}&page=1';
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
    		<table class="writeform">
    	<tr>
    		<th>상품종류</th>
    		<td>
    		  <select name="productNum">
              <option value="1">신발-나이키</option>
               <option value="2">신발-아디다스</option>
               <option value="3">신발-퓨마</option>
              </select>
             </td>
    	</tr>
        <tr>
            <th>상품명</th>
            <td><input type="text" name="productName" id="productName"></td>
        </tr>
        <tr>
            <th>가격</th>
            <td><input type="text" name="productPrice" id="productPrice"></td>
        </tr>
        <tr>
            <th>상품설명</th>
            <td><textarea rows="5" cols="60" name="productDesc" id="productDesc"></textarea></td>
        </tr>
        <tr>
      	 <th>상품이미지</th>
         <td><input type="file" name="productPhoto" id="productPhoto"></td>
      	</tr>
        <tr>
            <td colspan="2" align="center">
                <input type="button" value="등록" id="addBtn">
                <input type="button" value="목록" id="listBtn">
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