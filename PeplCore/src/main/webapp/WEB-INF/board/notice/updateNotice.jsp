<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ADMINISTRATOR</title>
    <link href="./css/reset.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css" rel="stylesheet"> -->
    <style>

        @font-face {
            font-family: 'GmarketSansMedium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: normal;  
            font-style: normal;
        }

        body {
            margin: 0;
            background-color: #f0f0f0;
        }

        .container {
            width: 1420px;
            height: 100vh;
            background-color: antiquewhite;
        }

        /* 공통 코드 : a*/
        a {
            color: black;
            text-decoration: none;
            display: block;
        }

        .header {
            font-family: 'GmarketSansMedium';
            font-weight: bold;
            width: 100%;
            height: 80px;
            display: flex;
            justify-content: space-between;
            background-color: #272E3D;
            /* background-color: beige; */

        }
        .header a{
            color:white;
        }

        .header>h1,
        img {
            display: inline-block;
            vertical-align: middle;
            /* 적용 x*/
        }

        .header>img {
            width: 160px;
            height: 80px;
        }   

        .header>topNav {
            text-decoration: none;
            display: block;
        }

        .admin {
            font-size: 1rem;
            font-weight: bold;
            line-height: 75px;
            margin-left: 4px;

            /* background-color: cornflowerblue; */
        }

        .topNav {
            margin-right: 15px;
            line-height: 75px;
            /* background-color: darkgray; */
        }

        .topNav li {
            display: inline-block;
        }

        .leftmain {
            font-family: 'GmarketSansMedium';
            font-weight: bold;
            width: 10%;
            height: 100vh;
            float: left;
            text-align: center;
            background-color: #272E3D;
        }

        /* 아코디언 */
        .leftmain>ul {
            list-style: none;
            padding: 0;
            width: 100%;
        }

        .leftmain li {
            border-bottom: 1px solid #ddd;
        }

        .leftmain li:last-child {
            border-bottom: none;
        }

        .accordion-header {
            background-color: #272E3D;
            color: #fff;
            padding: 15px;
            cursor: pointer;
        }

        .accordion-content {
            display: none;
            padding: 15px;
            background-color: #ffd343;
        }

        /* .accordion-content a{
            color: white;
        } */

        .sideMenu {
            margin: 0;
            padding: 0;
            width: 100%;
            overflow: hidden;
            /* margin: 150px auto;  */
        }

        .sideMenu>li {
            width: 100%;
            text-align: center;
            line-height: 40px;
            background-color: #5778ff;
            border: 0;
        }

        .sideMenu a {
            color: white;
        }

        .subMenu>li {
            line-height: 50px;
            background-color: #94a9ff;
        }

        .subMenu {
            height: 0;
            /* ul의 높이를 안보이게 처리 */
            overflow: hidden;
        }

        /* 마우스 올렸을 때 반응! */
        .sideMenu .accordion-header:hover{
            background-color: #ffd343;
            transition: 1s;
            color: #272E3D;
        }
        
        /* .sideMenu>li:hover .subMenu {
            height: 160px;
             서브메뉴 li한개의 높이 50*4 
            transition-duration: 1s;
        } */
        


        .main {
            width: 85%;
            height: 100vh;
            min-height: 100%;
            float: left;
          
            /* background-color: bisque; */
        }


        .rightMain {
            /* margin: 10px 15px; */
            height: 94%;
            /* padding-bottom: 30px; */
            margin: 0;
            width: 100%;
            padding-bottom: 0;
            /* background-color: coral; */
        }

        h3 {
            margin: 30px;
            font-family: 'GmarketSansMedium';
            /* font-weight: 700; */
            font-size: 1.2rem;
            font-weight: bold;
        }

        h4 {
            margin: 20px;
            font-size: 1.0rem;
            font-weight: bold;
            /* margin-left: 20px; */
        }

        hr {
            width: 100%;
            border: 1px solid black;
        }

        table {
            margin-left:20px;
            margin-top: 10px;
            border: 1px solid black;
            border-collapse: collapse;
        }

        th,
        td {
            border: 1px solid black;
        }
        th{
            background-color: #ffd343;
        }

        .rightFooter {
            text-align: center;
            /* line-height: 45px; */
            width: 100%;
            height: 6%;
            margin: 0px;
            /* position: relative; */
            /* transform: translateY(-100%); */
            background-color: #cfcfcf;
            /* background-color: rgb(56, 141, 141); */
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="header">
            <h1 class="admin"><a href="./index_jyp.html">ADMINISTRATOR</a></h1>
            <img class="mainlogo" src="../images/logo_w.png" alt="This is PeplCore logo">
            <div class="topNav">
                <ul>
                    <li>
                        <a href="#">
                            <i class="fa-solid fa-store fa-lg"></i>
                        </a>
                    </li>
                    <li><a href="#">로그아웃</a></li>
                </ul>
            </div>
        </div>
        <!-- end of header -->
        
        <!-- 왼쪽 사이드바 메뉴, 아코디언 사용할거임 -->
        <div class="leftmain">
            <ul class="sideMenu">
                <li>
                    <div class="accordion-header" onmouseover="ToggleAccordion(this)">회원 관리</div>
                    <div class="accordion-content">
                        <p><a href="#">회원 관리</a></p>
                    </div>
                </li>
                <!-- 회원 관리 -->
                <li>
                    <div class="accordion-header" onmouseover="ToggleAccordion(this)">상품 관리</div>
                    <div class="accordion-content">
                        <p><a href="#">상품 목록</a></p>
                    </div>
                </li>
                <!-- 상품 관리 -->
                <li>
                    <div class="accordion-header" onmouseover="ToggleAccordion(this)">게시글 관리</div>
                    <div class="accordion-content">
                    	<p><a href="board.bc">게시물관리</a></p>
                        <p><a href="getAllNotice.bc">공지사항</a></p>
                        <p><a href="getAllFAQList.bc">FAQ</a></p>
                        <p><a href="#">QnA</a></p>
                        <p><a href="#">review</a></p>
                    </div>
                </li>
            </ul>
        </div>
        <!-- end of leftSide -->
        
        <div class="main">
       
<h4> 공지사항 수정</h4>

	 <form action="updateNotice.bc" method="post"> 
		<table>
			<tr>
				<td class="tdTitle">글번호</td>
				<td class="tdContent">
					<input type="text" name="bseq" value="${notice.getBseq()}" readonly>
				</td>
			</tr>
			
			<tr>
				<td class="tdTitle">제목</td>
				<td class="tdContent">
					<input type="text" name="btitle" value="${notice.getBtitle()}">
				</td>
			</tr>

			<tr>
				<td class="tdTitle">작성자</td>
				<td class="tdContent">
					<input type="text" name="bid" value="${notice.getBid()}" readonly>
				</td>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
			</tr>
			

			<tr>
				<td class="tdTitle">내용</td>
				<td class="tdContent tdTextarea">
					<textarea name="bcontent">${notice.getBcontent()}</textarea>
				</td>
			</tr>

			<tr>
				<td class="tdSubmit" colspan="2">
				<input type="submit" name="notice" value="수정">
					<%-- <a href="updateNotice.bc?bseq=${faq.getBseq() }">수정</a> --%>
					<a href="getAllNotice.bc">목록</a>
					<%-- <input type="button" value="목록"> <a href="getAllListFAQ.bc"></a> --%>
				</td>
			</tr>

		</table>
	</form/>
        </div>
        <!-- end of rightmain-->
    </div>
    <!-- end of container -->

    <!-- 아코디언 js 코드 -->
    <script>
        function ToggleAccordion(sideMenu) {
            var content = sideMenu.nextElementSibling;
            if (content.style.display === "block") {
                content.style.display = "none";
            } else {
                content.style.display = "block";
            }
        }
    </script>
</body>

</html>