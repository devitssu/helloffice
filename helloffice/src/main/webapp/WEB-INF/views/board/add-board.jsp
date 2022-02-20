<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../common/head.jsp" %>

<body>
	<%@ include file="../common/header.jsp" %>

	<main id="main" class="main">
		<form>
         <div class="row mb-3">
           <div class="col-md-8">
           	  <div class="row">
           	  <div class="col-sm-2">
           	 	 <select id="inputState" class="form-select">
                    <option selected>카테고리</option>
                    <option>일반</option>
                    <option>인사</option>
                  </select>
           	  </div>
	           <label for="inputTitle" class="col-sm-1 col-form-label">제목</label>
	             <div class="col-sm-9">
                    <input type="text" class="form-control" id="inputTitle">
                  </div>
	           </div>
           </div>
           <div class="col-md-4">
             <div class="row">
	           <label for="inputWriter" class="col-sm-2 col-form-label">작성자</label>
	             <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputWriter">
                  </div>
	           </div>
           </div>
         </div>
         <div class="row mb-3">
           <label for="inputEmail3" class="col-sm-2 col-form-label">내용</label>
            <textarea class="tinymce-editor">
                
              </textarea><!-- End TinyMCE Editor -->
         </div>
         <div class="text-center">
           <button type="submit" class="btn btn-primary">Submit</button>
           <button type="reset" class="btn btn-secondary">Reset</button>
         </div>
       </form><!-- End Horizontal Form -->
	</main>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>