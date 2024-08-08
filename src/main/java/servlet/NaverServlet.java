package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

@WebServlet("/NaverServlet")
public class NaverServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String clientId = "0XIdlnam8573LeD3OCbE";
        String clientSecret = "A36hq3RqKO";
        String code = request.getParameter("code");
        String state = request.getParameter("state");
        String redirectURI = URLEncoder.encode("http://127.0.0.1:9090/Tcp2/NaverServlet", "UTF-8");
        String tokenApiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&client_id=" + clientId + "&client_secret=" + clientSecret + "&code=" + code + "&state=" + state;

        String accessToken = null;
        String refreshToken = null;

        try {
            URL url = new URL(tokenApiURL);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("GET");
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if (responseCode == 200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer res = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                res.append(inputLine);
            }
            br.close();
            if (responseCode == 200) {
                JSONParser parser = new JSONParser();
                JSONObject json = (JSONObject) parser.parse(res.toString());
                accessToken = (String) json.get("access_token");
                refreshToken = (String) json.get("refresh_token");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 액세스 토큰을 사용하여 사용자 정보 요청
        if (accessToken != null && !accessToken.isEmpty()) {
            String header = "Bearer " + accessToken; // Bearer 다음에 공백 추가
            try {
                String userInfoApiURL = "https://openapi.naver.com/v1/nid/me";
                URL url = new URL(userInfoApiURL);
                HttpURLConnection con = (HttpURLConnection) url.openConnection();
                con.setRequestMethod("GET");
                con.setRequestProperty("Authorization", header);
                int responseCode = con.getResponseCode();
                BufferedReader br;
                if (responseCode == 200) { // 정상 호출
                    br = new BufferedReader(new InputStreamReader(con.getInputStream()));
                } else {  // 에러 발생
                    br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
                }
                String inputLine;
                StringBuffer res = new StringBuffer();
                while ((inputLine = br.readLine()) != null) {
                    res.append(inputLine);
                }
                br.close();
                if (responseCode == 200) {
                    JSONParser parser = new JSONParser();
                    JSONObject json = (JSONObject) parser.parse(res.toString());
                    JSONObject responseJson = (JSONObject) json.get("response");
                    String id = (String) responseJson.get("id");
                    String name = (String) responseJson.get("name");
                    String email = (String) responseJson.get("email");
                    String nickname = (String) responseJson.get("nickname");
                    System.out.println(id);
                    System.out.println(name);
                    System.out.println(email);
                    System.out.println(nickname);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("Access token is null or empty");
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Failed to obtain access token");
        }
    }
}
