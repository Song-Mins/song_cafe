<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<c:set var="loginId" value="${pageContext.request.getSession(false) == null ? '' : pageContext.request.getSession(false).getAttribute('id')}"/>

<html>
<head>
    <title>home</title>
    <style>
        *,
        *::before,
        *::after {
            margin: 0 auto;
            padding: 0;
            box-sizing: border-box;
        }

        html {
            font-size: 62.5%;
            /* 1rem을 10px로 변환 (원래는 16px) */
        }

        body {
            font-family: sans-serif;
            min-width: 1300px;
            max-width: 2000px;
        }

        button {
            background: none;
            color: inherit;
            border: none;
            cursor: pointer;
            outline: inherit;
        }

        a {
            color: inherit;
            text-decoration: none;
        }

        li {
            list-style: none;
        }

        input:focus {
            outline: none;
        }


        #header {}

        #head_outter {}

        #head_inner {
            width: 1300px;
        }

        #logo_wrap {
            padding-top: 90px;
        }

        #logo_area {
            width: 200px;
            height: 80px;
            font-size: 75px;
            font-weight: 900;
            text-align: center;
        }

        #mainContainer {}

        #search_outter {}

        #search_inner {
            width: 1300px;
        }

        #search_wrap {
            margin-top: 90px;
            padding: 20px 0;
        }

        #search_form {
            display: flex;
            justify-content: center;
        }

        #keyword_area {
            height: 40px;
            width: 50%;
            margin: 0;
        }

        #keyword_ipt {
            height: 100%;
            width: 100%;
            font-size: 15px;
            padding-left: 15px;
        }

        #button_area {
            height: 40px;
            width: 5%;
            background-color: rgb(50, 50, 100);
            margin: 0;
        }

        #button_btn {
            width: 100%;
            height: 100%;
            font-size: 18px;
            color: white;
        }


        #main_outter {}

        #main_inner {
            width: 1300px;
            display: flex;
            margin-top: 40px;
        }

        #leftMain {
            width: 70%;
            margin-right: 50px;
        }

        #menu_wrap {
            width: 100%;
            height: 200px;
            border: 0.5px solid black;
            display: flex;
            align-items: center;
        }

        #menu_table {
            width: 80%;
            height: 80%;
            border-collapse: collapse;
            font-size: 12px;
            text-align: center;
        }


        .menu_item {
            height: 40px;
            width: 20px;
            border: 0.5px solid rgb(180, 180, 180);
        }



        #rightMain {
            width: 30%;
        }

        #login_wrap {
            height: 150px;
            width: 100%;
            border: 0.5px solid black;
            display: flex;
            flex-direction: column;
            justify-content: center;

        }

        #login_area {
            height: 40%;
            width: 80%;
            background-color: rgb(50, 50, 100);
            display: flex;
            align-items: center;
        }

        #login_item {
            color: white;
            font-size: 35px;
            font-weight: 800;
        }

        #add_area {
            width: 80%;
            height: 10%;
            display: flex;
            margin-top: 20px;
        }

        .add_item {
            height: 100%;
        }

        #logout_area {
            height: 40%;
            width: 80%;
            background-color: rgb(50, 50, 100);
            display: flex;
            align-items: center;
        }

        #logout_item {
            color: white;
            font-size: 35px;
            font-weight: 800;
        }
    </style>
</head>
<body>
<div id="header">
    <div id="head_outter">
        <div id="head_inner">
            <div id="logo_wrap">
                <div id="logo_area">
                    <a href="<c:url value='/' />" id="logo_item">song</a>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="mainContainer">
    <div id="search_outter">
        <div id="search_inner">
            <div id="search_wrap">
                <form action="" id="search_form">
                    <div id="keyword_area">
                        <input type="text" id="keyword_ipt">
                    </div>
                    <div id="button_area">
                        <button id="button_btn">검색</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div id="main_outter">
        <div id="main_inner">
            <div id="leftMain">
                <div id="menu_wrap">
                    <table id="menu_table">
                        <tr>
                            <td class="menu_item">
                                <a href="<c:url value='/cafe/list' />">카페</a>
                            </td>
                            <td class="menu_item">
                                날씨
                            </td>
                            <td class="menu_item">
                                도서
                            </td>
                            <td class="menu_item">
                                스포츠
                            </td>
                        </tr>


                        <tr>
                            <td class="menu_item">
                                캘린더
                            </td>
                            <td class="menu_item">
                                소설
                            </td>
                            <td class="menu_item">
                                쇼핑
                            </td>
                            <td class="menu_item">
                                티비
                            </td>
                        </tr>

                        <tr>
                            <td class="menu_item">
                                은행
                            </td>
                            <td class="menu_item">
                                교통
                            </td>
                            <td class="menu_item">
                                숙박
                            </td>
                            <td class="menu_item">
                                지도
                            </td>
                        </tr>

                        <tr>
                            <td class="menu_item">
                                게임
                            </td>
                            <td class="menu_item">
                                사전
                            </td>
                            <td class="menu_item">
                                웹툰
                            </td>
                            <td class="menu_item">
                                경제
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div id="rightMain">
                <div id="login_wrap">
                    <c:choose>
                        <c:when test="${loginId == ''}">
                            <div id="login_area">
                                <a href="<c:url value='/login/login?url=/' />" id="login_item">Song 로그인</a>
                            </div>
                            <div id="add_area">
                                <div id="id_item" class="add_item">
                                    <a href="<c:url value='/login/find?mode=id'/>">아이디 찾기</a>
                                </div>
                                <div id="pwd_item" class="add_item">
                                    <a href="<c:url value='/login/find?mode=pwd'/>">비밀번호 찾기</a>
                                </div>
                                <div id="register_item" class="add_item">
                                    <a href="<c:url value='/register/add'/>">회원가입</a>
                                </div>
                            </div>
                        </c:when>

                        <c:when test="${loginId != ''}">
                            <div id="logout_area">
                                <a href="<c:url value='/login/logout?url=/' />" id="logout_item">Song 로그아웃</a>
                            </div>
                        </c:when>
                    </c:choose>

                </div>
            </div>
        </div>
    </div>
</div>
<script>
    let msg = "${msg}"

    if (msg == "register_OK") {
        alert("회원가입 완료")
    }


</script>

</body>
</html>
