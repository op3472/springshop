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
	        var productid = $("#product_id").val();
	        var bannerdesc = $("#banner_desc").val();
	     
	        // 상품 수정 폼 유효성 검사
      if(productid == "") {
            alert("연결될상품번호를 입력해주세요");
            productid.foucs();
        } else if (bannerdesc == "") {
            alert("배너설명을 입력해주세요");
            bannerdesc.focus();
        }
	        document.form1.action = "${pageContext.request.contextPath}/admin/bannerupdate.do";
	        document.form1.submit();
	    });
	    // 상품 삭제 버튼 클릭이벤트
	    $("#deleteBtn").click(function(){
	        // 상품 삭제 확인
	        if(confirm("상품을 삭제하시겠습니까?")){
	            document.form1.action = "${pageContext.request.contextPath}/admin/bannerdelete.do?num=${vo.banner_num}";
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
		<div class="detail2">
		<form id="form1" name="form1" enctype="multipart/form-data" method="post">
    <table class="productdetail">
        <tr>
            <th>배너 이미지</th>
            <td width="800" height="450">
                <img src="${pageContext.request.contextPath}/resources/bannerimage/${vo.banner_url}">
                <br>
   
                <input type="hidden" name="banner_num" value="${vo.banner_num}">
            </td>
        </tr>
        <tr>
        <th>
        </th>
        
        <td><input type="file" id="bannerPhoto" name="bannerPhoto"></td>
        </tr>
        <tr>
            <th>연결된 상품번호</th>
            <td><input type="text" id="product_id" name="product_id" value="${vo.product_id}"></td>
        </tr>
        <tr>
            <th>상품소개</th>
            <td><textarea id="banner_desc" name="banner_desc" rows="5" cols="60">${vo.banner_desc}</textarea></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
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