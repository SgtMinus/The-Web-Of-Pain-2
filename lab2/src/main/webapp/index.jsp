<%@ page import="java.util.ArrayList" %><%!
    String getTable(HttpServletRequest request){
        String result = "";
        try{
            ArrayList<String> rows = (ArrayList<String>) request.getSession().getAttribute("result");
            for (String s : rows) {
                result += s;
            }
        }catch (Exception e) {return "";}
        return  result;

    }
%>

<%@ page contentType="text/html;charset=utf-8" %>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Cache-Control" content="no-cache">
    <title>Web Lab 2</title>
    <link rel="stylesheet" href = "style.css">
</head>
<body onload="selectDefaultR()">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script src ="script.js"></script>

<header>
    <div id = "page-header">
        <p class="head">Макаров Глеб P3210 </p>
        <p class="head"> Вариант 10076 </p>
    </div>
</header>

<div class = "chart" onclick="createRequestFromClick(event)">
    <svg id="finalGraph" class="graph" width="310px" height="310px">
        <rect id="rect" height="310px" width="310px" fill="#E6E6FA" ></rect>
        <line stroke="#000000" x1="5" x2="305" y1="155" y2="155"></line>
        <line stroke="#000000" x1="155" x2="155" y1="5" y2="305"></line>
        <polygon points="155,5 163,15, 147  ,15" fill="#000000"></polygon>
        <polygon points="305,155 295,163 295,147" fill="#000000"></polygon>
        <text x="163" y="15" font-size="20" font-weight="700">Y</text>
        <text x="294" y="145" font-size="20" font-weight="700">X</text>

        <line stroke="#000000" x1="205" x2="205" y1="147" y2="163"></line>
        <line stroke="#000000" x1="255" x2="255" y1="147" y2="163"></line>
        <line stroke="#000000" x1="105" x2="105" y1="147" y2="163"></line>
        <line stroke="#000000" x1="55" x2="55" y1="147" y2="163"></line>

        <text x="200" y="145">R/2</text>
        <text x="250" y="145">R</text>
        <text x="95" y="145">-R/2</text>
        <text x="45" y="145">-R</text>

        <line stroke="#000000" x1="147" x2="163" y1="205" y2="205"></line>
        <line stroke="#000000" x1="147" x2="163" y1="255" y2="255"></line>
        <line stroke="#000000" x1="147" x2="163" y1="105" y2="105"></line>
        <line stroke="#000000" x1="147" x2="163" y1="55" y2="55"></line>

        <text x="165" y="110" >R/2</text>
        <text x="165" y="60">R</text>
        <text x="165" y="210">-R/2</text>
        <text x="165" y="260">-R</text>

        <polygon points="155,155 255,155 155,205" fill="blue" opacity="0.5"></polygon>
        <polygon points="55,155 155,155 155,205 55,205" fill="blue" opacity="0.5"></polygon>
        <path d="M 155 105
           A 45 45, 0, 0, 0, 105 155
           L 155 155 Z" fill="blue" opacity="0.5"/>

    </svg>
</div>

<form id = "actionPanel" action="sendData" method="POST" >
    <h1 id="panelTitle">Панель выбора</h1>
    <div id="panelX">
        <p class="selectionLabel">Выбор X</p>
        <div id="selectX">
            <input type="radio" name="x" value="-2">-2
            <input type="radio" name="x" value="-1.5">-1.5
            <input type="radio" name="x" value="-1">-1
            <input type="radio" name="x" value="-0.5">-0.5
            <input type="radio" name="x" value="0">0
            <input type="radio" name="x" value="0.5">0.5
            <input type="radio" name="x" value="1">1
            <input type="radio" name="x" value="1.5">1.5
            <input type="radio" name="x" value="2">2
        </div>
        <p id="alertX"></p>

        <input type = "hidden" name = xFinal>
    </div>


    <div id="panelY">
        <p class="selectionLabel">Выбор Y</p>
        <p id="additionInfoY"> (учитываются 5 знаков после запятой)</p>
        <div id="selectY">
            <input type="text" name="y" id="yText" placeholder="Введите число от -5 до 5">
        </div>
        <p id="alertY"></p>

        <input type = "hidden" name = yFinal>
    </div>

    <div id="panelR">
        <p class="selectionLabel" >Выбор R</p>
        <div id="selectR">
            <input type="radio" name="r" value="1" onclick="drawPoints(this.value)">1
            <input type="radio" name="r" value="1.5" onclick="drawPoints(this.value)">1.5
            <input type="radio" name="r" value="2" onclick="drawPoints(this.value)">2
            <input type="radio" name="r" value="2.5" onclick="drawPoints(this.value)">2.5
            <input type="radio" name="r" value="3" onclick="drawPoints(this.value)">3
        </div>
        <p id="alertR"></p>
    </div>

    <input type="button" id="mainButton" value="Давай, нападай!" onclick="createRequest('actionPanel')">


</form>

<form id="clearDataForm" action="clearData" method="get">
    <input type="button" value = "Удалить данные" onclick="clearData()">
</form>

<div id="mainTable">
    <table id="finalTable">
        <tr>
            <th id="xColumn">X</th>
            <th id="yColumn">Y</th>
            <th id="rColumn">R</th>
            <th id="resultColumn">Результат</th>
        </tr>
        <%=getTable(request)%>
    </table>
</div>
</body>
</html>
