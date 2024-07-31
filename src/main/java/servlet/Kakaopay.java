package servlet;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
//request.setCharacterEncoding("UTF-8");
//response.setContentType("text/html; charset=UTF-8");
@WebServlet("/KakaoPay")
public class Kakaopay extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        URL url = new URL("https://kapi.kakao/v1/payment/ready");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        
        // HTTP 메소드 설정
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Authorization", "KakaoAK DEVE170AFE11E987763E8F97BA97EF1E71C2E411"); // 여기에 실제 키를 입력하세요
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
        conn.setDoInput(true);
        conn.setDoOutput(true);
        
        Map<String, String> params = new HashMap<>();
        params.put("cid", "TC0ONETIME");
        String partner_order_id = "asdasd";
        String partner_user_id = "123";
        params.put("partner_order_id", partner_order_id);
        params.put("partner_user_id", partner_user_id);
        params.put("item_name", "상품명");
        params.put("quantity", "2");
        params.put("total_amount", "10000");
        params.put("tax_free_amount", "1000");
        params.put("approval_url", "www.naver.com");
        params.put("cancel_url", "www.naver.com");
        params.put("fail_url", "www.naver.com");

        // 파라미터를 StringBuilder로 생성
        StringBuilder string_params = new StringBuilder();
        for (Map.Entry<String, String> elem : params.entrySet()) {
            string_params.append(elem.getKey()).append("=").append(elem.getValue()).append("&");
        }
        // 마지막 '&' 제거
        if (string_params.length() > 0) {
            string_params.setLength(string_params.length() - 1);
        }

        // OutputStream에 데이터 쓰기
        conn.getOutputStream().write(string_params.toString().getBytes("UTF-8"));
        
        // 응답 읽기
        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        JSONParser parser = new JSONParser();
        JSONObject obj = null;
        try {
            obj = (JSONObject) parser.parse(in);
        } catch (IOException | ParseException e) {
            e.printStackTrace();
        }
        
        String successUrl = (String) obj.get("next_redirect_pc_url");
    }
}