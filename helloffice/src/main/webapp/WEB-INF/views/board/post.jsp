<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../common/head.jsp" %>

<body>
	<%@ include file="../common/header.jsp" %>

	<main id="main" class="main">
		<form action="" method="POST">
		<input type="hidden" name="_method" value="DELETE">
		<div class="row mb-3">
			<h1>${post.boardName}</h1>
		</div>
         <div class="row mb-3">
           <div class="col-md-6">
           	  <div class="row">
           	  <div class="col-sm-2 col-form-label">
           	 	 ${post.category}
           	  </div>
	           <label for="inputTitle" class="col-sm-1 col-form-label">제목</label>
	             <div class="col-sm-9 col-form-label">
                    ${post.title}
                  </div>
	           </div>
           </div>
           <div class="col-md-3">
             <div class="row">
	           <label for="inputWriter" class="col-sm-2 col-form-label">작성자</label>
	             <div class="col-sm-10 col-form-label">
                    ${post.empName}
                  </div>
	           </div>
           </div>
           <div class="col-sm-3"></div>
         </div>
         <div class="row mb-3">
           <div class="col-sm-1"></div>
           <label for="inputEmail3" class="col-sm-1 col-form-label">내용</label>
           <div class="col-sm-6 col-form-label">
           ${post.content}
           </div>
           <div class="col-sm-4"></div>
         </div>
         <div class="text-center">
           <c:if test="${post.empNo eq loginEmp.empNo}">
	           <a href="post/${post.postNo}"><button type="button" class="btn btn-primary">수정하기</button></a>
           </c:if>
           <a href="${root}/board/${boardNo}"><button type="button" class="btn btn-success">목록으로</button></a>
           <c:if test="${post.empNo eq loginEmp.empNo}">
	           <button type="submit" class="btn btn-danger">삭제하기</button>
           </c:if>
         </div>
         </form>
	</main>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>