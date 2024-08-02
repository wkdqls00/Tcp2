package servlet;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@WebServlet("/KakaoServlet")
public class KakaoServlet extends HttpServlet {

    private static final String CLIENT_ID = "7a031cf5f9ab77620ab76d3cf944f39a";
    private static final String CLIENT_SECRET = "YOUR_CLIENT_SECRET"; // (선택사항)
    private static final String REDIRECT_URI = "http://localhost:9090/Tcp2/KakaoServlet";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");

        String tokenUrl = "https://kauth.kakao.com/oauth/token";
        String params = "grant_type=authorization_code";
        params += "&client_id=" + CLIENT_ID;
        params += "&redirect_uri=" + REDIRECT_URI;
        params += "&code=" + code;

        // (선택사항) client_secret을 사용하는 경우
        // params += "&client_secret=" + CLIENT_SECRET;

        // HTTP POST 요청을 통해 액세스 토큰을 받아옵니다.
        URL url = new URL(tokenUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");
        connection.setDoOutput(true);
        DataOutputStream writer = new DataOutputStream(connection.getOutputStream());
        writer.writeBytes(params);
        writer.flush();
        writer.close();

        int responseCode = connection.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            StringBuilder responseText = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                responseText.append(line);
            }
            reader.close();

            // JSON 파싱하여 액세스 토큰 추출
            JSONParser parser = new JSONParser();
            try {
                JSONObject responseJson = (JSONObject) parser.parse(responseText.toString());
                String accessToken = (String) responseJson.get("access_token");

                // 액세스 토큰을 콘솔에 출력
                System.out.println("Access Token: " + accessToken);

                // 액세스 토큰을 사용하여 사용자 정보 요청
                String userInfoUrl = "https://kapi.kakao.com/v2/user/me";
                HttpURLConnection userInfoConnection = (HttpURLConnection) new URL(userInfoUrl).openConnection();
                userInfoConnection.setRequestMethod("GET");
                userInfoConnection.setRequestProperty("Authorization", "Bearer " + accessToken);

                int userInfoResponseCode = userInfoConnection.getResponseCode();
                if (userInfoResponseCode == HttpURLConnection.HTTP_OK) {
                    BufferedReader userInfoReader = new BufferedReader(new InputStreamReader(userInfoConnection.getInputStream()));
                    StringBuilder userInfoResponseText = new StringBuilder();
                    while ((line = userInfoReader.readLine()) != null) {
                        userInfoResponseText.append(line);
                    }
                    userInfoReader.close();

                    // 사용자 정보 처리
                    JSONObject userInfoJson = (JSONObject) parser.parse(userInfoResponseText.toString());

                    // 사용자 정보를 콘솔에 출력
                    System.out.println("User Info: " + userInfoJson.toString());

                    // 예: userInfoJson.getJSONObject("kakao_account").getString("email");
                    response.getWriter().write(userInfoJson.toString());
                } else {
                    response.getWriter().write("Failed to get user info");
                }
            } catch (ParseException e) {
                response.getWriter().write("Failed to parse JSON response");
                e.printStackTrace();
            }
        } else {
            response.getWriter().write("Failed to get access token");
        }
    }
}