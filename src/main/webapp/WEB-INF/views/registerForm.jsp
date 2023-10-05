<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<c:url value="/register/add" var="insertUrl"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>registerForm</title>
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
            min-width: 550px;
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
            width: 500px;
        }

        #logo_wrap {
            padding-top: 15px;

            padding-bottom: 25px;
        }

        #logo_area {
            width: 200px;
            height: 80px;
            font-size: 65px;
            font-weight: 900;
            text-align: center;
        }

        #mainContainer {}

        #main_outter {}

        #main_inner {
            width: 550px;
        }

        #reg_wrap {
            height: 600px;
            display: flex;
            align-items: center;
            border: 1px solid black;
        }

        #reg_form {
            height: 100%;
            width: 100%;
        }

        .reg_area {
            height: 13%;
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
            align-items: center;
        }

        .reg_error {
            color: red;
        }

        .reg_ipt {
            height: 60%;
            width: 80%;
            margin: 0;
            font-size: 16px;
            padding-left: 15px;
        }

        #reg_btn_area {
            height: 12%;
            width: 80%;
            background-color: rgb(50, 50, 100);
            margin-top: 33px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #reg_btn_area button {
            font-size: 30px;
            font-weight: 900;
            color: white;
        }
    </style>
</head>

<body>

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
            <div id="reg_wrap">
                <%--    회원 가입 화면    --%>
                <%--    회원 가입 버튼 클릭시 요청 - cafeMain.jsp     or     registerForm.jsp  --%>
                <%--    스프링의 form 태그라이브러리 사용  -  HTML 폼에 자바 객체(모델에 있음)와 에러메세지(모델에 있는 BindingResult에 있음)를 쉽게 바인딩  --%>
                <%--    회원가입 실패시 회원가입 화면 유지 + 에러메세지 보여주기    --%>
                <form:form id="reg_form" action="${insertUrl}" modelAttribute="userDto" accept-charset="utf-8">

                    <div id="reg_id_area" class="reg_area">
                        <form:errors cssClass="reg_error" path="id"/>
                        <form:input id="reg_id" cssClass="reg_ipt" path="id" placeholder="아이디" />
                    </div>


                    <div id="reg_pwd_area" class="reg_area">
                        <form:errors cssClass="reg_error" path="pwd"/>
                        <form:password id="reg_pwd" cssClass="reg_ipt" path="pwd" placeholder="비밀번호" />
                    </div>


                    <div id="reg_name_area" class="reg_area">
                        <form:errors cssClass="reg_error" path="name"/>
                        <form:input id="reg_name" cssClass="reg_ipt" path="name" placeholder="이름" />
                    </div>


                    <div id="reg_birth_area" class="reg_area">
                        <form:errors cssClass="reg_error" path="birth"/>
                        <form:input id="reg_birth" cssClass="reg_ipt" path="birth" placeholder="생년월일 8자리" />
                    </div>


                    <div id="reg_email_area" class="reg_area">
                        <form:errors cssClass="reg_error" path="email"/>
                        <form:input id="reg_email" cssClass="reg_ipt" path="email" placeholder="이메일" />
                    </div>


                    <div id="reg_phone_area" class="reg_area">
                        <form:errors cssClass="reg_error" path="phone"/>
                        <form:input id="reg_phone" cssClass="reg_ipt" path="phone" placeholder="휴대전화번호 8자리" />
                    </div>

                    <div id="reg_btn_area">
                        <button type="submit">회원 가입</button>
                    </div>

                </form:form>
            </div>
        </div>
    </div>
</div>

<script>
    let msg = ${msg}

    if (msg == "register_ERR") {
        alert("중복된 아이디 입니다.")
    }
</script>
</body>
</html>