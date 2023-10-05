<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <title>loginFind</title>
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

        #header {}

        #head_outter {}

        #head_inner {
            width: 500px;
        }

        #logo_wrap {
            padding-top: 75px;
            padding-bottom: 50px;
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
            width: 500px;
        }

        #id_wrap {
            display: block;
            height: 400px;
            width: 100%;
            padding: 20px 0;
            border: 1px solid black;
        }

        .id_area {
            height: 25%;
            display: flex;
            align-items: center;
        }

        .id_item {
            height: 60%;
            width: 80%;
            font-size: 15px;
            padding-left: 15px;
        }

        #id_button {
            background-color: rgb(50, 50, 100);
            color: white;
            font-size: 22px;
            font-weight: 600;
        }



        #pwd_wrap {
            display: none;
            height: 450px;
            width: 100%;
            padding: 20px 0;
            border: 1px solid black;
        }

        .pwd_area {
            height: 20%;
            display: flex;
            align-items: center;
        }

        .pwd_item {
            height: 60%;
            width: 80%;
            font-size: 15px;
            padding-left: 15px;
        }

        #pwd_button {
            background-color: rgb(50, 50, 100);
            color: white;
            font-size: 22px;
            font-weight: 600;
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

        #pwd_result {
            height: 100%;
            display: flex;
            align-items: center;
            font-size: 15px;
        }

        #id_result {
            height: 100%;
            display: flex;
            align-items: center;
            font-size: 15px;
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
            <div id="id_wrap">
                <div class="id_area">
                    <input type="text" id="id_name" class="id_item" placeholder="이름">
                </div>
                <div class="id_area">
                    <input type="text" id="id_phone" class="id_item" placeholder="전화번호">
                </div>
                <div class="id_area">
                    <input type="text" id="id_email" class="id_item" placeholder="이메일">
                </div>
                <div class="id_area">
                    <button id="id_button" class="id_item">아이디 찾기</button>
                </div>
            </div>

            <div id="pwd_wrap">
                <div class="pwd_area">
                    <input type="text" id="pwd_id" class="pwd_item" placeholder="아이디">
                </div>
                <div class="pwd_area">
                    <input type="text" id="pwd_name" class="pwd_item" placeholder="이름">
                </div>
                <div class="pwd_area">
                    <input type="text" id="pwd_phone" class="pwd_item" placeholder="전화번호">
                </div>
                <div class="pwd_area">
                    <input type="text" id="pwd_email" class="pwd_item" placeholder="이메일">
                </div>
                <div class="pwd_area">
                    <button id="pwd_button" class="pwd_item">비밀번호 찾기</button>
                </div>
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
    $(document).ready(function () {
        if (${mode == 'id'}) {
            $("#id_wrap").css("display", "block")
            $("#pwd_wrap").css("display", "none")
        } else {
            $("#pwd_wrap").css("display", "block")
            $("#id_wrap").css("display", "none")
        }

        $("#id_button").click(function () {
            let id_name = $("#id_name").val()
            let id_phone = $("#id_phone").val()
            let id_email = $("#id_email").val()

            if (id_name.trim() == '') {
                alert('이름을 입력하세요')
                return;
            }
            if (id_phone.trim() == '') {
                alert('핸드폰 번호를 입력하세요')
                return;
            }
            if (id_email.trim() == '') {
                alert('이메일을 입력하세요')
                return;
            }
            $.ajax({
                method: 'POST',
                url: '/song/users',
                headers: {"content-type": "application/json"},
                data: JSON.stringify({
                    name: id_name,
                    phone: id_phone,
                    email: id_email
                }),
                success: function (result) {
                    $("#id_wrap").html('<div id="id_result"> <h1>아이디 : ' + result + '</h1> </div>')
                },
                error: function () {
                    alert("입력한 회원정보와 일치하는 회원 없음")
                }
            })
        });
        $("#pwd_button").click(function () {
            let pwd_id = $("#pwd_id").val()
            let pwd_name = $("#pwd_name").val()
            let pwd_phone = $("#pwd_phone").val()
            let pwd_email = $("#pwd_email").val()

            if (pwd_id.trim() == '') {
                alert('아이디를 입력하세요')
                return;
            }
            if (pwd_name.trim() == '') {
                alert('이름을 입력하세요')
                return;
            }
            if (pwd_phone.trim() == '') {
                alert('핸드폰 번호를 입력하세요')
                return;
            }
            if (pwd_email.trim() == '') {
                alert('이메일을 입력하세요')
                return;
            }

            $.ajax({
                method: 'POST',
                url: '/song/users',
                headers: {"content-type": "application/json"},
                data: JSON.stringify({
                    id: pwd_id,
                    name: pwd_name,
                    phone: pwd_phone,
                    email: pwd_email
                }),
                success: function (result) {
                    $("#pwd_wrap").html('<div id="pwd_result"> <h1>비밀번호 : ' + result + '</h1> </div>')
                },
                error: function () {
                    alert("입력한 회원정보와 일치하는 회원 없음")
                }
            })
        });
    })


</script>
</body>
</html>
