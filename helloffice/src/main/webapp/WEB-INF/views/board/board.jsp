<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../common/head.jsp" %>
<% 
	String url = request.getAttribute("javax.servlet.forward.request_uri").toString();
	request.setAttribute("url", url);
%>				

<body>
	<%@ include file="../common/header.jsp" %>

	<main id="main" class="main">
		<form action="" method="GET">
			<span>게시글 수</span>
			<select name="count">
				<option > 게시글 수 </option>
				<option value="10" ${page.count eq 10 ? "selected" : ""}>10개</option>
				<option value="15" ${page.count eq 15 ? "selected" : ""}>15개</option>
				<option value="20" ${page.count eq 20 ? "selected" : ""}>20개</option>
			</select>
			<a href="${url}/post"><button type="button" class="btn btn-outline-secondary">게시글 등록</button></a>
	              <table class="table table-hover">
	                <thead>
	                  <tr>
	                    <th scope="col">#</th>
	                    <th scope="col">카테고리</th>
	                    <th scope="col">제목</th>
	                    <th scope="col">작성자</th>
	                    <th scope="col">등록일</th>
	                  </tr>
	                </thead>
	                <tbody>
	                <c:forEach items="${list}" var="l">
	                  <tr onClick="postDetail(${l.postNo})">
	                    <th scope="row">${l.postNo}</th>
	                    <td>${l.category}</td>
	                    <td>${l.title}</td>
	                    <td>${l.empName}</td>
	                    <td>${l.createdTime}</td>
	                  </tr>
	                </c:forEach>
	                </tbody>
	              </table>	
	              
              <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                  <li class="page-item">
                  <button class="page-link" aria-label="Previous" name="page" value="1">
                    <span aria-hidden="true">&laquo;</span>
                  </button>
                  </li>
                  
                  <c:if test="${page.page > 1}">
	                  <li class="page-item"><button type="submit" class="page-link" name="page" value="${page.page - 1}">이전</button></li>
                  </c:if>
                  
                  <c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
	                  <li class="page-item"><button type="submit" class="page-link" name="page" value="${i}">${i}</button></li>
                  </c:forEach>
                  
                  <c:if test="${page.page < page.last}">
	                  <li class="page-item"><button type="submit" class="page-link" name="page" value="${page.page + 1}">다음</button></li>
                  </c:if>
                  
                  <li class="page-item">
                  <button class="page-link" aria-label="Next" name="page" value="${page.last}">
                    <span aria-hidden="true">&raquo;</span>
                  </button>
                  </li>
                </ul>
              </nav>
	              
		</form>
	
	</main>
	<%@ include file="../common/footer.jsp" %>
	
	<script type="text/javascript">
		function postDetail(no){
			console.log(no)
			location.href= '${boardNo}/'+ no;
		}
	</script>
</body>
</html>