<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="loginId" value="${sessionScope.id}"/>

<html>
<head>
    <title>bulletinForm</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
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

        /* 게시판 생성 */
        #board_wrap {
            display: none;
            position: fixed;
            z-index: 1;
            padding-top: 200px;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0.6);
        }

        #board_form {
            width: 40%;
            height: 70%;
            border: 1px solid black;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background-color: white;
        }

        .board_area {
            width: 100%;
        }


        #board_head_area {
            height: 10%;
            display: flex;
            justify-content: flex-end;
        }

        #board_title_area {
            height: 30%;
            display: flex;
            align-items: center;
        }

        #board_name_area {
            height: 30%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #board_btn_area {
            height: 30%;
            display: flex;
            align-items: center;
        }



        #board_head_item {
            width: 12%;
            margin: 0;
            height: 100%;
            font-size: 15px;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;

        }

        #board_title_item {
            height: 100%;
            display: flex;
            align-items: center;
            font-size: 40px;
        }

        .board_name_item {
            height: 30%;
            margin: 5px;
            padding: 0 10px;
            font-weight: 500;
        }

        #board_btn_item {
            width: 70%;
            height: 50%;
            background-color: rgb(50, 50, 100);
            color: white;
            font-size: 25px;
            font-weight: 600;
        }

        #header {}

        #menu_outter {
            height: 30px;
        }

        #menu_inner {
            width: 1100px;
            height: 100%;
            display: flex;
            justify-content: flex-end;
        }

        #cafeHome_wrap {
            display: flex;
            align-items: center;
            margin: 0 0 0 15px;
            padding: 5px;
        }

        #cafeHome_area {
            font-size: 12px;
        }


        #login_wrap {
            display: flex;
            align-items: center;
            margin: 0 0 0 15px;
        }

        #login_area {
            font-size: 12px;
        }

        #head_outter {
            height: 220px;
            color: white;
        }

        #head_inner {
            background-color: rgb(50, 50, 100);
            height: 100%;
            width: 1100px;
        }

        #cafe_wrap {
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;

        }

        #cafe_area {
            font-size: 100px;
        }

        #mainContainer {}

        #main_outter {}

        #main_inner {
            width: 1100px;
            display: flex;
            justify-content: flex-start;

        }

        #leftMain {
            width: 18%;

        }

        #cafeInfo_wrap {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-start;
            border-bottom: 0.5px solid rgb(180, 180, 180);
            padding: 40px 0;

        }

        #cafeInfo_name {
            width: 80%;
            height: 50px;
            font-size: 13px;
            display: flex;
            align-items: center;
            white-space: nowrap;
            overflow: hidden;
            padding: 1px;
            margin: 4px 0;
            border: 3px solid rgb(50, 50, 100);
        }

        #cafeInfo_info {
            font-size: 13px;
            margin: 4px 0;
            border-bottom: 3px solid rgb(50, 50, 100);

        }

        #loginInfo_wrap {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-start;
            border-bottom: 0.5px solid rgb(180, 180, 180);
            padding: 40px 0;
        }

        .loginInfo_area1 {
            width: 80%;
            font-size: 13px;
            margin: 3px 0;
        }

        .loginInfo_area2 {
            width: 80%;
            height: 30px;
            background-color: rgb(50, 50, 100);
            color: white;
            font-size: 18px;
            display: flex;
            align-items: center;
            margin: 3px 0;
        }

        #bulletinBoardCreate_wrap {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-start;
            border-bottom: 0.5px solid rgb(180, 180, 180);
            padding: 40px 0;


        }

        #bulletinBoardCreate_area {
            width: 80%;
            height: 30px;
            background-color: rgb(50, 50, 100);
            display: flex;
            align-items: center;
            cursor: pointer;
            margin: 3px 0;
        }

        #bulletinBoardCreate_item {
            color: white;
            font-size: 18px;
            font-weight: 500;
        }

        #bulletinBoardInfo_wrap {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-start;
            padding: 40px 0;
        }

        .bulletinBoardInfo_area {
            width: 80%;
            font-size: 13px;
            margin: 4px 0;
        }


        #rightMain {
            width: 82%;
            border-left: 0.5px solid rgb(180, 180, 180);
            border-right: 0.5px solid rgb(180, 180, 180);
        }


        #bulletin_wrap {
            display: flex;
            align-items: center;
            padding: 20px;
            margin-bottom: 30px;
        }

        #bulletin_form {
            height: 700px;
            width: 90%;
        }


        #bulletin_article_area {
            height: 10%;
            display: flex;
            align-items: center;
        }

        #bulletin_board_area {
            height: 7%;
            display: flex;
            align-items: center;
        }

        #bulletin_title_area {
            height: 7%;
            display: flex;
            align-items: center;
        }

        #bulletin_content_area {
            height: 66%;
            display: flex;
            align-items: center;
        }

        #bulletin_button_area {
            height: 10%;
            display: flex;
            align-items: center;
        }

        #bulletin_article_item {
            margin: 0;
            font-size: 30px;
            font-weight: 800;
        }

        #bulletin_board_slt {
            margin: 0;
            height: 80%;
            width: 100%;
            font-size: 16px;
            font-weight: 530;
            padding: 0 20px;
        }

        #bulletin_title_ipt {
            margin: 0;
            height: 80%;
            width: 100%;
            font-size: 16px;
            font-weight: 530;
            padding: 0 20px;
        }

        #bulletin_content_txt {
            margin: 0;
            height: 90%;
            width: 100%;
            font-size: 18px;
            font-weight: 560;
            padding: 20px;

        }

        #bulletin_button_item {
            height: 90%;
            width: 50%;
            color: white;
            font-size: 20px;
            font-weight: 600;
            background-color: rgb(50, 50, 100);
        }



    </style>
</head>
<body>
<div id="board_wrap">
    <form action="<c:url value='/bulletinBoard/add'/>" method="post" id="board_form">
        <div class="board_area" id="board_head_area">
            <h1 id="board_head_item">닫기</h1>
        </div>
        <div class="board_area" id="board_title_area">
            <h1 id="board_title_item">게시판 만들기</h1>
        </div>
        <div class="board_area" id="board_name_area">
            <input type="text" name="name" class="board_name_item" placeholder="게시판 이름 입력하세요">
            <h1 class="board_name_item">게시판</h1>
        </div>
        <div class="board_area" id="board_btn_area">
            <button type="submit" id="board_btn_item">게시판 생성</button>
        </div>
        <input type="hidden" name="cafe_name" value="${pc.cafe_name}">
        <input type="hidden" name="loginId" value="${loginId}">
        <input type="hidden" name="manager_id" value="${manager_id}">

    </form>
</div>

<div id="header">
    <div id="menu_outter">
        <div id="menu_inner">
            <div id="cafeHome_wrap">
                <h1 id="cafeHome_area">
                    <%--    요청 - cafeHome.jsp  --%>
                    <a href="<c:url value='/cafe/list' />">카페홈</a>
                </h1>
            </div>
            <div id="login_wrap">
                <h1 id="login_area">
                    <%--    요청 - cafeHome.jsp  --%>
                    <a href="<c:url value='/login/logout' />">로그아웃</a>
                </h1>
            </div>
        </div>
    </div>
    <div id="head_outter">
        <div id="head_inner">
            <div id="cafe_wrap">
                <h4 id="cafe_area">
                    <%--    cafe_name + 요청 - cafeMain.jsp     --%>
                    <a href="<c:url value='/bulletin/list?cafe_name=${pc.cafe_name}&loginId=${loginId}&manager_id=${manager_id}' />">
                        ${pc.cafe_name}
                    </a>
                </h4>
            </div>
        </div>
    </div>
</div>

<div id="mainContainer">
    <div id="main_outter">
        <div id="main_inner">
            <div id="leftMain">
                <div id="cafeInfo_wrap">
                    <div id="cafeInfo_name">
                        <h1>${pc.cafe_name}</h1>
                    </div>
                    <div id="cafeInfo_info">
                        <a href="<c:url value='/cafe/read?cafe_name=${pc.cafe_name}&loginId=${loginId}&manager_id=${manager_id}'/>">카페정보</a>
                    </div>
                </div>
                <div id="loginInfo_wrap">
                    <c:choose>
                        <%--    카페 가입 상태이면    --%>
                        <c:when test="${joinCafeList.contains(pc.cafe_name)}">
                            <div class="loginInfo_area1">
                                <a href="<c:url value='/bulletin/list?readId=${loginId}&cafe_name=${pc.cafe_name}&loginId=${loginId}&manager_id=${manager_id}' />">내가 쓴 글보기</a>
                            </div>
                            <div class="loginInfo_area1">
                                <a href="<c:url value='/comment/list?readId=${loginId}&cafe_name=${pc.cafe_name}&loginId=${loginId}&manager_id=${manager_id}' />">내가 댓글 쓴 글보기</a>
                            </div>
                            <div class="loginInfo_area2">
                                    <%--    cafe_name, loginId + 요청 - bulletinForm.jsp      --%>
                                    <%--    게시글 등록시 id + cafe_name, 등록후에 cafe_name 필요       --%>
                                <a href="<c:url value='/bulletin/write?cafe_name=${pc.cafe_name}&id=${loginId}&manager_id=${manager_id}'/>">카페글쓰기</a>
                            </div>
                        </c:when>
                        <%--    카페 가입 상태가 아니면    --%>
                        <c:otherwise>
                            <div class="loginInfo_area2">
                                <a href="<c:url value='/cafe/join?join_cafe=${pc.cafe_name}&manager_id=${manager_id}&id=${loginId}' />">카페가입하기</a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>

                <c:if test="${loginId == manager_id}">
                    <div id="bulletinBoardCreate_wrap">
                        <div id="bulletinBoardCreate_area">
                            <h1 id="bulletinBoardCreate_item">
                                게시판 생성하기
                            </h1>
                        </div>
                    </div>
                </c:if>


                <div id="bulletinBoardInfo_wrap">
                    <c:forEach var="bulletin_board" items="${bulletin_boardList}">
                        <div class="bulletinBoardInfo_area">
                            <a href="<c:url value='/bulletin/list?bulletin_board=${bulletin_board}&cafe_name=${pc.cafe_name}&loginId=${loginId}&manager_id=${manager_id}'/>">
                                    ${bulletin_board}
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div id="rightMain">
                <div id="bulletin_wrap">
                    <form:form id="bulletin_form" modelAttribute="bulletinDto">
                        <form:hidden path="bno"/>
                        <form:hidden path="id"/>

                        <div id="bulletin_article_area">
                            <h1 id="bulletin_article_item">게시글 ${mode == "modify" ? "수정하기" : "쓰기"}</h1>
                        </div>

                        <div id="bulletin_board_area" class="bulletin_area">
                            <form:select id="bulletin_board_slt" name="bulletin_board" path="bulletin_board">
                                <form:options items="${bulletin_boardList}"/>
                            </form:select>
                        </div>

                        <div id="bulletin_title_area" class="bulletin_area">
                            <form:input id="bulletin_title_ipt" path="title"/>
                        </div>

                        <div id="bulletin_content_area" class="bulletin_area">
                            <form:textarea id="bulletin_content_txt" path="content"/>
                        </div>

                        <input type="hidden" name="page" value="${pc.page}">
                        <input type="hidden" name="option" value="${pc.option}">
                        <input type="hidden" name="keyword" value="${pc.keyword}">
                        <input type="hidden" name="cafe_name" value="${pc.cafe_name}">
                        <div id="bulletin_button_area">
                            <button type="button" id="bulletin_button_item" onclick="goWriteOrModify()">
                                    ${mode == "modify" ? "수정완료" : "등록"}
                            </button>
                        </div>
                    </form:form>

                </div>
            </div>
        </div>
    </div>
</div>


<script>
    let form = document.getElementById("bulletin_form");

    // 게시글 등록 요청하는 메서드
    const goWriteOrModify = function () {

        form.setAttribute('method', 'post');

        if (${mode == "modify"}) {
            form.setAttribute('action', "<c:url value='/bulletin/modify'/>");
        } else {
            form.setAttribute('action', "<c:url value='/bulletin/write'/>");
        }

        form.submit();
    }

    $("#bulletinBoardCreate_wrap").click(function () {
        $("#board_wrap").css("display", "block")
    })

    $("#board_head_item").click(function () {
        $("#board_wrap").css("display", "none")
    })
</script>
</body>
</html>
