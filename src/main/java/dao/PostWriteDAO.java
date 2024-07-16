package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import project.DatabaseUtil;

public class PostWriteDAO {
	public static void main(String[] args) {
		PostWriteDAO pw = new PostWriteDAO();
		pw.postWrite(1, 1, "하하호호호호호호", "db/dataimagelist/meet01_photo01.png");
	}

    public void postWrite(int meet_idx, int meet_member_idx, String content, String file_url) {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"INSERT INTO post(post_idx, meet_idx, meet_member_idx, content, reg_date, views, file_url, del_ok) "
        		+ "VALUES(seq_post.nextval, ?,?,?, sysdate, 0, ?, N)";
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        try {
        	pstmt.setInt(1, meet_idx);
			pstmt.setInt(2, meet_member_idx);
			pstmt.setString(3, content);
			pstmt.setString(4, file_url);
			int result = pstmt.executeUpdate();
			System.out.println(result + "행 성공적으로 추가됨.");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt);
		}
    }
}
