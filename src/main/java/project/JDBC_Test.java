//package project;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.SQLException;
//
//public class JDBC_Test {
//
//	private final String url = "jdbc:oracle:thin:@(description= (address=(protocol=tcps)(port=1522)(host=adb.ap-chuncheon-1.oraclecloud.com))(connect_data=(service_name=g318adc147af851_f8yndzt61egzkz9z_high.adb.oraclecloud.com)))";
//	private final String user = "admin"; // 사용자 이름
//	private final String password = "pqpuqootoey9!83PQPUQOOTOEY"; // 비밀번호
//
//	public Connection getConn() {
//		Connection conn = null;
//		try {
//			// JDBC 드라이버 로드
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//			// 데이터베이스 연결
//			conn = DriverManager.getConnection(url, user, password);
//			System.out.println("데이터베이스에 성공적으로 연결되었습니다.");
//		} catch (ClassNotFoundException e) {
//			System.out.println("JDBC 드라이버를 찾을 수 없습니다: " + e.getMessage());
//			e.printStackTrace();
//		} catch (SQLException e) {
//			System.out.println("데이터베이스 연결 실패: " + e.getMessage());
//			e.printStackTrace();
//		}
//		return conn;
//	}
//
//	public static void main(String[] args) {
//		JDBC_Test dbUtil = new JDBC_Test();
//		Connection connection = dbUtil.getConn();
//
//		if (connection != null) {
//			try {
//				// 연결 종료
//				connection.close();
//				System.out.println("연결이 종료되었습니다.");
//			} catch (SQLException e) {
//				System.out.println("연결 종료 실패: " + e.getMessage());
//			}
//		}
//	}
//}
