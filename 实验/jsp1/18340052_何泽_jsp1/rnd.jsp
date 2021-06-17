<%@ page language="java" import="java.util.*,java.io.*" contentType="text/html; charset=utf-8"%>
<!DOCTYPE  html>
<html  lang="zh-cn">
<head>
    <meta charset="utf-8">
    <title>40个随机数</title>
</head>
<body>
<h1>40个随机数</h1>
<%
    Random rnd= new Random(50);
    for (int i=1; i<41;i++) {
        int n = rnd.nextInt(1000);
        out.print(n);
        out.print(' ');
        if(i%12==0){
            out.println("<br/>");
        }
    }
%>
</body>
</html>