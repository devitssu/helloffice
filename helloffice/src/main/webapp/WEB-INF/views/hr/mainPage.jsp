<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../common/head.jsp" %>
<body>
	<%@ include file = "../common/header.jsp" %>
	
	<main id="main" class="main">
	<div class="pagetitle">
      <h1> Human Resources </h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="/">Home</a></li>
          <li class="breadcrumb-item">Human Resources</li>
          <!-- <li class="breadcrumb-item active">My page</li> -->
        </ol>
      </nav>
    </div>
    <!-- End pageTitle -->
    
	<section class="section">
	  <div class="row">
	  
	    <div class="col-lg-9">
	      <div class="card">
	        <div class="card">
				<div class="card-body">
		        	<h5 class="card-title"> .... </h5>
		
		              <!-- Bordered Tabs Justified -->
		              <ul class="nav nav-tabs nav-tabs-bordered d-flex" id="borderedTabJustified" role="tablist">
		                <li class="nav-item flex-fill" role="presentation">
		                  <button class="nav-link w-100 active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-home" type="button" role="tab" aria-controls="home" aria-selected="false"> Team List</button>
		                </li>
		                <li class="nav-item flex-fill" role="presentation">
		                  <button class="nav-link w-100" id="profile-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-profile" type="button" role="tab" aria-controls="profile" aria-selected="false">Profile</button>
		                </li>
		                <li class="nav-item flex-fill" role="presentation">
		                  <button class="nav-link w-100" id="contact-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-contact" type="button" role="tab" aria-controls="contact" aria-selected="true">Contact</button>
		                </li>
		              </ul>
		        	<div class="tab-content pt-2" id="borderedTabJustifiedContent">
		                <div class="tab-pane fade active show" id="bordered-justified-home" role="tabpanel" aria-labelledby="home-tab">
		                  	<div class="card">
					            <div class="card-body">
					              <h5 class="card-title"> 마케팅팀  </h5>
					
					              <!-- Table with hoverable rows -->
					              <table class="table table-hover">
					                <thead>
					                  <tr>
					                    <th scope="col">#</th>
					                    <th scope="col">Name</th>
					                    <th scope="col">Department</th>
					                    <th scope="col">Position</th>
					                    <th scope="col">Age</th>
					                    <th scope="col">Start Date</th>
					                  </tr>
					                </thead>
					                <tbody>
					                  <tr>
					                    <th scope="row">1</th>
					                    <td>Brandon Jacob</td>
					                    <td>Marketing</td>
					                    <td>Designer</td>
					                    <td>28</td>
					                    <td>2016-05-25</td>
					                  </tr>
					                  <tr>
					                    <th scope="row">2</th>
					                    <td>Bridie Kessler</td>
					                    <td>Marketing</td>
					                    <td>Developer</td>
					                    <td>35</td>
					                    <td>2014-12-05</td>
					                  </tr>
					                  <tr>
					                    <th scope="row">3</th>
					                    <td>Ashleigh Langosh</td>
					                    <td>Marketing</td>
					                    <td>Finance</td>
					                    <td>45</td>
					                    <td>2011-08-12</td>
					                  </tr>
					                  <tr>
					                    <th scope="row">4</th>
					                    <td>Angus Grady</td>
					                    <td>Marketing</td>
					                    <td>HR</td>
					                    <td>34</td>
					                    <td>2012-06-11</td>
					                  </tr>
					                  <tr>
					                    <th scope="row">5</th>
					                    <td>Raheem Lehner</td>
					                    <td>Marketing</td>
					                    <td>Dynamic Division Officer</td>
					                    <td>47</td>
					                    <td>2011-04-19</td>
					                  </tr>
					                </tbody>
					              </table>
					              <!-- End Table with hoverable rows -->
					
					            </div>
					          </div>
		                </div>
		                <div class="tab-pane fade" id="bordered-justified-profile" role="tabpanel" aria-labelledby="profile-tab">
		                  Nesciunt totam et. Consequuntur magnam aliquid eos nulla dolor iure eos quia. Accusantium distinctio omnis et atque fugiat. Itaque doloremque aliquid sint quasi quia distinctio similique. Voluptate nihil recusandae mollitia dolores. Ut laboriosam voluptatum dicta.
		                </div>
		                <div class="tab-pane fade" id="bordered-justified-contact" role="tabpanel" aria-labelledby="contact-tab">
		                  Saepe animi et soluta ad odit soluta sunt. Nihil quos omnis animi debitis cumque. Accusantium quibusdam perspiciatis qui qui omnis magnam. Officiis accusamus impedit molestias nostrum veniam. Qui amet ipsum iure. Dignissimos fuga tempore dolor.
		            	</div>
		        	</div>
		            <!-- End Bordered Tabs Justified -->
				</div>
    		</div>
	      </div>
	    </div>
	    </div>
	    
	    <div class="col-lg-3">
	      <div class="card">
            <img src="../resources/assets/img/hr/ham.jpeg" class="card-img-top" alt="...">
            <div class="card-body">
              <h5 class="card-title"> 2dragon Sim </h5>
	              <p> kh 아카데미를 인수하는 그날까지...</p>
	              <p> 마케팅 </p>
	              <p> 데이터 전문가</p>
	              <p>010-0100-1010</p>
	              
	              <br>
	              
	              <!-- Modal Dialog Scrollable -->
	              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalDialogScrollable">
	              	정보 보기
	              </button>
	              <div class="modal fade" id="modalDialogScrollable" tabindex="-1">
	                <div class="modal-dialog modal-dialog-scrollable">
	                  <div class="modal-content">
	                  
	                    <div class="modal-header">
	                      <h5 class="modal-title"> my profile </h5>
	                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                    </div>
	                    
	                    	<div class="modal-body">
	                    		<div class="card-body profile-card pt-4 d-flex flex-column align-items-center">

					                <img src="assets/img/profile-img.jpg" alt="Profile" class="rounded-circle">
					                <h2>Kevin Anderson</h2>
					                <h3>Web Designer</h3>  
					                <div class="social-links mt-2">
						                <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
						                <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
						                <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
						                <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
					                </div>
				         		</div>
	                      			This content should appear at the bottom after you scroll.
	                    	</div>
	                    	
	                    <div class="modal-footer">
	                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	                      <button type="button" class="btn btn-primary">Save changes</button>
	                    </div>
	                    
	                    </div>
	                 </div>
	               </div>
	           	</div>
	      </div>
	      <!-- End Modal Dialog Scrollable-->
	    <div class="col-lg-6">
	  </div>
	  </div>
	</section>
	</main>
	
	<%@ include file = "../common/footer.jsp" %>
</body>
</html>