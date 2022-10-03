<%@page import="vo.support.SupportDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%
   // 리스트 객체 어트리뷰트로 받기
   ArrayList<SupportDTO> List = (ArrayList<SupportDTO>)request.getAttribute("SupportList");
   
   %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link href="style.css" rel="stylesheet"> -->
<link href="css/support.css" rel="stylesheet">

<!-- 스크립트 -->
<script>
	function giveMoney() {
	   window.open("GiveMoneyForm.su", "giveMoney", "width=600,height=400");
	//    window.open(url, name, specs, replace);
	}
</script>
<script src="js/jquery-3.6.0.js"></script>
</head>
<body id="top">
   <!-- 해더 -->
   <jsp:include page="../hf/header.jsp"></jsp:include>
   <!-- 해더 -->
   
	<!-- top -->
   <jsp:include page="../hf/top.jsp" ></jsp:include>
	<!-- top -->

	<div style="text-align: center;">
   		<h1 style="display: block; margin: 70px auto; font-size: 40px; font-family: 'HallymGothic-Regular'; font-weight: 700;">[ 스토어 ]</h1>
	</div>
	<!-- 후원 메인 블럭 -->
   <main>
	 <hr style="color: gray; opacity: 70%; margin: 70px;">		   
		   
<!-- 			<!--  베너 --> 
<!-- 	       <div style="width: 75%; overflow:hidden; height:300px; background-color: black; z-index: 1; margin: 0 auto; top: 115px;  position: relative;"> -->
<!-- 		  		<div style="background-color: black; opacity: 0.33;" > -->
<!-- 		  	 		<img src="img/jang.jpg" style=" display:block; width:100%; height: 100%"> -->
<!-- 		   		</div> -->
<!-- 		   </div> -->
		   
			<!-- 글 목록 -->
		   <div class="main">
		         <%for(Object o : List){
		            SupportDTO support = (SupportDTO)o; 
		         %>
		      <div class="list">
		             	  
				  <!-- 섬네일 블럭-->		
				  <div class="sup_thum_div">
	                  <a href ="SupportDetail.su?sup_idx=<%=support.getSup_idx() %>">
	                  <img class="img" alt="썸네일" src="img/support/<%=support.getSup_thumbnail_file()%>" ></a>
              	  </div>
              	  
              	  <!-- 제목 블럭-->
              	  <div class="sup_sub_div">
              	  	<a class="sup_main_font" class="subject" href ="SupportDetail.su?sup_idx=<%=support.getSup_idx() %>"><%=support.getSup_subject()%></a>
              	  </div>

	              <!-- 퍼센트 블록 -->
	              <div class="sup_per_div">
	              
	              	  <!-- 퍼센트 바 -->
	              	  <div style="position: relative; width: 100%">
			              <div style="position: absolute; border-radius: 3px; width: 10px;" class="progressBar<%=support.getSup_idx() %>"></div>
		                  <div style="position: absolute; border-radius: 3px; width: 10px;" class="myBar<%=support.getSup_idx() %>"></div>
	                  </div>
	                  
	                  <div style="margin-top: 20px">
		                  <!-- 퍼센트 -->
		                  <span class="moneyPer<%=support.getSup_idx() %>"></span>
		                  
		                  <!-- 현재 모금 돈 -->
		                  <span class="money<%=support.getSup_idx() %>"><%=support.getSup_money() %></span>원
		              	 
		              	  <!-- 디데이 -->
	             		  <span style="text-align: right;" class="dDay<%=support.getSup_idx() %>"></span>
	                  </div>
	              </div>

				  <!--  제이쿼리용 디스플레이 none 처리 -->
                  <div style="display: none;" class="money<%=support.getSup_idx() %>"><%=support.getSup_money() %></div>
                  <div style="display: none;" class="goalPrice<%=support.getSup_idx() %>"><%=support.getSup_goal_price() %></div>
                  <div style="display: none;" class="goalDate<%=support.getSup_idx() %>"><%=support.getSup_goal_date() %></div>

				  <script type="text/javascript">
			      //제이쿼리
			      $(function() {
			    	 // D-Day 구하기 -----------------------------------------------------------------------------
				         //오늘 날짜
				         var today = new Date();
				         
				         //골 날짜
				         var goalDate = $(".goalDate<%=support.getSup_idx() %>").html();
				         var dday = new Date(goalDate)
				         
				         //디데이 계산
				         var gap = dday.getTime() - today.getTime();
				         var result = Math.ceil(gap / (1000 * 60 * 60 * 24));
				         
				         var day =  1 / result * 100
			         

					// 후원금 구하기 -----------------------------------------------------------------------------
				         //모인 후원금
				         var money = $(".money<%=support.getSup_idx() %>").html();
						
						 //골 프라이스(전체값)
				         var goalPrice = $(".goalPrice<%=support.getSup_idx() %>").html();
						
						 //일부값
				         var moneyPer = Number(money) / Number(goalPrice) * 100;
				        	 
						 if(moneyPer == "Infinity"){
							 moneyPer = 0;
						 }
						 
					// 후원금 프로그레스 바 -----------------------------------------------------------------------------
					     //프로그레스 바 전체
				         $(".progressBar<%=support.getSup_idx() %>").css({
					           width: "100%",
					           height: "7px",
					           background: "grey"
					         });
				         
					
					     //프로그레스 바 진행도
				         $(".myBar<%=support.getSup_idx() %>").css({
					           width: moneyPer+"%",
					           height: "7px",
					           background: "skyblue"
					         });
						
					     
					     //프로그레스 바 진행도 퍼센트
				         $(".moneyPer<%=support.getSup_idx() %>").html(Math.round(moneyPer*10)/10+"%");
				         //디데이
					     $(".dDay<%=support.getSup_idx() %>").html(result+"일 남음");
			      });      
				      
					// back to top 버튼 -----------------------------------------------------------------------------
								$(document).ready(function(){
					
									// 사용하지 않을 때 숨김처리
									$("#back-top").hide();
									
									// 사라지기 효과
									$(function () {
										$(window).scroll(function () {
											if ($(this).scrollTop() > 100) {
												$('#back-top').fadeIn();
											} else {
												$('#back-top').fadeOut();
											}
										});
					
										// scroll body to 0px on click
										$('#back-top a').click(function () {
											$('body,html').animate({
												scrollTop: 0
											}, 800);
											return false;
										});
									});
					
								});
			         </script>
		
		
			  </div>
			  <%} %>   
			</div>
	
	</main>         
	
	
	<div id="pagewrap">
	<p id="back-top">
		<a href="#top"><span></span>Back to Top</a>
	</p>
	</div>
        
         
   <!-- 푸터 -->
   <jsp:include page="../hf/footer.jsp"></jsp:include>
   <!-- 푸터 -->
      
</body>
</html>