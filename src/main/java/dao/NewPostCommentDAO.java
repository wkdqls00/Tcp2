package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import project.DatabaseUtil;

public class NewPostCommentDAO {
	public static void main(String[] args) {
		NewPostCommentDAO pw = new NewPostCommentDAO();
		pw.newPostComment(4, 6, "올ㅋㅋㅋ완전 대박사건 뀨", "N");
	}

    public void newPostComment(int post_idx, int meet_member_idx, String content, String delete_ok) {
        DatabaseUtil d = new DatabaseUtil();
        Connection conn = d.getConn();

        String sql = 
        		"INSERT INTO Meet_comment(meet_comment_idx, post_idx, meet_member_idx, reg_date, content, delete_ok)  "
        		+ "VALUES(seq_meet_comment.nextval, ?, ?,sysdate, ?, ?)";
        PreparedStatement pstmt = d.getPstmt(conn, sql);
        try {
        	pstmt.setInt(1, post_idx);
        	pstmt.setInt(2, meet_member_idx);
        	pstmt.setString(3, content);
        	pstmt.setString(4, delete_ok);

        	int result = pstmt.executeUpdate();
			System.out.println(result + "행 성공적으로 업데이트됨");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			d.close(conn, pstmt);
		}
    }
}
