<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: imdong-gyu
  Date: 24. 7. 24.
  Time: 오후 6:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
    <title>글목록</title>
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
		h2 {
			margin-top: 15px;
		}
		#head {
			margin: 0px 20px;
		}

		#add {
			float: right;
			margin-right: 20px;
		}
		nav {
			text-align: left;
			margin: auto;
		}
		.text-decoration-none{
			text-align: left;
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
          <a class="nav-link disabled" aria-disabled="true">게시판</a>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" aria-disabled="true">준비중</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<div id="head">
	<h2>게시글 목록</h2>
		<hr />
		<ul class="list-group">
			<c:forEach var="forum" items="${forum}" varStatus="status">
				<li class="list-group-item  list-group-item-action d-flex justify-content-between align-items-center">
				    <a href="/forum/${forum.cid}" class="text-decoration-none">
				    	[${status.count}] ${forum.title}, ${forum.date}
				    </a>
				    <a href="/forum/delete/${forum.cid}"><span class="badge bg-secondary">&times;</span></a>
				</li>
				<hr/>
			</c:forEach>
		</ul>
		<hr />
	</div>
		<button id="add" type="button" class="btn btn-outline-info mb-3" data-bs-toggle="collapse"
		data-bs-target="#addForm" aria-expanded="false" aria-controls="addForm">게시글 작성</button>

		<div class="collapse" id="addForm">
			<div class="card card-body">
				<form method="post" action="/forum/add" enctype="multipart/form-data">
					<label for="title" class="form-label">제목</label>
  					<input type="text" class="form-control" id="title" name="title" />
					<label for="file" class="form-label">파일</label>
  					<input type="file" class="form-control" id="file" name="file" />
					<label for="content" class="form-label">내용</label>
  					<textarea class="form-control" name="content" id="content" cols="50" rows="5" ></textarea>
  					<button type="submit" class="btn btn-success mt-3">저장</button>
				</form>
			</div>
		</div>
<script>
         document.addEventListener('DOMContentLoaded', () => {
            const darkMode = localStorage.getItem('dark-mode') === 'true';
            if (darkMode) {
                document.body.classList.add('dark-mode');
            }
        });

    </script>
</body>
</html>
