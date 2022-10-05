package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.community.CampaignReviewBlockFormAction;
import action.community.CampaignReviewBlockProAction;
import action.community.CampaignReviewDeleteProAction;
import action.community.CampaignReviewDetailAction;
import action.community.CampaignReviewListAction;
import action.community.CampaignReviewModifyFormAction;
import action.community.CampaignReviewModifyProAction;
import action.community.CampaignReviewWriteProAction;
import vo.ActionForward;

//커뮤니티(캠페인 후기, 반려나무 성장일기, 큐앤에이, 공지사항, 자유게시판) 컨트롤러
@WebServlet("*.cm")
public class CommunityFrontController extends HttpServlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("==============================");
		System.out.println("1. CommunityFrontController 컨트롤러");
		
		
		// --------------------------------------------------------------------------------------

		
		// 한글 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 서블릿 주소 추출
		String command = request.getServletPath();
		System.out.println("2. 입력 주소 = "+ command);

		Action action = null;
		ActionForward forward = null;

		
		// --------------------------------------------------------------------------------------
		
		
		//캠페인후기 목록	
		if(command.equals("/CampaignReviewList.cm")) { 
			try {
				action = new CampaignReviewListAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
			
		//캠페인후기 작성 폼
		} else if(command.equals("/CampaignReviewWriteForm.cm")) {
			forward = new ActionForward();
			forward.setPath("community/campaign_review_write.jsp");
			forward.setRedirect(false);
			
			
		//캠페인후기 작성 	
		} else if(command.equals("/CampaignReviewPro.cm")) { 
			try {
				action = new CampaignReviewWriteProAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		
		//캠페인후기 수정 폼
		} else if(command.equals("/CampaignReviewModifyForm.cm")) { 
			try {
				action = new CampaignReviewModifyFormAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		//캠페인후기 수정 
		} else if(command.equals("/CampaignReviewModifyPro.cm")) { 
			try {
				action = new CampaignReviewModifyProAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			

		//캠페인후기 상세조회	
		} else if(command.equals("/CampaignReviewDetail.cm")) { 
			try {
				action = new CampaignReviewDetailAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		//캠페인후기 글 삭제 폼	
		} else if(command.equals("/CampaignReviewDeleteForm.cm")) { 
			forward = new ActionForward();
			forward.setPath("community/campaign_review_delete.jsp");
			forward.setRedirect(false);
		
			
		//캠페인후기 글 삭제
		} else if(command.equals("/CampaignReviewDeletePro.cm")) { 
			try {
				action = new CampaignReviewDeleteProAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		//캠페인후기 글 신고 폼		
		} else if(command.equals("/CampaignReviewBlockForm.cm")) { 
			try {
				action = new CampaignReviewBlockFormAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		//캠페인후기 글 신고
		} else if(command.equals("/CampaignReviewBlockPro.cm")) { 
			try {
				action = new CampaignReviewBlockProAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		// --------------------------------------------------------------------------------------

		
		// 포워딩 처리
		if (forward != null) {
			
			System.out.println("8. 포워딩");
			System.out.println("==============================");
			
			if (forward.isRedirect()) { 
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}

		} 

	}

	
	// --------------------------------------------------------------------------------------
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
