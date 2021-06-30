<%@page import="Action.like" %>
<%@page import="Action.remarkAction" %>
<%@page import="Action.database" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">
    <title>阅读博文</title>
    <link rel="icon" href="pictures/xcode.jpeg" type="image/icon type">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i"
          rel="stylesheet">
    <link href="css/singleBlogView.css" rel="stylesheet" media="all">
    <link type="text/css" rel="stylesheet" href="css/navBar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<c:url var="logout" value="logout">

</c:url>
<c:url var="profile" value="blog">
    <c:param name="command" value="PERSONALPROFILE"/>
    <c:param name="username" value='<%=request.getParameter("username")%>'/>
</c:url>
<c:url var="view" value="blog">
    <c:param name="command" value="VIEW"/>
    <c:param name="username" value='<%=request.getParameter("username")%>'/>
</c:url>

<div class="topnav" id="mytopnav">
    <a href="blog" class="active">主页</a>
    <a href="createBlog.jsp" id=post>写博客</a>
    <c:url var="follow" value="follow">
        <c:param name="command" value="USERS"/>
        <c:param name="username" value='<%=request.getParameter("username")%>'/>
    </c:url>
    <c:url var="settings" value="blogger">
        <c:param name="command" value="SETTINGS"/>
    </c:url>
    <div class="dropdown2">
        <button class="dropbtn">设置
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content">
            <a href="${profile}">个人信息</a>
            <a href="${follow}">粉丝</a>
            <a id="logout" href="${logout}">登出</a>
        </div>
    </div>
    <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunction()">&#9776;</a>
</div>

<div class="page-wrapper bg-dark p-t-100 p-b-50">
    <div class="wrapper wrapper--w900">
        <div class="card card-6">
            <div class="card-heading">
                <c:forEach var="tempBlog" items="${BLOGLIST}">
                <c:url var="deleteLink" value="remark">
                    <c:param name="blogId" value="${tempCom.blogId}"/>
                </c:url>
            </div>
            <div class="card-body">
                <div class="card-footer">
                    <div class="name">${tempBlog.date} </div>
                </div>
                <div class="form-row">
                    <div class="name">${tempBlog.title}</div>
                    <div class="value">
                    </div>
                </div>
                <div class="img-container">
                    <img src=${tempBlog.imageURL} alt="imageurl" width="800">
                </div>
                <div class="card-footer">
                    <p> ${tempBlog.body}</p>
                    <br>
                </div>
                <div class="card-footer">
                    <div class="addCom">
                        <form action="remark" method="GET">
                            <input type="hidden" name="command" value="COMMENT"/>
                            <input type="hidden" name="blogId" value='${tempBlog.blogId}'/>
                            <input type="hidden" name="Author" value='${tempBlog.author}'/>
                            <input type="hidden" name="PhotoUrl" value='${tempBlog.imageURL}'/>
                            <textarea name="comment" placeholder="说点什么吧..." rows="4" required></textarea><br><br>
                            <input type="submit" value="评论" name="addComment" onsubmit="myFunction();"/>
                        </form>
                        <br></div>
                </div>
                <div class="like">
                    <% like ld = new like(database.getConnection());
                        int x = Integer.parseInt(request.getParameter("blogId"));
                        String username = (String) request.getAttribute("user");
                    %>
                    <c:url var="liked" value="like">
                        <c:param name="blogId" value="${tempBlog.blogId}"/>
                    </c:url>
                    <a type="button" class="btn btn-light" style="background-color: white;color: black;"
                       href="${liked}">
                        <% if (ld.isLikedByUser(x, username)) {%>
                        <i class="fa fa-heart" style="margin: 5px;color: red;"></i>
                        <span class="like-counter"><%= ld.countLikeOnPost(x)%></span>


                        <%} else {%>
                        <i class="fa fa-heart-o" style="margin: 5px;color: black;"></i>
                        <span class="like-counter"><%= ld.countLikeOnPost(x)%></span>
                        <%}%>
                    </a>
                </div>
                </c:forEach>
                <div class="card-footer">
                    <p style="font-size: 17px; margin-left: 25px; font-weight: 700;">评论</p></div>
                <div class="card-footer">
                    <table class="table4comments">
                        <c:forEach var="tempCom" items="${COM_LIST}">
                            <c:url var="deleteLink" value="remark">
                                <c:param name="command" value="DELETE"/>
                                <c:param name="commentId" value="${tempCom.commentId}"/>
                                <c:param name="blogId" value="${tempCom.blogId}"/>
                                <c:param name="username" value='<%=request.getParameter("username")%>'/>
                            </c:url>
                            <tr>
                                <td>
                                    <b style="font-size: 14px; margin-right: 20px;">${tempCom.username}</b>${tempCom.date}<br>
                                    <br> ${tempCom.comment} </td>
                                <td><b style="margin-left: 105px;" hidden="true">${tempCom.commentId}</b></td>
                                <td><a href="${deleteLink}">X</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                    <br></div>
            </div>
        </div>
    </div>
</div>
<script src="jquery/jquery.min.js"></script>
<script src="global.js"></script>
</body>
</html>
