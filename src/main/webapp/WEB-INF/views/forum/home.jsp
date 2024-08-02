<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: imdong-gyu
  Date: 24. 7. 24.
  Time: 오후 2:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
    <title>누추한 게시판</title>
  <link href="../css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="../css/dark-mod.css">
  <script src="../js/bootstrap.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary" id="nav">
  <div class="container-fluid">
    <a class="navbar-brand" href="/home">누추한 게시판</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/check">출석체크</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/list">게시판</a>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" aria-disabled="true">준비중</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
  <h1>안녕하세요 누추한 게시판 입니다!</h1>
  <button id="themeToggle" class="btn btn-outline-primary">테마변경</button>
  <script src="../js/darkmode.js"></script>

</body>
</html>