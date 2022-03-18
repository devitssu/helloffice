<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-3">
		<div class="container-fluid">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link active" href="${root}/workflow/myWf"><i class="ri-folder-5-line"></i>내 문서함</a>
				</li>
				<li class="nav-item">
				<c:choose>
					<c:when test="${loginEmp.adminLevel >= 2}">
					<a class="nav-link" href="${root}/workflow/allWf"> <i class="ri-file-zip-line"></i>
						<c:choose>
							<c:when test="${loginEmp.depNo eq 1}">
							모든 문서함</a>
							</c:when>
							<c:otherwise>
							${loginEmp.depName} 문서함</a>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
				</li>
				<%-- <li class="nav-item">
					<a class="nav-link disabled" href="#">자동 워크플로우</a>
				</li> --%>
			</ul>
			<a type="a" class="btn btn-light btn-sm" href="${root}/workflow/wfForm"><i class="bi-pencil-fill"></i> 워크플로우 작성, 요청</a>
		</div>
	</nav>

<script type="text/javascript">

	let url = window.location.pathname;
	$('.nav-item').find('a').each(function(){
		$(this).toggleClass('active', $(this).attr('href') == url);
	})

</script>
