<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>하이</h1>
	
	<!-- 헤더 -->
	<jsp:include page="hf/header.jsp" ></jsp:include>
	<!-- 헤더 -->
	
	<a href="CampaignList.cp">캠페인</a>
	<a href="SupportList.su">후원</a>
<!-- 	<a href="StoreItemList.st">스토어</a> -->
	<a href="StoreItemList.st?sto_category=반려나무">스토어</a>
	<a href="DiaryList.cm">커뮤니티</a>
	
	<!-- 헤더 -->
	<jsp:include page="hf/footer.jsp" ></jsp:include>
	<!-- 헤더 -->
		
</body>
</html>