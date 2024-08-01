<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/Tcp2/assets/css/find_id.css">
    <style>
        .search_content > h3 {
            margin: 40px 0;
            line-height: 143%;
            font-weight: bold;
            font-size: 22px;
            color: #1c1c13;
        }
        .member_info {
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            box-sizing: border-box;
            padding-bottom: 50px;
        }
        .id {
            margin-left: 10px;
            font-size: 20px;
            font-weight: bold;
        }
        .image {
            height: 20px;
            margin-left: 4px;
            padding: 2px 6px;
            border: 1px solid #ef3e4e;
            border-radius: 4px;
            box-sizing: border-box;
            background-color: #fff;
            text-align: center;
            font-weight: bold;
            font-size: 10px;
            color: #ef3e4e;
        }
        .date {
            margin-left: 195px;
        }
        .btn_box {
            display: flex;
        }
        .btn_box > a{
            width: 100%;
            height: 52px;
            border-radius: 12px;
            font-weight: bold;
            font-size: 17px;
            box-sizing: border-box;
            text-align: center;
            line-height: 50px;
        }
        .btn_box a + a {
            margin-left: 10px;
        }
        .white_btn {
            background-color: #fff;
            border: 1px solid #ddd;
            color: #1c1c1e;
        }
        .red_btn {
            background-color: #ef3e4e;
            color: #fff;
            border: 1px solid #ef3e4e;
        }
    </style>
</head>
<body>
    <!--홈페이지상단-->
    <div class="common_header">
        <div class="header_inner">
            <div class="inner">
                <a href="https://www.naver.com" class="header_logo"><span class="hidden">사이트이름</span></a>
                <ul class="my_menu">
                    <li>
                        <a href="/Tcp2/ticketlink/Login/Login.jsp">로그인</a>
                        <a href="/Tcp2/ticketlink/Login/Join_content.jsp">회원가입</a>
                    </li>
                </ul>
            </div>
        </div>
    </div> 
    <div class="content">
        <div class="info_searchHeader">
            <h2>계정찾기</h2>
        </div>
        <div class="info_searchBody">
            <div class="search_tabWrap">
                <div class="search_tab">
                    <div class="tab current">
                        <a href="/Tcp2/ticketlink/Login/Find_id.jsp">아이디 찾기</a>
                    </div>
                    <div class="tab">
                        <a href="/Tcp2/ticketlink/Login/Find_pw_idcheck.jsp">비밀번호 찾기</a>
                    </div>
                </div>
            </div>
            <div class="search_contentWrap">
                <div class="search_content">
                    <h3>고객님의 임시 비밀번호입니다.</h3>
                    <div class="resultList">
                        <ul>
                            <li>
                                <div class="member_info">
                                    <div class="id"><%=request.getAttribute("new_pw") %></div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="btn_box">
                        <a href="/Tcp2/ticketlink/Login/Find_pw_idcheck.jsp" class="white_btn">비밀번호 찾기</a>
                        <a href="/Tcp2/ticketlink/Login/Login.jsp" class="red_btn">로그인</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>