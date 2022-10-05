package action.community;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import svc.community.CampaignReviewListService;
import vo.ActionForward;
import vo.PageInfo;
import vo.community.CampaignReviewDTO;

public class CampaignReviewListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("3. CampaignReviewListAction");
		ActionForward forward = null;

		
		// --------------------------------------------------------------------------------------
			
			
		//페이징처리 변수
		int pageNum = 1; 
		int listLimit = 9;
		int pageLimit = 9; 

		// 현재 페이지 번호 
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum")); 
		}
		
		//전체 게시물 수 조회
		CampaignReviewListService service = new CampaignReviewListService();
		int itemListCount = service.getCampaignReviewListCount();
		
		//개시물 페이지 계산
		int maxPage = (int)Math.ceil((double)itemListCount / listLimit);
		int startPage = ((int)((double)pageNum / pageLimit + 0.9) - 1) * pageLimit + 1;
		System.out.println(startPage);
		int endPage = startPage + pageLimit - 1;

		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		//페이지 정보
		PageInfo pageInfo = new PageInfo(pageNum, maxPage, startPage, endPage, itemListCount);
		
		
		// --------------------------------------------------------------------------------------
			
		
		//개시물 리스트
		ArrayList<CampaignReviewDTO> campaignReviewList = CampaignReviewListService.getCampaignReviewList(pageNum, listLimit);
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("campaignReviewList", campaignReviewList);
		
		System.out.println("페이지 : " + pageNum);
		
		forward = new ActionForward();
		forward.setPath("community/campaign_review_list.jsp?pageNum=" + pageNum);
		forward.setRedirect(false);
		
		return forward;
	}

}
