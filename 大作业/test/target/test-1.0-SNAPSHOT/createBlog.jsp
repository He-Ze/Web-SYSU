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
    <title>写博文...</title>
    <link rel="icon" href="pictures/xcode.jpeg" type="image/icon type">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i"
          rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="css/createBlog.css" rel="stylesheet" media="all">
    <link type="text/css" rel="stylesheet" href="css/navBar.css">
    <script src="https://cdn.tiny.cloud/1/4su3lne9yzq5p2bx4fuiya25eimkq8a1okpqzpb4ocsklxcm/tinymce/5/tinymce.min.js"
            referrerpolicy="origin"></script>
    <script>
        tinymce.init({
            selector: '#mytextarea',
        });
        function validateForm() {
            var editorContent = tinymce.get('mytextarea').getContent();
            if (editorContent === "" || editorContent == null) {
                if (!$('#editor-error-message').length) {
                    $('<span id="editor-error-message">Please type in the body</span>').insertAfter($(tinymce.get('mytextarea').getContainer()));
                }
                alert("Please enter the body!");
                return false;
            } else {
                if ($('#editor-error-message'))
                    $('#editor-error-message').remove();
                document.getElementById('submit').submit();
                return true;
            }
        }
    </script>
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
                <h2 class="title">写点新东西</h2>
            </div>
            <div class="card-body">
                <form form action="blog" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="command" value="ADD"/>
                    <div class="form-row">
                        <div class="name">分类</div>
                        <div class="value">
                            <select name="Category" class="input--style-6">
                                <option values="Travel">旅行</option>
                                <option values="Food">美食</option>
                                <option values="Music">音乐</option>
                                <option values="Sports">体育</option>
                                <option values="Lifestyle">生活</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">标题</div>
                        <div class="value">
                            <div class="input-group">
                                <input class="input--style-6" type="text" name="Title"
                                       placeholder="在这里输入标题" required="">
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">正文</div>
                        <div class="value">
                            <div class="input-group">
                                        <textarea id="mytextarea" class="textarea--style-6" name="Body" placeholder="在这里输入正文"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="name">上传图片</div>
                        <div class="value">
                            <div class="input-group js-input-file">
                                <input class="input-file" type="file" name="fileToUpload" id="file" required>
                                <label class="label--file" for="file">选择本地图片</label>
                                <span class="input-file__info">未选中图片</span>
                            </div>
                            <div class="label--desc">上传博文封面，请不大于10MB</div>
                        </div>
                        <div class="preview"><img src="pictures/preview.png" id="previewPhoto" sizes="40"></div>
                    </div>
                    <div class="card-footer">
                        <button class="btn btn--radius-2 btn--blue-2" type="submit" id="submit"
                                onclick="return validateForm()">就这样
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="jquery/jquery.min.js"></script>
<script src="app.js"></script>
<script src="global.js"></script>
</body>
</html>
