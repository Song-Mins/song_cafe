<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="/cafe/write" var="insertUrl"/>


<html>
<head>
    <title>cafe</title>
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


        #header {}

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

        #mainContainer {}

        #main_outter {}

        #main_inner {
            width: 1100px;
        }

        #title_wrap {
            width: 100%;
            display: flex;
            align-items: center;
            padding: 25px 0;
            margin-bottom: 5px;
        }

        #title_area {
            margin: 0;
            font-size: 15px;
        }

        #title_item {}

        #cafe_wrap {
            width: 100%;
            border: 0.5px solid rgb(180, 180, 180);
            padding: 10px 0;
            padding-bottom: 0;
            margin-bottom: 80px;
        }

        #cafe_form {
            width: 85%;
        }

        .cafe_area {
            height: 80px;
            display: flex;
            align-items: center;
            border-bottom: 0.5px solid rgb(180, 180, 180);
        }


        .cafe_lbl {
            margin: 0;
            width: 10%;
            font-size: 13px;
            font-weight: 600;
        }

        #cafe_name_ipt {
            height: 40%;
            width: 90%;
            margin: 0;
            padding: 0 10px;
        }

        #cafe_explanation_area {
            height: 130px;
        }

        #cafe_explanation_txt {
            height: 50%;
            width: 90%;
            font-size: 15px;
            margin: 0;
            padding: 10px;
        }


        #cafe_topic_slt {
            height: 40%;
            width: 20%;
            text-align: center;
            margin: 0;
        }

        .cafe_region_slt {
            height: 40%;
            width: 20%;
            text-align: center;
            margin: 0;
        }

        #cafe_agree_chk {
            margin: 0;
        }

        #cafe_chk_lbl {
            width: 400px;
            text-align: left;
            font-weight: 400;
            margin-left: 10px;
        }

        #cafe_button_area {
            height: 120px;
            border: none;

        }

        #cafe_btn {
            background-color: rgb(50, 50, 100);
            height: 50%;
            width: 30%;
            font-size: 24px;
            font-weight: 600;
            color: white;
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
                    <%--    요청 - cafeHome.jsp   --%>
                    <a href="<c:url value='/login/logout' />">로그아웃</a>
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

<div id="mainController">
    <div id="main_outter">
        <div id="main_inner">
            <div id="title_wrap">
                <div id="title_area">
                    <h1 id="title_item">카페 생성하기</h1>
                </div>
            </div>
            <div id="cafe_wrap">
                <form:form id="cafe_form" action="${insertUrl}" modelAttribute="cafeDto">

                    <div id="cafe_name_area" class="cafe_area">
                        <label for="cafe_name_ipt" id="name_lbl" class="cafe_lbl">카페 이름</label>
                        <form:input id="cafe_name_ipt" path="name"/>
                    </div>

                    <div id="cafe_explanation_area" class="cafe_area">
                        <label for="cafe_explanation_txt" id="explanation_lbl" class="cafe_lbl">카페 설명</label>
                        <form:textarea id="cafe_explanation_txt" path="explanation"/>
                    </div>

                    <div id="cafe_topic_area" class="cafe_area">
                        <label for="cafe_topic_slt" id="topic_lbl" class="cafe_lbl">주제</label>
                        <form:select id="cafe_topic_slt" path="topic">
                            <form:options items="${allTopic}"/>
                        </form:select>
                    </div>


                    <div id="cafe_region_area" class="cafe_area">
                        <label for="cafe_region_slt" id="region_lbl" class="cafe_lbl">지역</label>
                        <form:select id="cafe_region_slt" class="cafe_region_slt" name="region1" path="region1"
                                     onChange="region1_change(this.value, region2)">
                            <option value="">-선택-</option>
                            <form:options items="${allRegion1}"/>
                        </form:select>

                        <select class="cafe_region_slt" name="region2">
                            <option value="">-선택-</option>
                        </select>
                    </div>

                    <div id="cafe_agree_area" class="cafe_area">
                        <label for="cafe_agree_chk" id="agree_lbl" class="cafe_lbl">정책동의</label>
                        <input type="checkbox" id="cafe_agree_chk">
                        <label for="cafe_agree_chk" id="cafe_chk_lbl" class="cafe_lbl">카페 개인정보보호정책에 동의합니다.</label>
                    </div>

                    <input type="hidden" name="manager_id" value="${sessionScope.id}">

                    <div id="cafe_button_area" class="cafe_area">
                        <button type="submit" id="cafe_btn">
                            카페 생성
                        </button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
<script>
    let msg = "${msg}"

    if (msg == "cafeWRT_ERR") {
        alert("카페 가입 실패")
    }


    let region2_name = new Array();

    region2_name['서울'] = new Array('강남구', '강동구', '강북구', '강서구', '관악구', '광진구', '구로구', '금천구', '노원구', '도봉구', '동대문구', '동작구', '마포구', '서대문구', '서초구', '성동구', '성북구', '송파구', '양천구', '영등포구', '용산구', '은평구', '종로구', '중구', '중랑구');
    region2_name['부산'] = new Array('강서구', '금정구', '남구', '동구', '동래구', '부산진구', '북구', '사상구', '사하구', '서구', '수영구', '연제구', '영도구', '중구', '해운대구', '기장군');
    region2_name['대구'] = new Array('남구', '달서구', '동구', '북구', '서구', '수성구', '중구', '달성군');
    region2_name['인천'] = new Array('계양구', '남구', '남동구', '동구', '부평구', '서구', '연수구', '중구', '강화군', '옹진군');
    region2_name['광주'] = new Array('광산구', '남구', '동구', '북구', '서구');
    region2_name['대전'] = new Array('대덕구', '동구', '서구', '유성구', '중구');
    region2_name['울산'] = new Array('남구', '동구', '북구', '중구', '울주군');
    region2_name['강원'] = new Array('강릉시', '동해시', '삼척시', '속초시', '원주시', '춘천시', '태백시', '고성군', '양구군', '양양군', '영월군', '인제군', '정선군', '철원군', '평창군', '홍천군', '화천군', '횡성군');
    region2_name['경기'] = new Array('고양시 덕양구', '고양시 일산구', '과천시', '광명시', '광주시', '구리시', '군포시', '김포시', '남양주시', '동두천시', '부천시 소사구', '부천시 오정구', '부천시 원미구', '성남시 분당구', '성남시 수정구', '성남시 중원구', '수원시 권선구', '수원시 장안구', '수원시 팔달구', '시흥시', '안산시 단원구', '안산시 상록구', '안성시', '안양시 동안구', '안양시 만안구', '오산시', '용인시', '의왕시', '의정부시', '이천시', '파주시', '평택시', '하남시', '화성시', '가평군', '양주군', '양평군', '여주군', '연천군', '포천군');
    region2_name['경남'] = new Array('거제시', '김해시', '마산시', '밀양시', '사천시', '양산시', '진주시', '진해시', '창원시', '통영시', '거창군', '고성군', '남해군', '산청군', '의령군', '창녕군', '하동군', '함안군', '함양군', '합천군');
    region2_name['경북'] = new Array('경산시', '경주시', '구미시', '김천시', '문경시', '상주시', '안동시', '영주시', '영천시', '포항시 남구', '포항시 북구', '고령군', '군위군', '봉화군', '성주군', '영덕군', '영양군', '예천군', '울릉군', '울진군', '의성군', '청도군', '청송군', '칠곡군');
    region2_name['전남'] = new Array('광양시', '나주시', '목포시', '순천시', '여수시', '강진군', '고흥군', '곡성군', '구례군', '담양군', '무안군', '보성군', '신안군', '영광군', '영암군', '완도군', '장성군', '장흥군', '진도군', '함평군', '해남군', '화순군');
    region2_name['전북'] = new Array('군산시', '김제시', '남원시', '익산시', '전주시 덕진구', '전주시 완산구', '정읍시', '고창군', '무주군', '부안군', '순창군', '완주군', '임실군', '장수군', '진안군');
    region2_name['제주'] = new Array('서귀포시', '제주시', '남제주군', '북제주군');
    region2_name['충남'] = new Array('공주시', '논산시', '보령시', '서산시', '아산시', '천안시', '금산군', '당진군', '부여군', '서천군', '연기군', '예산군', '청양군', '태안군', '홍성군');
    region2_name['충북'] = new Array('제천시', '청주시 상당구', '청주시 흥덕구', '충주시', '괴산군', '단양군', '보은군', '영동군', '옥천군', '음성군', '진천군', '청원군');

    function region1_change(key, region2) {
        //  value 값이 ''이면 함수 종료
        if (key == '') return;

        //  해당 value 값에 해당하는 지역정보 얻어오기
        let name = region2_name[key];

        //  전에 옵션 초기화
        for (i = region2.length - 1; i >= 0; i--)
            region2.options[i] = null;

        //  선택 옵션 만들기
        region2.options[0] = new Option('-선택-', '', '', 'true');

        //  새로운 옵션 추가
        for (i = 0; i < name.length; i++) {
            region2.options[i + 1] = new Option(name[i], name[i]);
        }
    }

</script>
</body>
</html>
