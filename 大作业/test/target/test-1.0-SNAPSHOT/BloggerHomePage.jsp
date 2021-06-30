<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="css/memberHomePage.css">
    <link type="text/css" rel="stylesheet" href="css/navBar.css">
    <link rel="icon" href="pictures/xcode.jpeg" type="image/icon type">
    <title>MyBlog-主页</title>
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

<h1>Blog By HZ&ampGTH</h1>
<div class="session">
    <h2 id="Greetings"></h2>
    <h2 id="sessionName"
        style="color: white;"><%=session.getAttribute("firstName")%> <%=session.getAttribute("lastName")%>
    </h2>
</div>
<br>
<br>
<br>
<h3>热门博客：</h3>
<div class="trending">
    <c:forEach var="post" items="${TRENDING}">
        <div class="trendingCards">
            <h4>${post.title}</h4>
            <p class="body">${post.body}</p>
            <c:url var="readmore" value="blog">
                <c:param name="command" value="ONEBLOG"/>
                <c:param name="blogId" value="${post.blogId}"/>
                <c:param name="imageUrl" value="${post.imageURL}"/>
            </c:url>
            <a href="${readmore}" id="readmore">阅读更多...</a>
            <img src="${post.imageURL}" width="300">
            <div class="footer">
            </div>
        </div>
    </c:forEach>
</div>
<h3>看看关注人的博客：</h3>
<c:forEach var="post" items="${FOLLOWPOSTS}">
    <div class="myfeed">
        <h4>${post.title}</h4>
        <p class="body">${post.body}</p>
        <c:url var="readmore" value="blog">
            <c:param name="command" value="ONEBLOG"/>
            <c:param name="blogId" value="${post.blogId}"/>
            <c:param name="imageUrl" value="${post.imageURL}"/>
        </c:url>
        <a style="margin-left: 260px;" href="${readmore}" id="readmore">阅读更多...</a>
        <img style="margin-left: 20%;" src="${post.imageURL}" width="60%">
    </div>
</c:forEach>

<script src="https://code.jquery.com/jquery-3.5.1.js"
        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<script type="text/javascript">
    function myFunction() {
        var x = document.getElementById("myTopnav");
        if (x.className === "topnav") {
            x.className += " responsive";
        } else {
            x.className = "topnav";
        }
    }
    window.onscroll = function () {
        myFunction()
    };
    var navbar = document.getElementById("mytopnav");
    var sticky = navbar.offsetTop;
    function myFunction() {
        if (window.pageYOffset >= sticky) {
            navbar.classList.add("sticky")
        } else {
            navbar.classList.remove("sticky");
        }
    }
    var myDate = new Date();
    var hrs = myDate.getHours();
    var greet;
    if (hrs < 12)
        greet = '上午好';
    else if (hrs >= 12 && hrs <= 14)
        greet = '下午好';
    else if (hrs >= 14 && hrs <= 24)
        greet = '晚上好';
    document.getElementById('Greetings').innerHTML =
        '<b>' + greet;
</script>
</body>
</html>
