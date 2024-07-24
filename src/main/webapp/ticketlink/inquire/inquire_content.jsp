<%@page import="dto.ShowInquiryInfoDTO"%>
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
    }
    .container{
      width: 880px;
      height: 800px;
      margin: 0 auto;
    }
    .container > div:nth-child(1){
      display: flex;
      width: 880px;
      height: 80px;
    }
    .status{
      line-height: 80px;
      width: 180px;
      height: 80px;
      text-align: center;
      font-size: 18x;
    }
    .title1{
      width: 700px;
      padding-left: 50px;
      line-height: 80px;
      font-size: 16px;
    }
    .question{
      width: 180px;
      height: 93px;
      text-align: center;
      font-size: 18px;
      line-height: 84px;
    }
    .container > div:nth-child(2){
      border-top: 1px solid #f4f4f4;
      border-bottom: 1px solid #f4f4f4;
      display: flex;
      width: 880px;
      height: 93px;
      background-color: #FCFCFC;
    }
    .title2{
      width: 630px;
      padding-left: 50px;
      line-height: 84px;
      font-size: 14px;
    }
    .regdate{
      font-size: 13px;
      line-height: 84px;
    }
    .btndiv{
      width: 880px;
      margin-top: 400px;
      text-align: center;
    }
    .btn{
      height: 50px;
      font-size: 18px;
      width: 144px;
      height: 50px;
      border-radius: 50px;
      margin-top: 30px;
      background-color: #242424;
      color: white;
      transition: background-color 0.3s ease;
      cursor: pointer;
    }
    .btn:hover{
      background-color: #555555;
    }
  </style>
</head>
<body>
<%
ShowInquiryInfoDTO dto = (ShowInquiryInfoDTO)request.getAttribute("dto");
%>
  <div class="container">
    <div>
      <div class="status"><%=dto.getProcess_st()%></div>
      <div class="title1"><%=dto.getTitle()%></div>
    </div>
    <div>
      <div class="question">질문</div>
      <div class="title2"><%=dto.getContent()%></div>
      <div class="regdate"><%=dto.getDate()%></div>
    </div>
    <div class="btndiv">
      <button class="btn" onclick="location.href='/Tcp2/ShowInquiryList'">목록</button>
    </div>
  </div>
</body>
</html>