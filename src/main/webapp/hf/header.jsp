<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
    <!-- css, jquery -->
    <link href="css/header.css" rel="stylesheet">
    <script src="js/jquery-3.6.0.js"></script>
    
    
    
	<!-- 헤더영억 -->
	<header>
	
	
	<!--  ---------------------------------------------------------------------------------------- -->
	
	
		
	
		<!-- 로고 -->
			
		<img id="main_logo" src="img/main/main_logo.png" alt="로고">
			
		<div id="logo">
			<a href="./">트리어스</a>
		</div>
		
		
		<!-- 로그인/마이페이지/장바구니 영역 -->
		<div id=login>

		
			<c:choose>
				<c:when test="${empty sessionScope.sId}">
					<div class="login">
						
						<a onclick="login()">로그인</a>
					</div>
				</c:when>
				
				
				<c:otherwise>
					<c:choose>
						<c:when test="${sessionScope.sId eq 'admin'}">
							<div class="login">
								<a href="Admin.my">${sessionScope.sId }님</a>
								<a href="MemberLogout.me">로그아웃</a>
							</div>
						</c:when>
						
						
						<c:otherwise>


							<!-- 장바구니 영역 -->
							<div id="cart">
								<a href="Cart.my">장바구니 </a> 
							</div>
							
							
							<!-- 마이페이지 영역 -->
							<div id="myPage">
								<ul class="myPage">
		
		
									<li><a>${sessionScope.sId }님</a>
										<ul class="subMyPage">
											<li><a href="UpdateMemberInfoForm.my">회원정보수정</a></li>
											<li><a href="Wishlist.my">위시리스트</a></li>
											<li><a href="SupportHistory.my">후원 내역 조회</a></li>
											<li> <a href="CampaignApplyList.cp">신청 캠페인 조회</a></li>
											<li><a href="OrderList.my">주문내역 조회</a></li>
											<li><a href="MemberLogout.me">로그아웃</a></li>
										</ul>
									</li>
									
									
								</ul>
							</div>
							

						</c:otherwise>
						
						
					</c:choose>
				</c:otherwise>
			</c:choose>
		
		
		<!-- 로그인/마이페이지/장바구니 영역 끝 -->
		</div>
			
			
	<!--  ---------------------------------------------------------------------------------------- -->
			
			
		<!-- 메뉴바 영역 -->
		
		<a href="CampaignList.cp">캠페인</a>
		<a href="CampaignList.cp">진행중인 캠페인</a>
		
		<a href="SupportList.su">후원하기</a>
		<a href="SupportList.su">진행중인 후원</a>
		
		<a href="StoreItemList.st">스토어</a>
		<a href="StoreItemList.st?sto_category=반려나무">반려나무</a>
		
		<a href="DiaryList.cm">커뮤니티</a>
		<a href="NoticeList.cm">공지사항</a>
		
		
	</header>
		