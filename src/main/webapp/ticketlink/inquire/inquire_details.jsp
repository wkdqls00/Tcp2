<%@page import="dto.ShowInquiryInfoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>문의내역</title>
  <style>
    *{
      padding: 0;
      margin: 0;
      box-sizing: border-box;
      text-align: center;
    }
    .container{
      width: 880px;
      height: 800px;
      margin: 0 auto;
    }
    .container > div:nth-child(1){
      margin-top: 8px;
      height: 70px;
    }
    .greyarea{
      background-color: #E5E5E5;
      height: 210px;
      padding: 45px 0px 45px;
    }
    .stepdiv{
      margin-top: 30px;
      height: 50px;
      width: 100%;
      display: flex;
      justify-content: space-around;
      padding: 0px 50px;
    }
    .step{
      border-radius: 50%;
      background-color: #242424;
      font-size: 20px;
      font-weight: 500;
      width: 50px;
      height: 50px;
      color: white;
      padding-top: 10px;
    }
    .line{
      border: 0.5px solid #d9d9d9;
      width: 100px;
      height: 1px;
      margin-top: 20px;
    }
    .stepadd{
      display: flex;
      width: 880px;
      justify-content: space-around;
      margin-top: 20px;
    }
    .titlediv{
      display: flex;
      margin-top: 40px;
      height: 60px;
      padding-top: 16px;
      font-weight: 700;
      border-bottom: 1px solid #ccc;
    }
    .title1{
      width: 180px;
    }
    .title2{
      width: 480px;
      text-align: left;
    }
    .title3{
      width: 120px;
    }
    .title4{
      width: 100px;
    }
    .contentdiv{
      display: flex;
      height: 60px;
      padding-top: 16px;
      font-weight: 400;
      font-size: 15px;
      border-bottom: 1px solid #F4F4F4;
      letter-spacing : -1px;
    }
    .content1{
      width: 180px;
    }
    .content2{
      width: 480px;
      text-align: left;
    }
    .content3{
      width: 120px;
    }
    .content4{
      width: 100px;
    }
    a{
      text-decoration: none;
      color: black;
    }
  </style>
</head>
<body>
<%
	@SuppressWarnings("unchecked")
	ArrayList<ShowInquiryInfoDTO> list = (ArrayList<ShowInquiryInfoDTO>)request.getAttribute("list");
%>
  <div class="container">
    <div style="font-size: 14px;">문의하신 내용은 다음과 같은 절차로 처리됩니다. 최대한 빠르게 처리할 수 있도록 노력하고 있습니다.</div>
    <div class="greyarea">
      <div>문의하신 내용은 아래와 같은 단계로 처리됩니다.</div>
      <div class="stepdiv">
        <div class="step">1</div>
        <div class="line"></div>
        <div class="step">2</div>
        <div class="line"></div>
        <div class="step">3</div>
        <div class="line"></div>
        <div class="step">4</div>
        <div class="line"></div>
        <div class="step">5</div>
      </div>
      <div class="stepadd">
        <div>접수 완료</div>
        <div>처리 대기</div>
        <div>추가 확인</div>
        <div>답변 완료</div>
        <div>최종 완료</div>
      </div>
    </div>
    <div class="titlediv">
      <div class="title1">상태</div>
      <div class="title2">제목</div>
      <div class="title3">유형</div>
      <div class="title4">접수일</div>
    </div>
    <%
    for(int i = 0; i < list.size(); i++) {%>
    <div class="contentdiv">
      <div class="content1"><%=list.get(i).getProcess_st()%></div>
      <div class="content2"><a href="/Tcp2/Controller?command=inquiredetail&bno=<%=list.get(i).getInquiry_idx()%>"><%=list.get(i).getTitle()%></a></div>
      <div class="content3"><%=list.get(i).getType()%></div>
      <div class="content4"><%=list.get(i).getDate()%></div>
    </div>
    <%} %>
  </div>
  <script>

  </script>
</body>
</html>