<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<c:set var="loginId" value="${pageContext.request.getSession(false) == null ? '' : pageContext.request.getSession(false).getAttribute('id')}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>loginForm</title>
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
            min-width: 500px;
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
            height: 200px;
            margin-bottom: 35px;
        }

        #head_outter {
            height: 100%;
        }

        #head_inner {
            width: 500px;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: flex-end;
        }

        #logo_wrap {
            width: 200px;
            height: 80px;
            margin: 0;
        }

        #logo_area {
            height: 100%;
            width: 100%;
            font-size: 65px;
            font-weight: 900;
            text-align: center;
        }

        #mainContainer {}

        #main_outter {}

        #main_inner {
            width: 500px;
            display: flex;
            flex-direction: column;

        }

        #login_wrap {
            width: 100%;
            height: 290px;
            border: 1px solid black;
        }

        #login_form {
            width: 80%;
            display: flex;
            flex-direction: column;

        }

        .login_ipt {
            width: 100%;
            height: 50px;
            text-align: left;
            font-size: 15px;
            padding-left: 15px;
            border: none;
            border-left: 1px solid black;
            border-right: 1px solid black;
            border-bottom: 1px solid black;

        }

        #login_id {
            border-top: 1px solid black;
            margin-top: 40px;
        }

        #login_chk_area {
            width: 100%;
            display: flex;
            margin-top: 10px;
        }

        #chk_lbl {
            font-size: 12px;
            margin: 0;
        }

        #login_chk {
            margin: 0 0 0 10px;
        }

        #login_btn {
            background-color: rgb(50, 50, 100);
            width: 100%;
            height: 50px;
            font-size: 25px;
            font-weight: 600;
            color: white;
            margin-top: 30px;
        }

        #add_wrap {
            width: 100%;
            display: flex;
            justify-content: center;
            padding-top: 20px;
        }

        .add_area {
            margin: 0 42px;
            font-size: 13px;
            padding-bottom: 5px;
            border-bottom: 0.5px solid black;


        }
    </style>
</head>
<body>
<%--    상단 로고       --%>
<div id="header">
    <div id="head_outter">
        <div id="head_inner">
            <div id="logo_wrap">
                <div id="logo_area">
                    <%--    클릭시 요청 - cafeHome.jsp     --%>
                    <a href="<c:url value='/' />">
                        song
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="mainContainer">
    <div id="main_outter">
        <div id="main_inner">
            <div id="login_wrap">
                <%--    로그인 버튼 클릭시 아이디와 비번 간단한 체크후 요청    --%>
                <form id="login_form" action="<c:url value='/login/login'/>" method="post"
                      onsubmit="return formCheck(this)">
                    <%--    직전 로그인때 아이디 기억이면 키값이 id, 발루값이 직전 로그인 아이디인 쿠키가 브라우저에 있음     --%>
                    <%--    직전 로그인때 아이디 기억이면 이번 로그인때 아이디창에 아이디 값 입력     --%>
                    <input type="text" id="login_id" class="login_ipt" name="id" placeholder="아이디 입력"
                           value="${cookie.id.value}"
                           autofocus/>

                    <input type="password" id="login_pwd" class="login_ipt" name="pwd" placeholder="비밀번호 입력"/>

                    <div id="login_chk_area">
                        <label for="login_chk" id="chk_lbl">아이디 기억</label>
                        <%--    직전 로그인때 아이디 기억이면 이번 로그인때 아이디 기억 체크박스 체크     --%>
                        <input type="checkbox" id="login_chk" class="login_cbx"
                               name="remember" ${cookie.id.value != null ? 'checked' : ''} />
                    </div>

                    <button type="submit" id="login_btn">로그인</button>


                    <input type="hidden" name="url" value="${url}">
                    <input type="hidden" name="cafe_name" value="${pc.cafe_name}">
                    <input type="hidden" name="bulletin_board" value="${pc.bulletin_board}">
                    <input type="hidden" name="page" value="${pc.page}">
                    <input type="hidden" name="option" value="${pc.option}">
                    <input type="hidden" name="keyword" value="${pc.keyword}">
                    <input type="hidden" name="bno" value="${bno}">
                    <input type="hidden" name="readId" value="${pc.readId}">
                    <input type="hidden" name="manager_id" value="${manager_id}">
                </form>
            </div>

            <div id="add_wrap">
                <div id="id_area" class="add_area">
                    <a href="<c:url value='/login/find?mode=id'/>">아이디 찾기</a>
                </div>
                <div id="pwd_area" class="add_area">
                    <a href="<c:url value='/login/find?mode=pwd'/>">비밀번호 찾기</a>
                </div>
                <div id="register_area" class="add_area">
                    <a href="<c:url value='/register/add'/>">회원가입</a>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    //  에러메시지를 박스에 넣어주고 원인 요소로 커서 옮겨주는 메서드
    function setMessage(msg, element) {
        <%--document.getElementById("msg").innerHTML = ` ${'${msg}'}`;--%>
        //  박스에 에러메시지 넣기
        document.getElementById("msg").innerHTML = msg;

        //  요소로 커서 옮기기
        if (element) {
            element.select();
        }
    }

    //  아이디와 비번 서버로 요청보내기전 1차적으로 체크하는 메서드
    function formCheck(frm) {

        //  아이디의 길이가 0이면
        if (frm.id.value.length == 0) {
            setMessage('아이디를 입력하세요', frm.id);
            return false;
        }

        //  비밀번호의 길이가 0이면
        if (frm.pwd.value.length == 0) {
            setMessage('비밀번호를 입력하세요', frm.pwd);
            return false;
        }

        return true;
    }


</script>
</body>
</html>