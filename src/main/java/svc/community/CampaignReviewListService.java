package svc.community;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.util.ArrayList;

import dao.CampaignReviewDAO;
import db.JdbcUtil;
import vo.community.CampaignReviewDTO;

public class CampaignReviewListService {

	public int getCampaignReviewListCount() {

		int listCount = 0;
		
		//싱글톤 디자인 패턴으로 생성된 BoardDAO 인스턴스 활용
		Connection con = JdbcUtil.getConnection();
		CampaignReviewDAO dao = CampaignReviewDAO.getInstance();
		dao.setConnection(con);
		
		//전체 게시물 목록 조회
		listCount = dao.selectListCount();
//		System.out.println("listCount : " + listCount);
		
		close(con);
		
		return listCount;
	}

	public static ArrayList<CampaignReviewDTO> getCampaignReviewList(int pageNum, int listLimit) {
		
		ArrayList<CampaignReviewDTO> campaignReviewList = null;
		
		//싱글톤 디자인 패턴으로 생성된 BoardDAO 인스턴스 활용
		Connection con = JdbcUtil.getConnection();
		CampaignReviewDAO dao = CampaignReviewDAO.getInstance();
		dao.setConnection(con);
		
		campaignReviewList = dao.selectCampaignReviewList(pageNum, listLimit);
//		System.out.println(campaignReviewList);
		
		close(con);

		return campaignReviewList;
	}

}
