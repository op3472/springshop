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
        var productid = $("#product_id").val();
        var bannerdesc = $("#banner_desc").val();
        var bannerPhoto = $("#bannerPhoto").val();

        if(productid == "") {
            alert("연결될상품번호를 입력해주세요");
            productid.foucs();
        } else if (bannerdesc == "") {
            alert("배너설명을 입력해주세요");
            bannerdesc.focus();
        } else if (bannerPhoto == "") {
            alert("배너 사진을 입력해주세요");
            bannerPhoto.focus();
        }
        // 상품 정보 전송
        document.form1.action = "${pageContext.request.contextPath}/admin/bannerinsert.do";
        document.form1.submit();
    });
    // 상품 목록이동
    $("#listBtn").click(function(){
        location.href='${pageContext.request.contextPath}/admin/banner.do?page=1';
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
            <th>연결될상품번호</th>
            <td><input type="text" name="product_id" id="product_id"></td>
        </tr>
        <tr>
            <th>배너설명</th>
            <td><textarea rows="5" cols="60" name="banner_desc" id="banner_desc"></textarea></td>
        </tr>
        <tr>
      	 <th>배너이미지</th>
         <td><input type="file" name="bannerPhoto" id="bannerPhoto"></td>
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