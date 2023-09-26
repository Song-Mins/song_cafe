<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--    <%@ page session="false"%>                                                                                  --%>
<%--    이페이지에서는 세션을 생성하지 않으므로(세션이 있다고해서 없애지는 않음)                                                 --%>
<%--    ${sessionScope.id}이렇게 바로접근 불가                                                                          --%>
<%--    <c:set var="loginId" value="${pageContext.request.getSession(false) == null ? '' : sessionScope.id}" />     --%>

<%@ page session="false" %>
<c:set var="loginId"
       value="${pageContext.request.getSession(false) == null ? '' : pageContext.request.getSession(false).getAttribute('id')}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>

    <title>cafeMain</title>
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
            white-space: nowrap;
            overflow: hidden;
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
            margin-bottom: 80px;
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
            margin-bottom: 40px;
        }



        #userInfo_wrap {
            display: flex;
            align-items: center;
            padding: 30px 0;
        }

        #userInfo_area {
            width: 90%;
            font-size: 25px;
        }

        #user_wrap {
            width: 90%;
            display: flex;
        }

        .user_area {
            font-size: 13px;
            border-bottom: 0.5px solid rgb(180, 180, 180);
            margin: 0 20px 30px 0;
        }


        #bulletinBoard_wrap {
            display: flex;
            align-items: center;
            padding: 30px 0;
        }

        #bulletinBoard_area {
            width: 90%;
            font-size: 25px;
        }

        #search_wrap {
            padding-bottom: 30px;
        }

        #search_form {
            width: 90%;
            height: 30px;
            display: flex;
            justify-content: center;
            align-items: center;

        }

        .search_slt {
            height: 100%;
            margin: 0 10px 0 0;
            padding: 0 10px;

        }

        .search_ipt {
            height: 100%;
            width: 30%;
            margin: 0;
            padding: 0 10px;
        }

        .search_btn {
            height: 100%;
            width: 6%;
            color: white;
            font-size: 14px;
            margin: 0;
            background-color: rgb(50, 50, 100);
        }

        #bulletin_wrap {}

        #bulletin_table {
            width: 90%;
            border-collapse: collapse;
        }

        th,
        td {
            text-align: left;
            border-bottom: 0.5px solid rgb(180, 180, 180);
            border-top: 0.5px solid rgb(180, 180, 180);
        }

        th {
            height: 50px;
            font-size: 15px;
        }

        td {
            height: 40px;
            font-size: 12px;
        }

        .bulletin_delete {
            width: 7%;
            white-space: nowrap;
            overflow: hidden;
        }

        .bulletin_title {
            width: 56%;
            white-space: nowrap;
            overflow: hidden;
        }

        .bulletin_id {
            width: 15%;
            white-space: nowrap;
            overflow: hidden;
        }


        .bulletin_regDate {
            width: 8%;
            white-space: nowrap;
            overflow: hidden;
        }

        .bulletin_viewCnt {
            width: 7%;
            text-align: center;
            white-space: nowrap;
            overflow: hidden;
        }

        .bulletin_commentCnt {
            width: 7%;
            text-align: center;
            white-space: nowrap;
            overflow: hidden;
        }


        #page_wrap {
            height: 35px;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 40px 0;

        }

        .page_item {
            font-size: 15px;
            margin: 0 10px;

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
                    <c:if test="${loginId != ''}">
                        <%--    요청 - cafeHome.jsp  --%>
                        <a href="<c:url value='/login/logout' />">로그아웃</a>
                    </c:if>
                    <c:if test="${loginId == ''}">
                        <%--    url, cafe_name + 요청 - loginForm.jsp    --%>
                        <%--    로그인 성공후 원래 카페로 돌아오기 위해     --%>
                        <a href="<c:url value='/login/login?url=/bulletin/list&cafe_name=${pc.cafe_name}&manager_id=${manager_id}' />">로그인</a>
                    </c:if>
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
                        <%--    로그인 상태면    --%>
                        <c:when test="${loginId != ''}">
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
                        </c:when>

                        <%--    로그인 상태가 아니면    --%>
                        <c:otherwise>
                            <div class="loginInfo_area2">
                                <a href="<c:url value='/login/login?url=/bulletin/list&cafe_name=${pc.cafe_name}&manager_id=${manager_id}' />">로그인</a>
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
                <c:choose>
                    <%--    사용자 정보 모드일때     --%>
                    <c:when test="${mode == 'userBulletin' || mode == 'userComment'}">
                        <div id="userInfo_wrap">
                            <h4 id="userInfo_area">
                                    ${pc.readId} 님 <c:if test="${mode == 'userBulletin'}"> 작성글</c:if><c:if test="${mode == 'userComment'}"> 댓글단 글</c:if>
                            </h4>
                        </div>
                        <div id="user_wrap">
                            <div class="user_area">
                                    <%--    readId, cafe_name + 요청 - cafeMain.jsp   --%>
                                <a href="<c:url value='/bulletin/list?readId=${pc.readId}&cafe_name=${pc.cafe_name}&loginId=${loginId}&manager_id=${manager_id}' />">작성글</a>
                            </div>
                            <div class="user_area">
                                    <%--    readId, cafe_name + 요청 - cafeMain.jsp   --%>
                                <a href="<c:url value='/comment/list?readId=${pc.readId}&cafe_name=${pc.cafe_name}&loginId=${loginId}&manager_id=${manager_id}' />">댓글단
                                    글</a>
                            </div>
                            <c:if test="${loginId == manager_id}">
                                <div class="user_area">
                                    <a href="<c:url value="/cafe/delete?readId=${pc.readId}&cafe_name=${pc.cafe_name}&loginId=${loginId}&manager_id=${manager_id}" />">회원
                                        강퇴
                                    </a>
                                </div>
                            </c:if>
                        </div>
                    </c:when>

                    <%--    사용자 정보 모드 아닐때       --%>
                    <c:otherwise>
                        <div id="bulletinBoard_wrap">
                            <h4 id="bulletinBoard_area">
                                    ${pc.bulletin_board}
                            </h4>
                        </div>

                        <div id="search_wrap">
                                <%--    option, keyword, cafe_name + 요청 - cafeMain.jsp       --%>
                            <form action="<c:url value='/bulletin/list'/>" method="get" id="search_form">

                                    <%--    검색 후 검색창을 유지시켜주기   --%>
                                <select name="bulletin_board" class="search_slt">
                                    <c:forEach var="bulletin_board" items="${bulletin_boardList}">
                                        <option value="${bulletin_board}" ${pc.bulletin_board == bulletin_board ? 'selected' : ''}>${bulletin_board}</option>
                                    </c:forEach>
                                </select>

                                <select name="option" class="search_slt">
                                    <option value="A" ${pc.option == 'A' ? 'selected' : ''}>제목+내용</option>
                                    <option value="T" ${pc.option == 'T' ? 'selected' : ''}>제목</option>
                                    <option value="W" ${pc.option == 'C' ? 'selected' : ''}>내용</option>
                                </select>
                                <input type="text " name="keyword" value="${pc.keyword}" class="search_ipt">

                                    <%--    요청시 필요 정보 숨기기   --%>
                                <input type="hidden" name="cafe_name" value="${pc.cafe_name}">
                                <input type="hidden" name="manager_id" value="${manager_id}">
                                <input type="hidden" name="loginId" value="${loginId}">

                                <button type="submit" class="search_btn">검색</button>
                            </form>
                        </div>
                    </c:otherwise>
                </c:choose>

                <div id="bulletin_wrap">
                    <table id="bulletin_table">
                        <thead>
                        <tr>
                            <c:if test="${loginId == manager_id}">
                                <th class="bulletin_delete">관리</th>
                            </c:if>

                            <th class="bulletin_title">제목</th>
                            <th class="bulletin_id">글쓴이</th>
                            <th class="bulletin_regDate">작성일</th>
                            <th class="bulletin_viewCnt">조회</th>
                            <th class="bulletin_commentCnt">댓글</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="bulletin" items="${bulletinDtoLIst}">
                            <tr>
                                <c:if test="${loginId == manager_id}">
                                    <td class="bulletin_delete">
                                        <a href="<c:url value='/bulletin/delete?bno=${bulletin.bno}&page=${ph.pc.page}&option=${ph.pc.option}&keyword=${ph.pc.keyword}&cafe_name=${ph.pc.cafe_name}&manager_id=${manager_id}' />">
                                            삭제
                                        </a>
                                    </td>
                                </c:if>

                                <td class="bulletin_title">
                                        <%--    bno, PageCondition + 요청 - bulletinComment.jsp   or   loginForm.jsp    --%>
                                        <%--    게시글을 읽어오기 위해, 게시글의 목록버튼 클릭시 원래 보던 카페 + 카페 상태로 돌아오기 위해   --%>
                                    <a href="<c:url value='/bulletin/read?bno=${bulletin.bno}&page=${ph.pc.page}&option=${ph.pc.option}&keyword=${ph.pc.keyword}&cafe_name=${ph.pc.cafe_name}&bulletin_board=${ph.pc.bulletin_board}&loginId=${loginId}&manager_id=${manager_id}' />">
                                            ${bulletin.title}
                                    </a>
                                </td>
                                <td class="bulletin_id">
                                        <%--    readId, url, cafe_name + 요청 - userShow.jsp     or      loginForm.jsp    --%>
                                        <%--    사용자 정보 가져오기 위해, 로그인 성공후 userShow.jsp로 가기 위해, 어느 카페인지 기억하기 위해  --%>
                                    <a href="<c:url value='/user/show?readId=${bulletin.id}&url=/bulletin/list&cafe_name=${ph.pc.cafe_name}&loginId=${loginId}&manager_id=${manager_id}' />">
                                            ${bulletin.id}
                                    </a>
                                </td>
                                <td class="bulletin_regDate">
                                    <fmt:formatDate value="${bulletin.reg_date}" pattern="yyyy.MM.dd."/>
                                </td>
                                <td class="bulletin_viewCnt">${bulletin.view_cnt}</td>
                                <td class="bulletin_commentCnt">${bulletin.comment_cnt}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div id="page_wrap">
                    <c:choose>
                        <%--    사용자 게시글 모드 일때   --%>
                        <c:when test="${mode == 'userBulletin'}">
                            <c:if test="${ph.showPrev}">
                                <a href="<c:url value='/bulletin/list?readId=${pc.readId}&page=${ph.beginPage-1}&cafe_name=${pc.cafe_name}&loginId=${loginId}&manager_id=${manager_id}' /> "
                                   class="page_item">
                                    &laquo;
                                </a>
                            </c:if>

                            <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                                <a href="<c:url value='/bulletin/list?readId=${pc.readId}&page=${i}&cafe_name=${pc.cafe_name}&loginId=${loginId}&manager_id=${manager_id}' />"
                                   class="page_item">
                                        ${i}
                                </a>
                            </c:forEach>

                            <c:if test="${ph.showNext}">
                                <a href="<c:url value='/bulletin/list?readId=${pc.readId}&page=${ph.endPage+1}&cafe_name=${pc.cafe_name}&loginId=${loginId}&manager_id=${manager_id}' />"
                                   class="page_item">
                                    &raquo;
                                </a>
                            </c:if>
                        </c:when>
                        <%--    사용자 댓글 모드 일때    --%>
                        <c:when test="${mode == 'userComment'}">
                            <c:if test="${ph.showPrev}">
                                <a href="<c:url value='/comment/list?readId=${pc.readId}&page=${ph.beginPage-1}&cafe_name=${pc.cafe_name}&loginId=${loginId}&manager_id=${manager_id}' />"
                                   class="page_item">
                                    &laquo;
                                </a>
                            </c:if>

                            <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                                <a href="<c:url value='/comment/list?readId=${pc.readId}&page=${i}&cafe_name=${pc.cafe_name}&loginId=${loginId}&manager_id=${manager_id}' />"
                                   class="page_item">
                                        ${i}
                                </a>
                            </c:forEach>

                            <c:if test="${ph.showNext}">
                                <a href="<c:url value='/comment/list?readId=${pc.readId}&page=${ph.endPage+1}&cafe_name=${pc.cafe_name}&loginId=${loginId}&manager_id=${manager_id}' />"
                                   class="page_item">
                                    &raquo;
                                </a>
                            </c:if>
                        </c:when>
                        <%--    사용자 모드가 아닐때--%>
                        <c:otherwise>
                            <c:if test="${ph.showPrev}">
                                <a href="<c:url value='/bulletin/list?page=${ph.beginPage-1}&option=${ph.pc.option}&keyword=${ph.pc.keyword}&cafe_name=${pc.cafe_name}&bulletin_board=${pc.bulletin_board}&loginId=${loginId}&manager_id=${manager_id}' />"
                                   class="page_item">
                                    &laquo;
                                </a>
                            </c:if>

                            <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                                <a href="<c:url value='/bulletin/list?page=${i}&option=${ph.pc.option}&keyword=${ph.pc.keyword}&cafe_name=${pc.cafe_name}&bulletin_board=${pc.bulletin_board}&loginId=${loginId}&manager_id=${manager_id}' />"
                                   class="page_item">
                                        ${i}
                                </a>
                            </c:forEach>

                            <c:if test="${ph.showNext}">
                                <a href="<c:url value='/bulletin/list?page=${ph.endPage+1}&option=${ph.pc.option}&keyword=${ph.pc.keyword}&cafe_name=${pc.cafe_name}&bulletin_board=${pc.bulletin_board}&loginId=${loginId}&manager_id=${manager_id}' />"
                                   class="page_item">
                                    &raquo;
                                </a>
                            </c:if>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    let msg = "${msg}"

    if (msg == "cafeWRT_OK") {
        alert("카페 생성 성공")
    }
    if (msg == "cafeJOIN_OK") {
        alert("카페 가입 성공")
    }
    if (msg == "bulletinDLT_OK") {
        alert("게시글 삭제 성공")
    }
    if (msg == "bulletinWRT_OK") {
        alert("게시글 등록 성공")
    }
    if (msg == "bulletin_boardADD_ERR") {
        alert("중복된 게시판 이름 입니다.")
    }
    if (msg == "bulletin_boardWRT_ERR") {
        alert("게시판 생성 실패")
    }
    if (msg == "userDLT_OK") {
        alert("강퇴 성공")
    }
    if (msg == "cafeJoin") {
        alert("카페에 가입 하세요")
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

