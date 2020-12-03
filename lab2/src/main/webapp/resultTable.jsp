<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Gleb
  Date: 14.11.2020
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>

<%!
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

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Result</title>
</head>
<body>


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

<input type = "button" value = "Вернуться на начальную страницу" onclick="new function() {window.location.href='index.jsp'}">

</body>
</html>
