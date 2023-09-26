<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<c:set var="loginId"
       value="${pageContext.request.getSession(false) == null ? '' : pageContext.request.getSession(false).getAttribute('id')}"/>

<html>
<head>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <title>cafeHome</title>
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
            min-width: 1100px;
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


        #header {
        }

        #head_outter {
            background-color: rgb(50, 50, 100);
        }

        #head_inner {
            width: 1100px;
            height: 65px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
        }

        #logo_wrap {
            height: 100%;
            margin: 0px;
            padding-right: 10px;
            display: flex;
            align-items: center;
        }

        #logo_area {
            font-size: 23px;
        }

        #search_wrap {
            height: 100%;
            width: 400px;
            margin-left: 10px;
            display: flex;
            align-items: center;
        }

        #search_form {
            height: 60%;
            width: 100%;
            display: flex;
            justify-content: center;
        }

        #search_keyword_area {
            height: 100%;
            width: 88%;

        }

        #search_keyword_item {
            height: 100%;
            width: 100%;
            padding: 0 15px;
            font-size: 16px;
        }

        #search_btn_area {
            height: 100%;
            width: 12%;
        }


        #search_btn_item {
            height: 100%;
            width: 100%;
            background-color: rgb(70, 70, 150);
            color: white;
            font-size: 16px;
        }

        #login_wrap {
            height: 100%;
            margin: 0px;
            display: flex;
            align-items: center;
        }

        #login_area {
            border: 1px solid white;
            font-size: 20px;
            font-weight: 400;
            padding: 5px;
        }


        #menu_outter {
            border-bottom: 0.5px solid rgb(180, 180, 180);
        }

        #menu_inner {
            width: 1100px;
        }

        #menu_wrap {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            padding: 10px 0;
        }

        .menu_area {
            font-size: 16px;
            font-weight: 550;
            color: black;
            margin: 0px;
            margin-right: 50px;
        }


        #mainContainer {
        }

        #main_outter {
        }

        #main_inner {
            width: 1100px;
            display: flex;
            justify-content: flex-start;
        }


        #leftMain {
            width: 70%;
            padding-right: 80px;
        }

        .title_wrap {
            height: 75px;
            display: flex;
            align-items: center;
        }

        .title_area {
            font-size: 28px;
            font-weight: 400;
            margin: 0;
        }

        #topic_wrap_box1 {
            display: flex;
            justify-content: space-between;
        }

        .box_click {
            margin: 0;
            font-size: 20px;
            font-weight: 500;
        }

        #topic_wrap1 {
            height: 60px;
            width: 93%;
            display: flex;
            align-items: center;
            white-space: nowrap;
            overflow-x: auto;
            margin: 0;
            -ms-overflow-style: none;
            /* 인터넷 익스플로러 */
            scrollbar-width: none;
            /* 파이어폭스 */
        }

        #topic_wrap1::-webkit-scrollbar {
            display: none;
            /* 크롬, 사파리, 오페라, 엣지 */
        }

        #topic_wrap_box2 {
            display: flex;
            justify-content: space-between;

        }

        #topic_wrap2 {
            height: 60px;
            width: 93%;
            display: flex;
            align-items: center;
            white-space: nowrap;
            overflow-x: auto;
            margin: 0;
            -ms-overflow-style: none;
            /* 인터넷 익스플로러 */
            scrollbar-width: none;
            /* 파이어폭스 */
        }

        #topic_wrap2::-webkit-scrollbar {
            display: none;
            /* 크롬, 사파리, 오페라, 엣지 */
        }

        .topic_area {
            height: 70%;
            font-size: 16px;
            border: 1px solid rgb(162, 161, 161);
            border-radius: 10%;
            margin-right: 35px;
            padding: 0 15px;
        }

        #region1_wrap_box {
            display: flex;
            justify-content: space-between;
        }

        #region1_wrap {
            height: 60px;
            width: 93%;
            display: flex;
            align-items: center;
            white-space: nowrap;
            overflow-x: auto;
            margin: 0;
            -ms-overflow-style: none;
            /* 인터넷 익스플로러 */
            scrollbar-width: none;
            /* 파이어폭스 */
        }

        #region1_wrap::-webkit-scrollbar {
            display: none;
            /* 크롬, 사파리, 오페라, 엣지 */
        }

        .region1_area {
            height: 70%;
            font-size: 16px;
            border: 1px solid rgb(162, 161, 161);
            border-radius: 10%;
            margin-right: 35px;
            padding: 0 15px;
        }

        #region2_wrap_box {
            display: flex;
            justify-content: space-between;

        }

        #region2_wrap {
            height: 60px;
            width: 93%;
            display: flex;
            align-items: center;
            white-space: nowrap;
            overflow-x: auto;
            margin: 0;
            -ms-overflow-style: none;
            /* 인터넷 익스플로러 */
            scrollbar-width: none;
            /* 파이어폭스 */

        }

        #region2_wrap::-webkit-scrollbar {
            display: none;
            /* 크롬, 사파리, 오페라, 엣지 */
        }

        .region2_area {
            height: 70%;
            font-size: 16px;
            border: 1px solid rgb(162, 161, 161);
            border-radius: 10%;
            margin-right: 35px;
            padding: 0 15px
        }

        #cafe_wrap {
            margin: 0;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-content: flex-start;

        }

        .cafe_area {
            width: 45%;
            height: 100px;
            border-top: 0.2px solid rgb(124, 122, 122);
            border-bottom: 0.2px solid rgb(124, 122, 122);
            margin: 0;
            margin-bottom: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-start;
        }

        .cafe_name {
            height: 45%;
            width: 100%;
            font-size: 20px;
            font-weight: 600;
            white-space: nowrap;
            overflow: hidden;
            padding-top: 10px;
        }

        .cafe_explanation {
            height: 35%;
            width: 100%;
            font-size: 13px;
            font-weight: 300;
            white-space: nowrap;
            overflow: hidden;
            padding: 10px 0;
        }

        .cafe_member {
            height: 20%;
            width: 100%;
            font-size: 12px;
            font-weight: 500;
            overflow: hidden;

        }

        #page_wrap {
            height: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
            margin-bottom: 80px;
        }

        .page_item {
            font-size: 15px;
            margin: 0 10px;

        }

        #rightMain {
            width: 30%;
        }

        #ad1_wrap {
            height: 230px;
            margin-top: 75px;
            border: 1px solid rgb(50, 50, 100);
            border-bottom: none;
            text-align: center;
            font-size: 10px;


        }

        #info_wrap {
            border: 1px solid rgb(50, 50, 100);
            width: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 25px 0;
        }


        #info_login_area {
            width: 80%;
            display: flex;
            align-items: center;
            background-color: rgb(50, 50, 100);
            padding: 10px 0;
        }

        #info_login_item {
            color: white;
            font-size: 35px;
            font-weight: 800;
        }


        #info_add_area {
            width: 80%;
            height: 20px;
            display: flex;
            margin-top: 15px;
        }

        .info_add_item {
            font-size: 10px;
            height: 100%;
        }

        #info_cafe_area {
            width: 80%;
            display: flex;
            align-items: center;
            background-color: rgb(50, 50, 100);
            padding: 10px 0;
        }

        #info_cafe_item {
            color: white;
            font-size: 35px;
            font-weight: 800;
        }

        #ad2_wrap {
            border: 1px solid rgb(50, 50, 100);
            border-top: none;
            height: 200px;
            width: 100%;
            text-align: center;
            font-size: 10px;
        }
    </style>
</head>
<body>
<div id="header">
    <div id="head_outter">
        <div id="head_inner">
            <div id="logo_wrap">
                <h1 id="logo_area">
                    <a href="<c:url value='/' />">
                        song
                    </a>

                    <a href="<c:url value='/cafe/list' />">
                        카페
                    </a>
                </h1>
            </div>
            <div id="search_wrap">
                <form action="<c:url value='/cafe/list' />" method="get" id="search_form">
                    <div id="search_keyword_area">
                        <input type="text" id="search_keyword_item" name="keyword" value="${pc.keyword}">
                    </div>
                    <div id="search_btn_area">
                        <button type="submit" id="search_btn_item">검색</button>
                    </div>
                </form>
            </div>
            <div id="login_wrap">
                <h1 id="login_area">
                    <c:if test="${loginId != ''}">
                        <%--    요청 - cafeHome.jsp   --%>
                        <a href="<c:url value='/login/logout' />">로그아웃</a>
                    </c:if>
                    <c:if test="${loginId == ''}">
                        <%--    url + 요청 - loginForm.jsp   --%>
                        <%--    로그인 완료 후 cafeHome.jsp로 오기위해   --%>
                        <a href="<c:url value='/login/login?url=/cafe/list' />">로그인</a>
                    </c:if>
                </h1>
            </div>
        </div>
    </div>
    <div id="menu_outter">
        <div id="menu_inner">
            <ul id="menu_wrap">
                <li class="menu_area">
                    <a href="<c:url value='/cafe/list?mode=cafeHome' /> ">
                        카페홈
                    </a>
                </li>
                <li class="menu_area">
                    <a href="<c:url value='/cafe/list?mode=topic' /> ">
                        주제별
                    </a>
                </li>
                <li class="menu_area">
                    <a href="<c:url value='/cafe/list?mode=region' /> ">
                        지역별
                    </a>
                </li>
                <li class="menu_area">
                    <a href="<c:url value='/cafe/list?mode=rank' />">
                        랭킹
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>

<div id="mainContainer">
    <div id="main_outter">
        <div id="main_inner">
            <div id="leftMain">
                <c:choose>
                    <c:when test="${pc.keyword != ''}">
                        <div class="title_wrap">
                            <h1 class="title_area">${pc.keyword}에 대한 검색결과</h1>
                        </div>
                    </c:when>
                    <c:when test="${mode == 'topic'}">
                        <div class="title_wrap">
                            <h1 class="title_area">주제별 카페</h1>
                        </div>
                        <div id="topic_wrap_box1">
                            <button id="topic_click_left1" class="box_click">
                                &#60;
                            </button>
                            <div id="topic_wrap1">
                                <c:forEach var="topic" items="${allTopic}">
                                    <button class="topic_area">
                                        <a href="<c:url value='/cafe/list?topic=${topic}&mode=topic' />">
                                                ${topic}
                                        </a>
                                    </button>
                                </c:forEach>
                            </div>
                            <button id="topic_click_right1" class="box_click">
                                &#62;
                            </button>
                        </div>
                        <div class="title_wrap">
                            <h1 class="title_area">${pc.topic}</h1>
                        </div>
                    </c:when>
                    <c:when test="${mode == 'region'}">
                        <div class="title_wrap">
                            <h1 class="title_area">지역별 카페</h1>
                        </div>

                        <div id="region1_wrap_box">
                            <button id="region1_click_left" class="box_click">
                                &#60;
                            </button>
                            <div id="region1_wrap">
                                <c:forEach var="region1" items="${allRegion1}">
                                    <button class="region1_area">
                                        <a href="<c:url value='/cafe/list?mode=region&region1=${region1}' />">
                                                ${region1}
                                        </a>
                                    </button>
                                </c:forEach>
                            </div>
                            <button id="region1_click_right" class="box_click">
                                &#62;
                            </button>
                        </div>

                        <div id="region2_wrap_box">
                            <button id="region2_click_left" class="box_click">
                                &#60;
                            </button>
                            <div id="region2_wrap">
                                <c:forEach var="region2" items="${allRegion2}">
                                    <button class="region2_area">
                                        <a href="<c:url value='/cafe/list?mode=region&region1=${pc.region1}&region2=${region2}' />">
                                                ${region2}
                                        </a>
                                    </button>
                                </c:forEach>
                            </div>
                            <button id="region2_click_right" class="box_click">
                                &#62;
                            </button>
                        </div>

                        <div class="title_wrap">
                            <h1 class="title_area">${pc.region1} ${pc.region2}</h1>
                        </div>
                    </c:when>
                    <c:when test="${mode == 'rank'}">
                        <div class="title_wrap">
                            <h1 class="title_area">카페 랭킹</h1>
                        </div>
                    </c:when>
                    <c:when test="${loginId != ''}">
                        <div class="title_wrap">
                            <h1 class="title_area">내 카페</h1>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="title_wrap">
                            <h1 class="title_area">이런 카페는 어때요?</h1>
                        </div>
                        <div id="topic_wrap_box2">
                            <button id="topic_click_left2" class="box_click">
                                &#60;
                            </button>
                            <div id="topic_wrap2">
                                <c:forEach var="topic" items="${allTopic}">
                                    <button class="topic_area">
                                        <a href="<c:url value='/cafe/list?topic=${topic}&mode=topic' />">
                                                ${topic}
                                        </a>
                                    </button>
                                </c:forEach>
                            </div>
                            <button id="topic_click_right2" class="box_click">
                                &#62;
                            </button>
                        </div>
                        <div class="title_wrap">
                            <h1 class="title_area">${pc.topic}</h1>
                        </div>
                    </c:otherwise>
                </c:choose>

                <div id="cafe_wrap">
                    <c:forEach var="cafe" items="${cafeDtoList}">
                        <div class="cafe_area">
                                <%--    cafe_name + 요청 - cafeMain.jsp       --%>
                                <%--    해당 카페의 cafeMain.jsp를 보여주기 위해        --%>
                            <a href="<c:url value='/bulletin/list?cafe_name=${cafe.name}&manager_id=${cafe.manager_id}&loginId=${loginId}' />"
                               class="cafe_name">
                                    ${cafe.name}
                            </a>
                            <h1 class="cafe_explanation">
                                    ${cafe.explanation}
                            </h1>
                            <h1 class="cafe_member">
                                멤버 : ${cafe.member}
                            </h1>
                        </div>
                    </c:forEach>
                </div>

                <div id="page_wrap">
                    <c:if test="${ph.showPrev}">
                        <a href="<c:url value='/cafe/list?page=${ph.beginPage-1}&keyword=${pc.keyword}&topic=${pc.topic}' />"
                           class="page_item">
                            &laquo;
                        </a>
                    </c:if>

                    <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                        <a href="<c:url value='/cafe/list?page=${i}&keyword=${pc.keyword}&topic=${pc.topic}' />"
                           class="page_item">
                                ${i}
                        </a>
                    </c:forEach>

                    <c:if test="${ph.showNext}">
                        <a href="<c:url value='/cafe/list?page=${ph.endPage+1}&keyword=${pc.keyword}&topic=${pc.topic}' />"
                           class="page_item">
                            &raquo;
                        </a>
                    </c:if>
                </div>
            </div>

            <div id="rightMain">
                <div id="ad1_wrap">
                    광고1
                </div>
                <div id="info_wrap">
                    <c:choose>
                        <c:when test="${loginId != ''}">
                            <div id="info_cafe_area">
                                <a href="<c:url value='/cafe/write' />" id="info_cafe_item">카페생성</a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div id="info_login_area">
                                <a href="<c:url value='/login/login?url=/cafe/list' />" id="info_login_item">Song
                                    로그인</a>
                            </div>
                            <div id="info_add_area">
                                <div class="info_add_item">
                                    <a href="<c:url value='/login/find?mode=id'/>">아이디 찾기</a>
                                </div>
                                <div class="info_add_item">
                                    <a href="<c:url value='/login/find?mode=pwd'/>">비밀번호 찾기</a>
                                </div>
                                <div class="info_add_item">
                                    <a href="<c:url value='/register/add'/>">회원가입</a>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div id="ad2_wrap">
                    광고2
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $('#topic_click_left1').click(function () {
        $('#topic_wrap1').scrollLeft($('#topic_wrap1').scrollLeft() - 200)
    })

    $('#topic_click_right1').click(function () {
        $('#topic_wrap1').scrollLeft($('#topic_wrap1').scrollLeft() + 200)
    })

    $('#topic_click_left2').click(function () {
        $('#topic_wrap2').scrollLeft($('#topic_wrap2').scrollLeft() - 200)
    })

    $('#topic_click_right2').click(function () {
        $('#topic_wrap2').scrollLeft($('#topic_wrap2').scrollLeft() + 200)
    })


    $('#region1_click_left').click(function () {
        $('#region1_wrap').scrollLeft($('#region1_wrap').scrollLeft() - 200)
    })

    $('#region1_click_right').click(function () {
        $('#region1_wrap').scrollLeft($('#region1_wrap').scrollLeft() + 200)
    })

    $('#region2_click_left').click(function () {
        $('#region2_wrap').scrollLeft($('#region2_wrap').scrollLeft() - 200)
    })

    $('#region2_click_right').click(function () {
        $('#region2_wrap').scrollLeft($('#region2_wrap').scrollLeft() + 200)
    })
</script>

</body>
</html>
