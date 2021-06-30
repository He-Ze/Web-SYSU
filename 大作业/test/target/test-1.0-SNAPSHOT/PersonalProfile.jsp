<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link type="text/css" rel="stylesheet" href="css/profileView.css">
    <link type="text/css" rel="stylesheet" href="css/navBar.css">
    <link rel="icon" href="pictures/xcode.jpeg" type="image/icon type">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-color/2.1.2/jquery.color.min.js"></script>
    <title>个人信息</title>
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
    <div class="search-container">
        <form action="search" method="GET">
            <input type="hidden" name="command" value="SEARCH">
            <input type="text" placeholder="查找" name="Keyword">
            <button type="submit"><i class="fa fa-search"></i></button>
        </form>
    </div>
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

<c:url var="followLink" value="follow">
    <c:param name="command" value="FOLLOW"/>
    <c:param name="follower" value='<%=request.getParameter("email")%>'/>
</c:url>
<c:forEach var="user" items="${USER_LIST}">
<div class="container">
    <div class="profile-header">
        <div class="profile-img">
            <img src="${user.username}" width="200" alt="Profile Image">
        </div>
        <div class="profile-nav-info">
            <h3 class="user-name">${user.lastName} ${user.email}</h3>
            <div class="address">
                <p id="state" class="state">${user.photoUrl}</p>
            </div>
        </div>
    </div>
    <div class="main-bd">
        <div class="left-side">
            <div class="profile-side">
                <p class="user-mail"><i class="fa fa-envelope"></i>${user.firstName}@mail2.sysu.edu.cn</p>
            </div>
            </c:forEach>

        </div>

        <div class="right-side">
            <div class="profile-body tab">
                <h3 id="feed">最近的博客</h3>

                <c:forEach var="post" items="${POST_LIST}">
                    <c:url var="Action" value="blog">
                        <c:param name="command" value="ONEBLOG"/>
                        <c:param name="blogId" value="${post.blogId}"/>
                    </c:url>

                    <article>
                        <div class="imageurl">
                            <img src=${post.imageURL} alt="imageurl" height="160">
                        </div>

                        <div class="description">
                            <h3>${post.title}</h3>
                            <span>${post.date} | ${post.category}</span>
                            <p>${post.body} </p><a style='color: gray; font-size: small;' href="${Action}"> 阅读更多...</a>
                        </div>
                    </article>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</body>
<script>$(document).ready(function iniciar() {
    $(".followbtn").on("click", function () {
        $(".followbtn").css("background-color", "#34CF7A");
        $(".followbtn").html('<div class="fa fa-check" aria-hidden="true"></div> Following');
    });
});
</script>
</html>

