<%--
  Created by IntelliJ IDEA.
  User: imdong-gyu
  Date: 24. 7. 24.
  Time: 오후 8:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
    <title>${forum.title}</title>
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
        .card {
          margin: auto;
        }
        .card button {
            float: right;
        }
        .card-body {
          width: auto;
        }
        .card-text{
            text-align: left;
        }
        .resized-image {
            width: 100%;
            height: auto;
        }

        @media (min-width: 768px) {
            .resized-image {
                width: auto;
            }
        }

        @media (min-width: 1024px) {
            .resized-image {
                width: 300px;
            }
        }
        #right {
            float: left;
        }
        img {
            margin-bottom: 30px;
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

<div class="card">
  <div class="card-body">
    <h5 class="card-title" >${forum.title}</h5>
      <hr/>
      <p class="card-text" style="text-align:right;"><small class="text-body-secondary">${forum.date}</small></p>
    <p class="card-text">${forum.content}</p>

  </div>
  <img src="${forum.media}" class="card-img-bottom resized-image" alt="첨부사진" width="480px" height="320px">
</div>
    <button type="button" class="btn btn-outline-info mb-3" data-bs-toggle="collapse" style="width: 60px; float:right; margin: 10px 10px"
		data-bs-target="#updateForm" aria-controls="updateForm">수정</button>
    <a href="/forum/list"><button style="float: right; width: 60px; margin: 10px 0px" type="submit" class="btn btn-outline-info mb-3" data-bs-toggle="collapse">목록</button></a>
<div class="collapse" id="updateForm">
			<div class="card card-body">
				<form method="post" action="/forum/update" enctype="multipart/form-data">
                    <input type="hidden" name="cid" value="${forum.cid}">
					<label for="title" class="form-label">제목</label>
  					<input type="text" class="form-control" id="title" name="title" />
					<label for="file" class="form-label">파일</label>
  					<input type="file" class="form-control" id="file" name="file" />
					<label for="content" class="form-label">게시글</label>
  					<textarea class="form-control" name="content" id="content" cols="50" rows="5">${forum.content}</textarea>
  					<button type="submit" class="btn btn-success mt-3">수정</button>
				</form>
			</div>
		</div>
</body>
</html>
