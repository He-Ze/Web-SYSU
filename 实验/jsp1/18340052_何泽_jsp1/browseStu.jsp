<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String msg ="";
	Integer pgno = 0;
	Integer pgcnt = 4;
	String param = request.getParameter("pgno");
	if(param != null && !param.isEmpty()){ 
		pgno = Integer.parseInt(param);
	}
	param = request.getParameter("pgcnt");
	if(param != null && !param.isEmpty()){
		pgcnt = Integer.parseInt(param);
	}
	int pgprev = (pgno>0)?pgno-1:0;
	int pgnext = pgno+1;
	String connectString = "jdbc:mysql://localhost:3306/teaching"
					+ "?autoReconnect=true&useUnicode=true"
					+ "&characterEncoding=UTF-8";
	StringBuilder table=new StringBuilder("");
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(connectString, "user", "123");
		Statement stmt = con.createStatement();
		String sql = String.format("select * from stu limit %d, %d", pgno*pgcnt, pgcnt);
		ResultSet rs = stmt.executeQuery(sql);
		table.append("<table>");
		table.append("<tr><th>id</th><th>ѧ��</th><th>����</th><th>-</th></tr>");
		while(rs.next()) {
			table.append("<tr>");
			table.append("<td>" + rs.getString("id") + "</td>");
			table.append("<td>" + rs.getString("num") + "</td>");
			table.append("<td>" + rs.getString("name") + "</td>");
			table.append("<td>");
			String url1 = "updateStu.jsp?pid=" + rs.getString("id");
			table.append("<a href='" + url1 + "'>�޸�</a> ");
			String url2 = "deleteStu.jsp?pid=" + rs.getString("id");
			table.append("<a href='" + url2 + "'>ɾ��</a></td>");
			table.append("</tr>");
		}
		table.append("</table");
		rs.close();
		stmt.close();
		con.close();
	}
	catch (Exception e){
		msg = e.getMessage();
	}
%>
<!DOCTYPE  html>
<html  lang="zh-cn">
	<head>
		<style>
			a:link, a:visited{
				color: blue;
			}
			td, th{
				border: solid 1px gray;
				width: 150px;
				height: 30px;
			}
			table{
				border-collapse: collapse;
			}
			.container{
				width: 600px;
				margin: auto;
				text-align: center;
			}
		</style>
		<title>���ѧ������</title>
	</head>
	<body>
		<div class="container">
			<h1>���ѧ������</h1>  
			<div>
				<%=table%>
			</div>
			<div style="float: left;">
				<br><br><a href="addStu.jsp">����</a><br><br>
			</div>
			<div style="float:right">
				<br><br><a href="browseStu.jsp?pgno=<%=pgprev%>&pgcnt=<%=pgcnt%>">��һҳ</a>
				<a href="browseStu.jsp?pgno=<%=pgnext%>&pgcnt=<%=pgcnt%>">��һҳ</a>
			</div>
		</div>
	</body>
</html>