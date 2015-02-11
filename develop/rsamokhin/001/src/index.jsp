<!DOCTYPE html>
<%@ page import="application.models.test" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
        <%
            test t = new test();
            out.print(t.cry());
        %>
</body>
</html>