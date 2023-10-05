<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="loginId" value="${sessionScope.id}"/>

<!DOCTYPE html>
<html lang="">
<head>
    <meta charset="utf-8">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <title>bulletinComment</title>
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
            margin-top: 50px;
        }

        #bulletin_form {
            width: 90%;
            height: 90%;
        }

        .bulletin_area {}

        #bulletin_board_area {}

        #bulletin_title_area {
            padding-top: 20px;
        }

        #bulletin_id_area {
            padding: 20px 0;
            border-bottom: 0.5px solid rgb(180, 180, 180);
        }

        #bulletin_content_area {
            padding: 30px 0;
            border-bottom: 0.5px solid rgb(180, 180, 180);

        }

        #bulletin_button_area {
            padding: 20px 0;
            border-bottom: 0.5px solid rgb(180, 180, 180);

        }



        #bulletin_board_ipt {
            border: none;
            font-size: 14px;
        }

        #bulletin_title_ipt {
            width: 100%;
            font-size: 30px;
            border: none;

        }

        #bulletin_id_ipt {
            width: 100%;
            font-size: 16px;
            border: none;
        }

        #bulletin_content_txt {
            width: 100%;
            font-size: 20px;
            border: none;
            outline-color: white;
        }

        .bulletin_button_item {
            margin-right: 10px;
            font-size: 14px;
        }











        #comment_wrap {
            margin-top: 40px;
        }

        .comment_cno_area {
            width: 90%;
            border: 0.5px solid rgb(180, 180, 180);
        }

        .comment_pcno_area {
            width: 90%;
            border: 0.5px solid rgb(180, 180, 180);

        }

        .comment_pcno_area .comment_id,
        .comment_pcno_area .comment_comment,
        .comment_pcno_area .comment_items {
            margin-left: 50px;
        }


        .comment_id {
            font-size: 13px;
            font-weight: 600;
            padding: 5px 10px;
        }

        .comment_comment {
            font-size: 13px;
            padding: 5px 10px;
        }

        .comment_items {
            display: flex;
            justify-content: center;
            padding: 5px 10px;
        }

        .comment_upDate {
            margin-left: 0;
            font-size: 10px;
            font-weight: 400;
            color: gray;
        }

        .comment_rmvBtn {
            font-size: 12px;
            margin: 0 6px 0 0;

        }

        .comment_modBtn {
            font-size: 12px;
            margin: 0 6px 0 0;


        }

        .comment_repBtn {
            font-size: 12px;
            margin: 0;

        }












        #commentWrt_wrap {
            width: 100%;
            margin-top: 40px;
            margin-bottom: 200px;
        }

        #commentWrt_area {
            width: 90%;
            border: 0.5px solid rgb(180, 180, 180);
        }

        #commentWrt_txt {
            height: 65px;
            width: 100%;
            border: none;
            padding: 15px;
            font-size: 14px;
            outline-color: rgb(180, 180, 180);
        }

        #commentWrt_btn {
            width: 100%;
            text-align: right;
            padding: 10px;
            padding-top: 0;

        }

        #commentMdf_wrap {
            display: none;
            width: 100%;
            margin-top: 30px;
            margin-bottom: 60px;
        }

        #commentMdf_area {
            width: 90%;
            border: 0.5px solid rgb(180, 180, 180);
        }

        #commentMdf_txt {
            height: 65px;
            width: 100%;
            border: none;
            padding: 15px;
            font-size: 14px;
            outline-color: rgb(180, 180, 180);

        }

        #commentMdf_btn {
            width: 100%;
            text-align: right;
            padding: 10px;
            padding-top: 0;

        }

        #commentRpl_wrap {
            display: none;
            width: 100%;
            margin-top: 30px;
            margin-bottom: 60px;
        }

        #commentRpl_area {
            width: 90%;
            border: 0.5px solid rgb(180, 180, 180);
        }

        #commentRpl_txt {
            height: 65px;
            width: 100%;
            border: none;
            padding: 15px;
            font-size: 14px;
            outline-color: rgb(180, 180, 180);

        }

        #commentRpl_btn {
            width: 100%;
            text-align: right;
            padding: 10px;
            padding-top: 0;

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
                    <%--    js에서 form 요청을 보내기   --%>
                    <form action="" id="bulletin_form">

                        <div id="bulletin_board_area" class="bulletin_area">
                            <input type="text" id="bulletin_board_ipt" class="bulletin_ipt" name="bulletin_board"
                                   value="${bulletinDto.bulletin_board}">
                        </div>

                        <div id="bulletin_title_area" class="bulletin_area">
                            <input type="text" id="bulletin_title_ipt" class="bulletin_ipt" name="title"
                                   value="${bulletinDto.title}" readonly='readonly'>
                        </div>

                        <div id="bulletin_id_area" class="bulletin_area">
                            <input type="text" id="bulletin_id_ipt" class="bulletin_ipt" name="readId"
                                   value="${bulletinDto.id}" readonly='readonly' onclick="goUser()">
                        </div>
                        <div id="bulletin_content_area" class="bulletin_area">
                            <textarea rows="20" id="bulletin_content_txt" class="bulletin_txt" name="content"
                                      readonly='readonly'>${bulletinDto.content}</textarea>
                        </div>
                        <div id="bulletin_button_area" class="bulletin_area">
                            <c:if test="${loginId == bulletinDto.id}">
                                <button type="button" class="bulletin_button_item" onclick="goModify()">수정</button>
                                <button type="button" class="bulletin_button_item" onclick="goDelete()">삭제</button>
                            </c:if>
                            <button type="button" class="bulletin_button_item" onclick="goList()">목록</button>
                        </div>

                        <%--    post 요청시 필요 정보들을 hidden으로 다 숨겨놓음   --%>
                        <input type="hidden" name="page" value="${pc.page}">
                        <input type="hidden" name="option" value="${pc.option}">
                        <input type="hidden" name="keyword" value="${pc.keyword}">
                        <input type="hidden" name="cafe_name" value="${pc.cafe_name}">
                        <input type="hidden" name="bulletin_board" value="${pc.bulletin_board}">
                        <input type="hidden" name="bno" value="${bulletinDto.bno}">
                        <input type="hidden" name="manager_id" value="${manager_id}">
                        <%--    js에서 서버 세션에 접근 불가능 하므로 세션에 있는 아이디를 hidden으로 가져오기    --%>
                        <input type="hidden" name="id" value="${loginId}">
                    </form>
                </div>

                <div id="comment_wrap"></div>

                <div id="commentWrt_wrap">
                    <div id="commentWrt_area">
                            <textarea name="comment" id="commentWrt_txt" cols="30" rows="3"
                                      placeholder="댓글을 입력하세요"></textarea>
                        <button type="button" id="commentWrt_btn">등록</button>
                    </div>
                </div>
                <div id="commentRpl_wrap">
                    <div id="commentRpl_area">
                            <textarea name="comment" id="commentRpl_txt" cols="30" rows="3"
                                      placeholder="답글을 입력하세요"></textarea>
                        <button type="button" id="commentRpl_btn">등록</button>
                    </div>
                </div>

                <div id="commentMdf_wrap">
                    <div id="commentMdf_area">
                            <textarea name="comment" id="commentMdf_txt" cols="30" rows="3"
                                      placeholder="댓글을 입력하세요"></textarea>
                        <button type="button" id="commentMdf_btn">등록</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    let msg = "${msg}"

    if (msg == "bulletinMDF_OK") {
        alert("게시글 수정 성공")
    }

    // 게시글 관련
    //  form(게시글) 정보를 가져옴
    let form = document.getElementById("bulletin_form");

    //  사용자 정보 요청 메서드
    const goUser = function () {
        window.location.href = "<c:url value='/user/show?readId=${bulletinDto.id}&cafe_name=${pc.cafe_name}&loginId=${loginId}&manager_id=${manager_id}'/>"
    }

    //  목록 요청 메서드
    const goList = function () {
        //  사용자 모드일때
        if (${mode=='user'}) {
            window.location.href = "<c:url value='/bulletin/list?readId=${pc.readId}&page=${pc.page}&cafe_name=${pc.cafe_name}&loginId=${loginId}&manager_id=${manager_id}' />";
        }
        //  사용자 모드가 아닐때
        else {
            window.location.href = "<c:url value='/bulletin/list?page=${pc.page}&option=${pc.option}&keyword=${pc.keyword}&cafe_name=${pc.cafe_name}&bulletin_board=${pc.bulletin_board}&loginId=${loginId}&manager_id=${manager_id}' />";
        }
    }

    //  게시글 삭제 요청 메서드
    const goDelete = function () {
        form.setAttribute('method', 'get');
        form.setAttribute('action', "<c:url value='/bulletin/delete' />");
        form.submit();
    }

    //  게시글 수정 요청 메서드
    const goModify = function () {
        form.setAttribute('method', 'get');
        form.setAttribute('action', "<c:url value='/bulletin/modify' />");
        form.submit();
    }


    //  댓글 관련
    //  필요 정보 가져오기
    let bno = "${bulletinDto.bno}";
    let id = "${sessionScope.id}";
    let cafe_name = "${pc.cafe_name}"
    let bulletin_board = "${pc.bulletin_board}"

    //  date 타입 변환
    const dateToString = function dateToString(date) {
    }


    //  댓글들을 보여주는 메서드
    const showComments = function showComments() {

        //  비동기 요청 보내기
        $.ajax({
            type: 'GET',
            url: '/song/comments?bno=' + bno,
            //  결과로 댓글들이 들어있는 list를 받아옴
            success: function (result) {
                if (result != null) {
                    //  html 문법으로 변환후 넣어주기
                    $("#comment_wrap").html(toHtml(result));
                } else {
                    alert("error - comment")
                }

            },
            error: function () {
                alert("error - ajax");
            }
        });
    }

    //  댓글들이 들어있는 list를 html문서로 변환 해주는 메서드
    const toHtml = function toHtml(comments) {
        let tmp = '';
        comments.forEach(function (comment) {
            tmp += '<div data-cno=' + comment.cno
            tmp += ' data-pcno=' + comment.pcno
            tmp += ' data-bno=' + comment.bno
            if (comment.cno !== comment.pcno) {
                tmp += ' class="comment_pcno_area"'
            } else {
                tmp += ' class="comment_cno_area"'
            }

            tmp += '>'
            tmp += ' <div class="comment_id">' + comment.id + '</div>'
            tmp += ' <div class="comment_comment">' + comment.comment + '</div>'
            tmp += ' <div class="comment_items">'
            tmp += ' <h1 class="comment_upDate">' + comment.up_date + '</h1>'
            if (id === comment.id) {
                tmp += ' <button class="comment_rmvBtn">삭제</button>'
                tmp += ' <button class="comment_modBtn">수정</button>'
            }
            tmp += ' <button class="comment_repBtn">답글</button>'
            tmp += '</div>'
            tmp += '</div>'
        })

        return tmp;
    }

    $(document).ready(function () {

        showComments();

        $("#bulletinBoardCreate_wrap").click(function () {
            $("#board_wrap").css("display", "block")
        })

        $("#board_head_item").click(function () {
            $("#board_wrap").css("display", "none")
        })

        //  댓글 등록 하는 메서드
        $("#commentWrt_btn").click(function () {

            //  수정 + 답글 화면 원래 위치로 초기화
            $("#commentMdf_wrap").appendTo($("#rightMain"));
            $("#commentRpl_wrap").appendTo($("#rightMain"));
            $("#commentRpl_wrap").css("display", "none");
            $("#commentMdf_wrap").css("display", "none");

            //  댓글창에 입력된 내용 가져오기 + 초기화
            let comment = $("#commentWrt_txt").val();
            $("#commentWrt_txt").val('')

            // 내용이 없으면 메서드 종료
            if (comment.trim() == '') {
                alert('댓글을 입력하세요')
                return;
            }

            //  비동기 요청 보내기
            $.ajax({
                method: 'POST',
                url: '/song/comments?bno=' + bno,
                headers: {"content-type": "application/json"},
                data: JSON.stringify({
                    cafe_name: cafe_name,
                    bulletin_board: bulletin_board,
                    comment: comment,
                    id: id
                }),
                //  결과로 숫자형 받아옴
                success: function (result) {
                    // 댓글 정보 새로고침
                    showComments();
                },
                error: function () {
                    alert("댓글 등록 실패")
                }
            })

        })

        //  댓글 수정하는 메서드
        $("#commentMdf_btn").click(function () {

            //  수정 + 답글 화면 원래 위치로 초기화
            $("#commentMdf_wrap").appendTo($("#rightMain"));
            $("#commentRpl_wrap").appendTo($("#rightMain"));
            $("#commentRpl_wrap").css("display", "none");
            $("#commentMdf_wrap").css("display", "none");

            //  수정된 댓글 내용 + 댓글 번호 가져옴
            let comment = $("#commentMdf_txt").val()
            let cno = $("#commentMdf_txt").attr("data-cno")

            $.ajax({
                method: 'PATCH',
                url: '/song/comments/' + cno + '?bno=' + bno,
                headers: {'content-type': 'application/json'},
                data: JSON.stringify({comment: comment, id: id}),
                //  결과로 숫자형 받아옴
                success: function (result) {

                    // 댓글 정보 새로고침
                    showComments();

                },
                error: function () {
                    alert("댓글 수정 실패")
                }
            })


        })

        //  답글 등록하는 메서드
        $("#commentRpl_btn").click(function () {

            //  수정 + 답글 화면 원래 위치로 초기화
            $("#commentMdf_wrap").appendTo($("#rightMain"));
            $("#commentRpl_wrap").appendTo($("#rightMain"));
            $("#commentRpl_wrap").css("display", "none");
            $("#commentMdf_wrap").css("display", "none");

            //  답글 내용 + 저장된 pcno 가져오기
            let comment = $("#commentRpl_txt").val();
            let pcno = $("#commentRpl_wrap").attr('data-pcno');

            //  답글 내용이 없으면 리턴
            if (comment.trim() === '') {
                alert('답글을 입력하세요')
                return;
            }

            //  비동기 요청
            $.ajax({
                method: 'POST',
                url: '/song/comments?bno=' + bno,
                headers: {'content-type': 'application/json'},
                data: JSON.stringify({
                    cafe_name: cafe_name,
                    bulletin_board: bulletin_board,
                    pcno: pcno,
                    comment: comment,
                    id: id
                }),
                success: function (result) {
                    showComments();
                },
                error: function () {
                    alert("답글 등록 실패")
                }
            })
        })

        //  댓글 삭제하는 메서드
        $("#comment_wrap").on("click", ".comment_rmvBtn", function () {

            //  수정 + 답글 화면 원래 위치로 초기화
            $("#commentMdf_wrap").appendTo($("#rightMain"));
            $("#commentRpl_wrap").appendTo($("#rightMain"));
            $("#commentRpl_wrap").css("display", "none");
            $("#commentMdf_wrap").css("display", "none");

            //  현재 댓글의 cno 얻어오기
            let cno = $(this).parent().parent().attr("data-cno");

            $.ajax({
                method: 'DELETE',
                url: '/song/comments/' + cno + '?bno=' + bno,
                headers: {"content-type": "application/json"},
                data: JSON.stringify({id: id}),
                //  결과로 숫자형 받아옴
                success: function () {
                    showComments();
                },
                error: function () {
                    alert('댓글 삭제 실패');
                }
            })
        });


        //  댓글 수정 화면 보여주는 메서드
        $("#comment_wrap").on("click", ".comment_modBtn", function () {

            //  답글 화면 원래 위치로 초기화
            $("#commentRpl_wrap").appendTo($("#rightMain"));
            $("#commentRpl_wrap").css("display", "none");

            //  현재 댓글 내용 + 현재 댓글 cno 가져오기
            let comment = $(".comment_comment", $(this).parent().parent()).text();
            let cno = $(this).parent().parent().attr("data-cno");

            //  수정창에 댓글 내용 뿌리기 + cno 저장,    수정박스 옮기기 + 보여주기
            $("#commentMdf_txt").val(comment);
            $("#commentMdf_txt").attr('data-cno', cno);
            $("#commentMdf_wrap").appendTo($("div[data-cno=" + cno + "]"));
            $("#commentMdf_wrap").css("display", "block");
        });


        //  댓글 답글 화면 보여주는 메서드
        $("#comment_wrap").on("click", ".comment_repBtn", function () {

            //  수정 화면 원래 위치로 초기화
            $("#commentMdf_wrap").appendTo($("#rightMain"));
            $("#commentMdf_wrap").css("display", "none");

            //  이댓글의 pcno + cno 가져오기
            let pcno = $(this).parent().parent().attr("data-pcno");
            let cno = $(this).parent().parent().attr("data-cno");

            $("#commentRpl_txt").val('');
            $("#commentRpl_wrap").attr("data-pcno", pcno);
            $("#commentRpl_wrap").attr("data-bno", bno);
            $("#commentRpl_wrap").appendTo($("div[data-cno=" + cno + "]"));
            $("#commentRpl_wrap").css("display", "block");
        });

    })

</script>
</body>
</html>