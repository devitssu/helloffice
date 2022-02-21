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