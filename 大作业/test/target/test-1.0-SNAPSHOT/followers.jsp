<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link type="text/css" rel="stylesheet" href="css/wideSearch.css">
    <link type="text/css" rel="stylesheet" href="css/followers.css">
    <link type="text/css" rel="stylesheet" href="css/navBar.css">
    <link rel="icon" href="pictures/xcode.jpeg" type="image/icon type">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>粉丝与关注</title>
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
<h1>粉丝与关注</h1>

<div class="page-wrapper bg-dark p-t-100 p-b-50">
    <h2 style="color: white; margin-left: 20px;">推荐关注</h2>

    <div class="layout">
        <c:forEach var="tempUser" items="${USERLIST}">
            <c:url var="followLink" value="follow">
                <c:param name="command" value="FOLLOW"/>
                <c:param name="follower" value="${tempUser.username}"/>
                <c:param name="username" value='<%=request.getParameter("username")%>'/>
            </c:url>
            <c:url var="viewLink" value="follow">
                <c:param name="command" value="VIEWPAGE"/>
                <c:param name="username" value="${tempUser.username}"/>
            </c:url>
            <c:url var="action" value="blog">
                <c:param name="command" value="VIEWPROFILE"/>
                <c:param name="username" value="${Users.username}"/>
                <c:param name="firstName" value="${Users.firstName}"/>
                <c:param name="lastName" value="${Users.lastName}"/>
                <c:param name="email" value="${Users.username}"/>
                <c:param name="photoURL" value="${Users.photoUrl}"/>
            </c:url>
            <div class="profile_follow">
                <div class="profile__picture"><img src="${tempUser.password}"></div>
                <div class="profile__header">
                    <div class="profile__account">
                        <h4 class="username" style="margin-left: 30px;">${tempUser.username}</h4>
                    </div>
                </div>
                <div class="profile__stats">
                    <div class="profile__stat">
                        <div class="profile__icon profile__icon--blue"></div>
                        <div class="profile__value">
                            <div class="profile__key"></div>
                            <div class="followbtn"><a class="follow_button" href="${followLink}">关注</a></div>
                        </div>
                        <div class="profile__value">
                            <div class="prfbtn"><a class="profile_button" href="${viewLink}">查看个人资料</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<h2 style="color: white; margin-left: 20px;">已关注</h2>
<div class="layout-following">
    <c:forEach var="tempFollowers" items="${FOLLOWERSLIST}">
        <c:url var="viewLink" value="follow">
            <c:param name="command" value="VIEWPAGE"/>
            <c:param name="username" value="${tempFollowers.followers}"/>
        </c:url>
        <c:url var="action" value="blog">
            <c:param name="command" value="VIEWPROFILE"/>
        </c:url>
        <div class="profile_follow">
            <div class="profile__picture"><img src="${tempFollowers.photoUrl} "></div>
            <div class="profile__header">
                <div class="profile__account">
                    <h4 class="username" style="margin-left: 30px;">${tempFollowers.followers}</h4>
                </div>
            </div>
            <div class="profile__stats">
                <div class="profile__stat">
                    <div class="profile__icon profile__icon--blue"></div>
                    <div class="profile__value">
                        <div class="prfbtn"><a class="profile_button" href="${viewLink}">查看个人资料</a></div>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>
