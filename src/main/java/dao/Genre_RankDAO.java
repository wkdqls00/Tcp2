package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import dto.Genre_RankDTO;
import dto.RecommendPDTO;
import dto.Week_RDTO;
import dto.Week_RankDTO;
import project.DatabaseUtil;

public class Genre_RankDAO {

	public static void main(String[] args) {


		ArrayList<RecommendPDTO> rpd = new Genre_RankDAO().recommendPDto();
		for(RecommendPDTO 종원 : rpd)System.out.println(종원);

	}

	public ArrayList<Genre_RankDTO> selectGenre_RankDTO(int genre_idx) {

		ArrayList<Genre_RankDTO> list = new ArrayList<>();
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();

		String sql = "SELECT r.r_date, p.name,TO_CHAR(start_date,'YYYY-MM-DD'), TO_CHAR(end_date,'YYYY-MM-DD'), r.booking_rate, poster_url, ph.name, p.play_idx "
				   + "FROM rank r, play p, genre g, playhall ph  "
				   + "WHERE r.play_idx = p.play_idx  "
				   + "AND p.playhall_idx = ph.playhall_idx "
				   + "AND p.genre_idx = g.genre_idx "
				   + "AND g.genre_idx = ? "
				   + "ORDER BY r.r_date DESC, r.genre_rank ";

		PreparedStatement pstmt = d.getPstmt(conn, sql);

		try {
			pstmt.setInt(1, genre_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		ResultSet rs = d.getRs(pstmt);

		try {
			while (rs.next()) {
				String regDate = rs.getString(1);
				String playName = rs.getString(2);
				String playStartDate = rs.getString(3);
				String playEndDate = rs.getString(4);
				double playBookRate = rs.getDouble(5);
				String poster_URL = rs.getString(6);
				String playHallName = rs.getString(7);
				int play_idx = rs.getInt(8);
				Genre_RankDTO genre_Rank = new Genre_RankDTO(regDate, playName, playStartDate, playEndDate,
						playBookRate, poster_URL, playHallName, play_idx);
				list.add(genre_Rank);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt, rs);

		}
		return list;

	}

	public ArrayList<Week_RankDTO> weekRankDto(int rowNum) {

		ArrayList<Week_RankDTO> list = new ArrayList<>();
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();

		String sql = "SELECT p.name, p.poster_url, TO_CHAR(p.start_date,'YYYY-MM-DD'),TO_CHAR(p.end_date,'YYYY-MM-DD') "
				   + "FROM play p JOIN (SELECT r.play_idx "
				   + "				    FROM rank r "
				   + "				    ORDER BY r.r_date DESC, r.booking_rate DESC) r ON p.play_idx = r.play_idx "
				   + "WHERE ROWNUM <= ? ";

		PreparedStatement pstmt = d.getPstmt(conn, sql);

		try {
			pstmt.setInt(1, rowNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ResultSet rs = d.getRs(pstmt);

		try {
			while (rs.next()) {
				String name = rs.getString(1);
				String poster_Url = rs.getString(2);
				String startDate = rs.getString(3);
				String endDate = rs.getString(4);
				Week_RankDTO week_Rank = new Week_RankDTO(name, poster_Url, startDate, endDate);
				list.add(week_Rank);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt, rs);
		}
		return list;
	}

	public ArrayList<Week_RDTO> weekRDto(int rowNum) {

		ArrayList<Week_RDTO> list = new ArrayList<>();
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();

		String sql = "SELECT play_idx, booking_rate  "
				   + "FROM  (SELECT * "
				   + "       FROM rank  "
			       + "       ORDER BY r_date DESC, booking_rate DESC)   "
				   + "       WHERE rownum <= ? ";

		PreparedStatement pstmt = d.getPstmt(conn, sql);

		try {
			pstmt.setInt(1, rowNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ResultSet rs = d.getRs(pstmt);

		try {
			while (rs.next()) {
				int play_idx = rs.getInt(1);
				int booking_rate = rs.getInt(2);
				Week_RDTO week_R = new Week_RDTO(play_idx, booking_rate);
				list.add(week_R);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt, rs);
		}
		return list;
	}

	public ArrayList<RecommendPDTO> recommendPDto() {

		ArrayList<RecommendPDTO> list = new ArrayList<>();
		DatabaseUtil d = new DatabaseUtil();
		Connection conn = d.getConn();

		String sql = "SELECT p.poster_url, a.name, p.name, TO_CHAR(p.start_date,'YYYY-MM-DD'), TO_CHAR(p.end_date,'YYYY-MM-DD'), p.play_idx "
				   + "FROM rank r JOIN play p ON r.play_idx = p.play_idx "
				   + "            JOIN playhall ph ON ph.playhall_idx = p.playhall_idx "
			       + "            JOIN area a ON ph.area_idx = a.area_idx ";

		PreparedStatement pstmt = d.getPstmt(conn, sql);

		ResultSet rs = d.getRs(pstmt);

		try {
			while (rs.next()) {
				String poster_url = rs.getString(1);
				String areaName = rs.getString(2).substring(0,2);
				String playName = rs.getString(3);
				String startDate = rs.getString(4);
				String endDate = rs.getString(5);
				int play_idx = rs.getInt(6);
				list.add(new RecommendPDTO(poster_url, areaName, playName, startDate, endDate, play_idx));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt, rs);
		}
		List result = list;
		Collections.shuffle(result);
		list = new ArrayList<RecommendPDTO>(result);
		return list;
	}
}
