package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.Customer_ServiceCDTO;
import dto.Customer_ServiceDTO;
import dto.FaqDTO;
import dto.FaqSelectDTO;
import dto.RecentNoticeDTO;
import dto.ScriptwriteDTO;
import project.DatabaseUtil;

public class Customer_ServiceDAO {

		
	
	public ArrayList<Customer_ServiceDTO> customerserviceDto()  {
		
		ArrayList<Customer_ServiceDTO> list = new ArrayList<>();
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		
		String sql = 
					"SELECT title, content, TO_CHAR(reg_date, 'YYYY-MM-DD'), views, notice_idx "
					+ "FROM notice "
					+ "ORDER BY reg_date DESC";
		
		
		PreparedStatement pstmt = d.getPstmt(conn, sql);
	
		ResultSet rs = d.getRs(pstmt);
		
		try {
		while (rs.next()) {
			  String title = rs.getString(1);
			  String content = rs.getString(2);
			  content = content.replace(". ",".<br>" );
			  content = content.replace("!",".<br>" );
			  String reg_date = rs.getString(3);
			  int views = rs.getInt(4);
			  int notice_idx = rs.getInt(5);
			  Customer_ServiceDTO customer_serviceDto = new Customer_ServiceDTO( content, title, reg_date, views, notice_idx);
			  list.add(customer_serviceDto);
		}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt, rs);
		}
		return list;
	}
	
	public ArrayList<Customer_ServiceCDTO> customerserviceContent(int notice_idx) {
		
		ArrayList<Customer_ServiceCDTO> list = new ArrayList<>();
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		
		String sql ="SELECT title, content, TO_CHAR(reg_date, 'YYYY-MM-DD'), views "
				   + "FROM notice  "
				   + "WHERE notice_idx = ? ";
		
		
		PreparedStatement pstmt = d.getPstmt(conn, sql);
	
		try {
			pstmt.setInt(1, notice_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ResultSet rs = d.getRs(pstmt);
		
		try {
		while (rs.next()) {
			  String title = rs.getString(1);
			  String content = rs.getString(2);
			  content = content.replace(". ",".<br>" );
			  content = content.replace("!",".<br>" );
			  String reg_date = rs.getString(3);
			  int views = rs.getInt(4);
			  Customer_ServiceCDTO customerserviceContent = new Customer_ServiceCDTO(content, title, reg_date, views);
			  list.add(customerserviceContent);
		}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt, rs);
		}
		return list;
		
	}
	
	
	public ArrayList<ScriptwriteDTO> getscriptwriteByPageNum(int pageNum, int play_idx) {
		ArrayList<ScriptwriteDTO> listRet = new ArrayList<ScriptwriteDTO>();
		
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		
		int endNum = pageNum * 10;
		int startNum = endNum - 9;
		
		String sql = "SELECT s2.* "
				   + "FROM     (SELECT rownum rnum, s1.* "
				   + "          FROM    (SELECT m.email, s.content, s.star_rating, s.title, TO_CHAR(s.reg_date, 'YYYY-MM-DD HH24:MM') AS reg_date, s.del_ok, s.script_idx  "
				   + "                   FROM script s  "
				   + "                   JOIN member m ON m.member_idx = s.member_idx "
				   + "                   WHERE s.del_ok = 'N' "
				   + "                   AND s.play_idx = ? "
				   + "                   ORDER BY s.reg_date DESC) s1) s2 "
				   + "WHERE rnum >= ? AND rnum <= ? ";
		  
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		try {
			pstmt.setInt(1, play_idx);
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, endNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		ResultSet rs = d.getRs(pstmt);
		
		try {
			while (rs.next()) {
				  String email = rs.getString("email");
				  String content = rs.getString("content");
				  String starRating = rs.getString("star_rating");
				  String title = rs.getString("title");
				  String regDate = rs.getString("reg_date");
				  String delOk = rs.getString("del_ok");
				  int script_idx = rs.getInt("script_idx");
				  ScriptwriteDTO scriptwriteDto = new ScriptwriteDTO(email, content, starRating, title, regDate, delOk, script_idx);
				  listRet.add(scriptwriteDto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			d.close(conn, pstmt, rs);
		}
		return listRet;
	}
	
	public int getLastPageNum() {
		DatabaseUtil d = new DatabaseUtil();
		
		String sql = "SELECT COUNT(*) FROM script ";
		
		Connection conn = d.getConn();
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		
		ResultSet rs = d.getRs(pstmt);
		int countRet = -1;

		try {
			if (rs.next()) {
				countRet = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			d.close(conn, pstmt, rs);
		}
	
		return countRet/10 + (countRet%10>0 ? 1: 0);
	}
	
	public ArrayList<FaqDTO> faqdto() {
		ArrayList<FaqDTO> Faqlist = new ArrayList<>();
		
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		
		String sql = "SELECT category, faq, reply, TO_CHAR(faq_date, 'YYYY-MM-DD'), faq_idx "
				   + "FROM faq "
				   + "ORDER BY faq_date DESC ";
		
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		
		ResultSet rs = d.getRs(pstmt);
		
		try {
			while (rs.next()) {
				String category = rs.getString(1);
				String faq = rs.getString(2);
				
				String reply = rs.getString(3);
				 reply = reply.replace(". ",".<br>" );
				 reply = reply.replace("!",".<br>" );
				String faq_date = rs.getString(4);
				int faq_idx = rs.getInt(5);
				FaqDTO faqdto = new FaqDTO(category, faq, reply, faq_date, faq_idx);
				Faqlist.add(faqdto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			d.close(conn, pstmt, rs);
		}
		
		return Faqlist;
		
		
	}
	
	public ArrayList<FaqSelectDTO> faqSelectdto(int faq_idx) {
		ArrayList<FaqSelectDTO> Faqlist = new ArrayList<>();
		
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		
		String sql = "SELECT category, faq, reply, TO_CHAR(faq_date, 'YYYY-MM-DD') "
				   + "FROM faq  "
				   + "WHERE faq_idx = ? ";
		
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		
		try {
			pstmt.setInt(1, faq_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ResultSet rs = d.getRs(pstmt);
		
		try {
			while (rs.next()) {
				String category = rs.getString(1);
				String faq = rs.getString(2);
				String reply = rs.getString(3);
				 reply = reply.replace(". ",".<br>" );
				 reply = reply.replace("!",".<br>" );
				String faq_date = rs.getString(4);
				FaqSelectDTO faqselectdto = new FaqSelectDTO(category, faq, reply, faq_date);
				Faqlist.add(faqselectdto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			d.close(conn, pstmt, rs);
		}
		
		return Faqlist;
	}
	
	public ArrayList<FaqSelectDTO> getfaqByPageNum(int pageNum, int faq_idx) {
		ArrayList<FaqSelectDTO> listRet = new ArrayList<FaqSelectDTO>();
		
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		
		int endNum = pageNum * 10;
		int startNum = endNum - 9;
		
		String sql = "SELECT s2.* "
				   + "FROM (SELECT rownum rnum, s1.* "
				   + "      FROM   (SELECT category, faq, reply, TO_CHAR(faq_date, 'YYYY-MM-DD') "
				   + "              FROM faq  "
				   + "              ORDER BY faq_date DESC ) s1) s2 "
				   + "WHERE rnum >= ? AND rnum <= ? ";
		
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		
		try {
			pstmt.setInt(1, pageNum);
			pstmt.setInt(2, faq_idx);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		ResultSet rs = d.getRs(pstmt);
		
		try {
			while (rs.next()) {
				String category = rs.getString(1);
				String faq = rs.getString(2);
				String reply = rs.getString(3);
				String faq_date = rs.getString(4);
				FaqSelectDTO faqdto = new FaqSelectDTO(category, faq, reply, faq_date);
				listRet.add(faqdto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			d.close(conn, pstmt, rs);
		}
		
		return listRet;
	}
	
	public ArrayList<Customer_ServiceCDTO> getnoticeByPageNum(int pageNum, int notice_idx) {
		ArrayList<Customer_ServiceCDTO> listRet = new ArrayList<>();
		
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		
		String sql = "SELECT s2.* "
				   + "FROM (SELECT rownum rnum, s1.* "
				   + "      FROM   (SELECT title, content, TO_CHAR(reg_date, 'YYYY-MM-DD'), views "
				   + "              FROM notice  "
				   + "              ORDER BY reg_date DESC) s1) s2 "
				   + "WHERE rnum >= ? AND rnum <= ? ";
		
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		
		try {
			pstmt.setInt(1, pageNum);
			pstmt.setInt(2, notice_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ResultSet rs = d.getRs(pstmt);
		
		try {
			while (rs.next()) {
		
					String title = rs.getString(1);
					String content = rs.getString(2);
					String regdate = rs.getString(3);
					int views = rs.getInt(4);
					Customer_ServiceCDTO cscd = new Customer_ServiceCDTO(content, title, regdate, views);
					listRet.add(cscd);
					
				}
		}catch(Exception e) {
				e.printStackTrace();
		}finally {
				d.close(conn, pstmt, rs);
		}
				
			return listRet;
	}
	
	public ArrayList<RecentNoticeDTO> getRecentNotice(){
		DatabaseUtil d = new DatabaseUtil();
		ArrayList<RecentNoticeDTO> list = new ArrayList<>();
		Connection conn = d.getConn();
		String sql = "SELECT notice_idx, title FROM notice ORDER BY reg_date DESC";
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		ResultSet rs = d.getRs(pstmt);
		try {
			while(rs.next()) {
				list.add(new RecentNoticeDTO(rs.getInt(1), rs.getString(2)));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt, rs);
		}
	return list;
	}
	
	
	public void addViews(int notice_idx){
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();
		String sql = "UPDATE notice SET views = views + 1 WHERE notice_idx = ?";
		PreparedStatement pstmt = d.getPstmt(conn, sql);
		try {
			pstmt.setInt(1, notice_idx);
			System.out.println(pstmt.executeUpdate() + "행 업데이트됨");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		d.close(conn, pstmt);
	}
	
}
