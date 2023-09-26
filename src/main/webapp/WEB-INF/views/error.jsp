<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>

<html>
<head>
    <title>eroor</title>
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

        #mainController {
            width: 1300px;
            display: flex;
        }

        #error_wrap {
            width: 800px;
            height: 600px;
            display: flex;
            align-items: center;
        }

        #error_area {
            font-size: 300px;
            color: rgb(39, 7, 134);
        }
    </style>
</head>

<body>
<div id="mainController">
    <div id="error_wrap">
        <h1 id="error_area">
            error
        </h1>
    </div>
</div>
</body>
</html>
