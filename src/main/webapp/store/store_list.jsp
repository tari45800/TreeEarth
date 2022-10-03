<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리 - 상품목록</title>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../hf/header.jsp"></jsp:include>
	<!-- 헤더 -->

   
	<!-- top -->
   <jsp:include page="../hf/top.jsp" ></jsp:include>
	<!-- top -->
	
	<h1>등록 된 상품목록</h1>
	<hr style="color: gray; opacity: 50%; margin-bottom: 15px;">

	<div class="table">
		<div class="row header">
			<div class="cell">상품 번호</div>
			<div class="cell">상품 제목</div>
			<div class="cell">상품 가격</div>
			<div class="cell">상품 내용</div>
			<div class="cell">상품 태그</div>
			<div class="cell">상품 분류</div>
		</div>
		
		<c:choose>
			<c:when test="${not empty storeList and pageInfo.itemListCount gt 0 }">
				<c:forEach var="store" items="${storeList }">
					<div class="row">
						<div class="cell">${store.sto_idx }</div>
						<div class="cell">
							<a href="StoreItemDetail.st?sto_idx=${store.sto_idx }">
								${store.sto_subject }
							</a>
						</div>
						<div class="cell">${store.sto_price} 원</div>
						<div class="cell">${store.sto_content }</div>
						<div class="cell">${store.sto_tag }</div>
						<div class="cell">${store.sto_category }</div>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="row">등록 된 상품이 존재하지 않습니다.</div>
			</c:otherwise>
		</c:choose>
	</div>
	
	<section id="buttonArea">
		<input id="button2" type="button" value="상품 등록" onclick="location.href='StoreWriteForm.st'">
	</section>
	<section id="pageList" style="text-align: center;">	
		<c:choose>
			<c:when test="${pageInfo.pageNum > 1}">
				<input id="button" type="button" value="이전" onclick="location.href='StoreList.st?pageNum=${pageInfo.pageNum - 1}'">
			</c:when>
			<c:otherwise>
				<input id="button" type="button" value="이전">
			</c:otherwise>
		</c:choose>
			
		<!-- 페이지 번호 목록은 시작 페이지(startPage)부터 끝 페이지(endPage) 까지 표시 -->
		<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
			<!-- 단, 현재 페이지 번호는 링크 없이 표시 -->
			<c:choose>
				<c:when test="${pageInfo.pageNum eq i}">
					${i }
				</c:when>
				<c:otherwise>
					<a href="StoreList.st?pageNum=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- 현재 페이지 번호(pageNum)가 총 페이지 수보다 작을 때만 [다음] 링크 동작 -->
		<c:choose>
			<c:when test="${pageInfo.pageNum < pageInfo.maxPage}">
				<input id="button" type="button" value="다음" onclick="location.href='StoreList.st?pageNum=${pageInfo.pageNum + 1}'">
			</c:when>
			<c:otherwise>
				<input id="button" type="button" value="다음">
			</c:otherwise>
		</c:choose>
	</section>
	
	<!-- 푸터 -->
	<jsp:include page="../hf/footer.jsp"></jsp:include>
	<!-- 푸터 -->
</body>
</html>