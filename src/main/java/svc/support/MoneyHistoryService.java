package svc.support;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import dao.SupportHistoryDAO;
import db.JdbcUtil;
import vo.support.SupportHistoryDTO;

public class MoneyHistoryService {

	public void regiestSupport(SupportHistoryDTO supporthistory) {
		
		Connection con = JdbcUtil.getConnection();
		SupportHistoryDAO dao = SupportHistoryDAO.getInstance();
		dao.setConnection(con);
		
		int insertCount = dao.insertHistory(supporthistory);
		
		if(insertCount > 0) { 
			commit(con);
		} else { 
			rollback(con);
		}
		
		close(con);
	}

	public ArrayList<SupportHistoryDTO> getSupportHistory(String mem_id) {
		
		ArrayList<SupportHistoryDTO> supList = null;
		
		Connection con = JdbcUtil.getConnection();
		SupportHistoryDAO dao = SupportHistoryDAO.getInstance();
		dao.setConnection(con);
		
		//후원내역 조회
		supList = dao.getsupportList(mem_id);
		
		close(con);
		
		return supList;
	}

	public ArrayList<SupportHistoryDTO> getSupportHistory() {
		
		ArrayList<SupportHistoryDTO> supList = null;
		
		Connection con = JdbcUtil.getConnection();
		SupportHistoryDAO dao = SupportHistoryDAO.getInstance();
		dao.setConnection(con);
		
		//후원내역 조회
		supList = dao.getsupportList();
		
		close(con);
		
		return supList;
	}

}
