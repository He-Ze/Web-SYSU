<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="css/SearchBlogger.css">
    <link type="text/css" rel="stylesheet" href="css/navBar.css">
    <link rel="icon" href="pictures/xcode.jpeg" type="image/icon type">
    <title>查找</title>
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
<h1>博文与用户查找</h1>
<br>
<div>
    <h5 style="color: white;margin-left: 20px;">博文查询结果：</h5>
    <c:forEach var="post" items="${search_posts}">
        <c:url var="readmore" value="blog">
            <c:param name="command" value="ONEBLOG"/>
            <c:param name="blogId" value="${post.blogId}"/>
            <c:param name="imageUrl" value="${post.imageURL}"/>
        </c:url>
        <article>
            <div class="imageurl">
                <img src="${post.imageURL}" height="170">
            </div>
            <div class="description">
                <h3 style="margin-top: 5px">${post.title}</h3>
                <span>${post.date} | ${post.category}</span>
                <p>${post.body}</p><a style='color: gray; font-size: small' href="${readmore}">阅读更多...</a>
            </div>
        </article>
    </c:forEach>
</div>
<h5 style="color: white;margin-left: 20px;">用户查询结果：</h5>

<div class="layout">
    <c:forEach var="Users" items="${users_info}">
        <c:url var="action" value="blog">
            <c:param name="command" value="VIEWPROFILE"/>
            <c:param name="username" value="${Users.username}"/>
            <c:param name="firstName" value="${Users.firstName}"/>
            <c:param name="lastName" value="${Users.lastName}"/>
            <c:param name="email" value="${Users.username}"/>
            <c:param name="photoURL" value="${Users.photoUrl}"/>
        </c:url>
        <div class="profile">
            <div class="profile__picture"><img src=${Users.photoUrl}></div>
            <div class="profile__header">
                <div class="profile__account">
                    <h4 class="profile__username">${Users.firstName} ${Users.lastName}</h4>
                </div>
                <div class="profile__edit"><a class="profile_button" href="${action}">查看个人资料</a></div>
            </div>
            <div class="profile__stats">
                <div class="profile__stat">
                    <div class="profile__icon profile__icon--blue"><i class="fa fa-user-o" aria-hidden="true"></i></div>
                    <div class="profile__value">2
                        <div class="profile__key">粉丝</div>
                    </div>
                </div>
                <div class="profile__stat">
                    <div class="profile__icon profile__icon--pink"><i class="fa fa-pencil" aria-hidden="true"></i></div>
                    <div class="profile__value">4
                        <div class="profile__key">博文</div>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
    <h2 style="font-size: large; text-align: center; font-weight: bold; color: #ffffff; margin-top: 50px; margin-left: 480px;">
        无查询结果！</h2>
</div>
</body>
</html>
