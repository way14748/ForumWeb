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
    <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <style>
        body {
            color: #000;
            transition: background-color 0.3s, color 0.3s;
          text-align: center;
        }
        .dark-mode {
            background-color: #333;
            color: #fff;
        }
  </style>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary" id="nav">
  <div class="container-fluid">
    <a class="navbar-brand" href="/forum/home">누추한 게시판</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/forum/check">출석체크</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/forum/list">게시판</a>
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
 <script>
         // 페이지가 로드될 때 저장된 테마 적용
         document.addEventListener('DOMContentLoaded', () => {
            const darkMode = localStorage.getItem('dark-mode') === 'true';
            if (darkMode) {
                document.body.classList.add('dark-mode');
            }
        });

        // 버튼 클릭 시 테마 토글 및 저장
        document.getElementById('themeToggle').addEventListener('click', () => {
            const isDarkMode = document.body.classList.toggle('dark-mode');
            localStorage.setItem('dark-mode', isDarkMode);
        });
    </script>
</body>
</html>