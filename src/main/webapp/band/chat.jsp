<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="dto.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	HttpSession hs = request.getSession();
	int member_idx = (int)hs.getAttribute("userIdx");
	int meet_idx = Integer.parseInt(request.getParameter("meet_idx"));
	
	int chat_idx = Integer.parseInt(request.getParameter("chat_idx"));
	
	// 채팅 내역 출력
	ChatHistoryDAO chDao = new ChatHistoryDAO();
	ArrayList<ChatHistoryDTO> chList = new ArrayList<>();
	
	chList = chDao.selectChatHistoryDTO(chat_idx, meet_idx);
	
	// 채팅방 제목 출력
	ChatTitleDTO chTitleDto = chDao.selectChatTitle(chat_idx);
	
	// 채팅방 참여
	ChatJoinDAO cjDao = new ChatJoinDAO();
	
	// 채팅방 회원수
	ChatMemberCountDTO cmDto = chDao.chatMemberCount(chat_idx);
	
	// 내 프로필 출력
	MeetMemberProfilePrintDAO mMemberProfilePrintDAO = new MeetMemberProfilePrintDAO();
	MeetMemberProfilePrintDTO mMemberProfilePrintDTO = mMemberProfilePrintDAO.selectMeetMemberProfilePrintDTO(meet_idx, member_idx);

	// 밴드 소개
	MeetIntroduceWriteDAO miDao = new MeetIntroduceWriteDAO();
	MeetIntroduceWriteDTO miDto = miDao.selectMeetIntroduceWriteDTO(meet_idx);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/clear.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/band.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/band_header.css'>
  <link rel='stylesheet' type='text/css' media='screen' href='../assets/css/band_chat.css'>
  <title>BAND - 채팅</title>
  <!-- <script src="/socket.io/socket.io.js"></script> -->
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
  <script src="https://cdn.socket.io/4.7.5/socket.io.min.js" integrity="sha384-2huaZvOR9iDzHqslqwpR87isEmrfxqyWOF7hr7BY6KG0+hVKLoEXMPUJw3ynWuhO" crossorigin="anonymous"></script>
  <script>
  let dateTimeList = document.querySelectorAll(".dateTime");
  let lastDateTime = dateTimeList[dateTimeList.length - 1];
  let lastDateTimeText = lastDateTime.innerText;
  alert(lastDateTimeText);
  
  function func_on_message(e) {
	    let nickMessage = (e.data).split("|");
	    let g_nick = nickMessage[0];
	    let g_msg = nickMessage[1];
	    let g_profile = "";

	    if (nickMessage[2] != null) {
	        g_profile = "<img src='" + nickMessage[2] + "'>";
	    } else {
	        g_profile = "<img>";
	    }

	    // 현재 시간 가져오기
	    let currentTime = new Date();
        let hours = currentTime.getHours();
        let minutes = currentTime.getMinutes();
        let ampm = hours >= 12 ? '오후' : '오전';
        hours = hours % 12;
        hours = hours ? hours : 12; // 0을 12로 변환
        minutes = minutes < 10 ? '0' + minutes : minutes; // 두 자리수 형식
        let formattedTime = ampm + " " + hours + ":" + minutes;
        
	    $(".chatMsgList").append(
	        "<div class='logWrap logFriend'>" +
	        "<a class='uProfile'>" +
	        "<span class='profileInner'>" + g_profile +
	        "</span>" +
	        "</a>" +
	        "<span class='pfName'>" +
	        "<button class='author'>" + g_nick +
	        "</button>" +
	        "</span>" +
	        "<div class='msg msgContainer'>" +
	        "<div class='msgMain'>" +
	        "<div class='messageBodyWrap'>" +
	        "<span class='txt'>" + g_msg + "</span>" +
	        "</div>" +
	        "<div class='aside'>" +
	        "<div class='msgAside'>" +
	        "<span class='time'>" + formattedTime + "</span>" +
	        "</div>" +
	        "</div>" +
	        "</div>" +
	        "</div>" +
	        "</div>"
	    );
	}

	// 채팅방을 열었을 시
	function func_on_open(e) {
		if (!(<%= cjDao.chatJoinOk(chat_idx, member_idx) %>)) {
			$.ajax({
	            url: '${pageContext.request.contextPath}/AjaxChatJoinServlet',
	            data: { chat_idx: <%= chat_idx %>, member_idx: <%= member_idx %> },
	            type: 'get',
	            success: function(response) {
	                console.log('채팅방 참여 성공');
	            },
	            error: function() {
	                console.log('ajax 통신 실패');
	            }
	        });
			location.reload();
		} else {
			console.log('이미 참여한 회원입니다.');
		}
		
	}

	function func_on_error(e) {
	    alert("Error!");
	}

	let webSocket = new WebSocket("ws://localhost:9090/Tcp2/broadcasting");
	webSocket.onmessage = func_on_message;
	webSocket.onopen = func_on_open;
	webSocket.onerror = func_on_error;

	$(function() {
	    function sendMessage() {
	        let my_id = <%= member_idx %>;
	        let msg = $("#commentInput").val();
	        let nickname = "<%= mMemberProfilePrintDTO.getNickname() %>";
	        let profile = "<%= mMemberProfilePrintDTO.getProfile() %>";
	        let chat_idx = <%= chat_idx %>;
			
	        // 현재 시간 가져오기
	        let currentTime = new Date();
	        let hours = currentTime.getHours();
	        let minutes = currentTime.getMinutes();
	        let ampm = hours >= 12 ? '오후' : '오전';
	        hours = hours % 12;
	        hours = hours ? hours : 12; // 0을 12로 변환
	        minutes = minutes < 10 ? '0' + minutes : minutes; // 두 자리수 형식
	        let formattedTime = ampm + " " +  hours + ":" + minutes;

	        webSocket.send(nickname + "|" + msg + "|" + profile);

	        $.ajax({
	            url: '${pageContext.request.contextPath}/AjaxChatInsertServlet',
	            data: { chat_idx: chat_idx, member_idx: my_id, content: msg },
	            type: 'get',
	            success: function(response) {
	                $(".chatMsgList").append(
	                    "<div class='logWrap logMy'>" +
	                    "<a class='uProfile'>" +
	                    "<span class='profileInner'></span>" +
	                    "</a>" +
	                    "<span class='pfName'>" +
	                    "<button class='author'>" +
	                    "</button>" +
	                    "</span>" +
	                    "<div class='msg msgContainer'>" +
	                    "<div class='msgMain'>" +
	                    "<div class='messageBodyWrap'>" +
	                    "<span class='txt'>" + msg + "</span>" +
	                    "</div>" +
	                    "<div class='aside'>" +
	                    "<div class='msgAside'>" +
	                    "<span class='time'>" + formattedTime + "</span>" +
	                    "</div>" +
	                    "</div>" +
	                    "</div>" +
	                    "</div>" +
	                    "</div>"
	                );
	                $("#commentInput").val("");
	            },
	            error: function() {
	                console.log('ajax 통신 실패');
	            }
	        });
	    }

	    $(".writeSubmit").click(function() {
	        sendMessage();
	    });

	    $("#commentInput").keypress(function(event) {
	        if (event.which == 13 && !event.shiftKey) {
	            event.preventDefault();
	            sendMessage();
	        }
	    });
	});
	
  </script>
</head>
<body class="skin3">
  <div class="ChatMainLayoutView">
    <div id="wrap" class="sChatPop">
      <header class="chatHeader sf_bg bg_blue">
        <div class="chatHeaderInfoBox">
          <h1 class="chatTitle"><%= chTitleDto.getTitle() %>&nbsp;(<%= cmDto.getChat_count() %>)</h1>
          <h2 class="chatSubTitle"><%= miDto.getMeet_name() %></h2>
        </div>
        <button class="btnPopBandGo" onclick="window.close()"></button>
      </header>
      <div class="chatRoom">
        <div class="chatList">
          <div class="messageListRegion">
            <div class="chattingRoomMessageListView">
              <div class="chatMsgList">
              <% 
	              String originDate = "";
	              for (ChatHistoryDTO chDto : chList) { 
	            	// 날짜 시간 문자열
	              	String dateTimeStr = chDto.getSend_date();
	              	
	              	// 포맷터 생성 (입력 형식과 출력 형식)
	              	DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	              	
	              	// 1. 시간 : 분 형식 출력
	                DateTimeFormatter outputFormatter_HM = DateTimeFormatter.ofPattern("a hh:mm");
	              	
	              	// 2. 날짜만 출력
	              	DateTimeFormatter outputFormatter_YMD = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	                  
	               	// 문자열을 LocalDateTime 객체로 변환
	                LocalDateTime dateTime = LocalDateTime.parse(dateTimeStr, inputFormatter);
	
	                // 포맷팅된 시간 문자열로 변환
	                String formattedTime = dateTime.format(outputFormatter_HM);
	                String date = dateTime.format(outputFormatter_YMD);
	            	
	                if (!(originDate.equals(date))) {
                %>
                <div class="logWrap logEvent">
                  <time class="time dateTime"><%= date %></time>
                </div>
                <% 
                } 
                originDate = date;
                %>
                <!-- 채팅 내역 -->
                <div class="childViewContainer">
                <% if (chDto.getMember_idx() == member_idx) { %>
                	<div class="logWrap logMy">
	                	<a href="#" class="uProfile">
		                  <span class="profileInner">
		                  </span>
		                </a>
		                <span class="pfName">
		                      <button class="author">
		                      </button>
		                    </span>
		                <div class="msg msgContainer">
		                  <div class="msgMain">
		                    <div class="messageBodyWrap">
		                      <span class="txt"><%= chDto.getContent() %></span>
		                    </div>
		                    <div class="aside">
		                      <div class="msgAside">
		                        <span class="time"><%= formattedTime %></span>
		                      </div>
		                    </div>
		                  </div>
		                </div>
	                </div>
                <% } else { %>
	                <div class="logWrap logFriend">
	                	<a href="#" class="uProfile">
		                  <span class="profileInner">
		                  	<% if (chDto.getProfile() != null) { %>
		                  	<img src="<%= chDto.getProfile() %>">
		                  	<% } else { %>
		                  	<img>
		                  	<% } %>
		                  </span>
		                </a>
		                <span class="pfName">
		                      <button class="author">
		                        <%= chDto.getNickname() %>
		                      </button>
		                    </span>
		                <div class="msg msgContainer">
		                  <div class="msgMain">
		                    <div class="messageBodyWrap">
		                      <span class="txt"><%= chDto.getContent() %></span>
		                    </div>
		                    <div class="aside">
		                      <div class="msgAside">
		                        <span class="time"><%= formattedTime %></span>
		                      </div>
		                    </div>
		                  </div>
		                </div>
	                </div>
                <% } %>
                </div>
               <% } %>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- 메시지 입력창 -->
      <section class="commentWrite">
        <div class="mentionsWrap">
          <div class="mentions-input">
            <div class="mentions">
              <div></div>
            </div>
            <textarea class="commentWrite" id="commentInput" placeholder="보낼 메시지를 입력하세요." maxlength="10000"></textarea>
          </div>
          <div class="submitWrap">
            <button class="uButton writeSubmit">보내기</button>
          </div>
        </div>
      </section>
    </div>
  </div>
</body>
</html>