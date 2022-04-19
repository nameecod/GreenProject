<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords" content="SocialChef - Social Recipe HTML Template" />
	<meta name="description" content="SocialChef - Social Recipe HTML Template">
	<meta name="author" content="themeenergy.com">
	
	<title>SocialChef</title>
	
	<link rel="stylesheet" href="resources/css/style.css" />
	<link rel="stylesheet" href="resources/css/icons.css" />
	<link href="http://resources/fonts.googleapis.com/css?family=Raleway:400,300,500,600,700,800" rel="stylesheet">
	<script src="https://use.fontawesome.com/e808bf9397.js"></script>
	<link rel="shortcut icon" href="resources/images/favicon.ico" />
	<style type="text/css">
		.three-fourth {width: 100%;}
		.comments .depth-4 	{padding-left:180px;margin-left:0;}
		.depth-4 .avatar {left:90px;}
		
		.comments .depth-5 	{padding-left:270px; margin-left:0;}
		.depth-5 .avatar {left:180px;}
		
		.cumtitle {border: 1px; float:left; width:100%; margin-bottom:10px; background: #fff; border-radius: 3px;}
		.cumtitle .lead{font-size:30px; font-weight:500;  padding: 0px;}

		.cmurlink{display: block; align: center;}
		.cmurlink .R-rlink {cursor: pointer;  padding: 11px 14px; background: #fff; color: #FF7B74; border-radius:3px;}
		.post .entry-content {float: left; padding: 17px 20px 0; min-height: 600px;}
		.post .container 		{float:left;width: 1079px !important; padding:0; border-radius: 3px;}
	</style>
	<!-- HTML5 Shim and Respond.js IE8 support of HTL5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	<!--preloader-->
	<div class="preloader">
		<div class="spinner"></div>
	</div>
	<!--//preloader-->
	<!--header-->
		<%@ include file="/resources/Header.jsp" %>
	<!--//header-->
		
	<!--main-->
	<main class="main" role="main">
		<!--wrap-->
		<div class="wrap clearfix">
			<!--breadcrumbs-->
			<nav class="breadcrumbs">
				<ul>
				<!-- 메인, 커뮤니티 링크 -->
					<li><a href="VgMain" title="Home">메인</a></li>
					<li><a href="VgCmuList" title="Blog">커뮤니티</a></li>
					<li>커뮤니티 상세</li>
				</ul>
			</nav>
			<!--//breadcrumbs-->
			
			<!--row-->
			<div class="row">
				<header class="s-title">
					<h1>커뮤니티 상세 글</h1>
				</header>
								
				<!--content-->
				<section class="content three-fourth">
					<!--blog entry-->
					<div class="cmucate cumtitle">
						<p class="lead">카테고리 </p>
					</div>
					<div class="cmucon cumtitle">
						<p class="lead">제목 </p>
					</div>	
					<article class="post single">					
						<div class="entry-meta">
							<div class="date">
								<span class="day">29</span> 
								<span class="my">June, 2014</span>
							</div>
							<div class="avatar">
								<!-- 작성자 마이페이지 링크 -->
								<a href="VgMpgMain.jsp"><img src="resources/images/avatar.jpg" alt="" /><span>마이페이지..?</span></a>
							</div>
						</div>
						<div class="container">
							<div class="entry-content">
								<p class="lead">작성한 글 보여주는 위치 </p>
							</div>
						</div>
					</article>
					<!--//blog entry-->
					
					<!--comments-->
					<div class="comments" id="comments">
						<h2>5 comments </h2>
						<ol class="comment-list">
							<!--comment-->
							<li class="comment depth-1">
								<!-- 작성자 마이페이지 링크 -->
								<div class="avatar"><a href="VgMpgMain.jsp"><img src="resources/images/avatar.jpg" alt="" /></a></div>
								<div class="comment-box">
									<div class="comment-author meta"> 
										<strong>Kimberly C.</strong> said 1 month ago <a href="#" class="comment-reply-link"> Reply</a>
									</div>
									<div class="comment-text">
										<p>댓글 1</p>
									</div>
								</div> 
							</li>
							<!--//comment-->
							
							<!--comment-->
							<li class="comment depth-1">
								<!-- 작성자 마이페이지 링크 -->
								<div class="avatar"><a href="VgMpgMain.jsp"><img src="resources/images/avatar.jpg" alt="" /></a></div>
								<div class="comment-box">
									<div class="comment-author meta"> 
										<strong>Alex J.</strong> said 1 month ago <a href="#" class="comment-reply-link"> Reply</a>
									</div>
									<div class="comment-text">
										<p> 댓글 2</p>
									</div>
								</div> 
							</li>
							<!--//comment-->
							
							<!--comment-->
							<li class="comment depth-4">
								<!-- 작성자 마이페이지 링크 -->
								<div class="avatar"><a href="VgMpgMain.jsp"><img src="resources/images/avatar.jpg" alt="" /></a></div>
								<div class="comment-box">
									<div class="comment-author meta"> 
										<strong>Kimberly C.</strong> said 1 month ago <a href="#" class="comment-reply-link"> Reply</a>
									</div>
									<div class="comment-text">
										<p>댓글 2-1</p>
									</div>
								</div> 
							</li>
							<!--//comment-->
							
							<!--comment-->
							<li class="comment depth-5">
								<!-- 작성자 마이페이지 링크 -->
								<div class="avatar"><a href="VgMpgMain.jsp"><img src="resources/images/avatar.jpg" alt="" /></a></div>
								<div class="comment-box">
									<div class="comment-author meta"> 
										<strong>Alex J.</strong> said 1 month ago <a href="#" class="comment-reply-link"> Reply</a>
									</div>
									<div class="comment-text">
										<p>댓글2-2</p>
									</div>
								</div> 
							</li>
							<!--//comment-->
							
							<!--comment-->
							<li class="comment depth-1">
								<!-- 작성자 마이페이지 링크 -->
								<div class="avatar"><a href="VgMpgMain.jsp"><img src="resources/images/avatar.jpg" alt="" /></a></div>
								<div class="comment-box">
									<div class="comment-author meta"> 
										<strong>Denise M.</strong> said 1 month ago <a href="#" class="comment-reply-link"> Reply</a>
									</div>
									<div class="comment-text">
										<p>댓글 3</p>
									</div>
								</div> 
							</li>
							<!--//comment-->
						</ol>
					</div>
					<!--//comments-->
					
					<!--respond-->
					<div class="comment-respond" id="respond">
						<h2>댓글창</h2>
						<div class="container">
							<p><strong>주의 :</strong> 욕설은 작성이 불가합니다.<span class="req">*</span></p>
							<form>
								<div class="f-row">
									<textarea></textarea>
								</div>
								
								<div class="f-row">
									<div class="third bwrap">
										<input type="submit" value="댓글 작성" />
									</div>
								</div>
							</form>
						</div>
					</div>

					<!--//respond-->
				</section>
			</div>
				<div class ="cmurlink">
					<!-- 글 목록가는 링크 -->
					<a class="R-rlink" href="VgCmuList.jsp"> 글 목록 가기</a>
				</div>
			<!--//row-->
		</div>
		<!--//wrap-->
	</main>
	<!--//main-->
		
    <!--footer-->
    <%@ include file="/resources/Footer.jsp" %>
    <!--//footer-->
	
	<script src="resources/js/jquery-3.1.0.min.js"></script>
	<script src="resources/js/jquery.uniform.min.js"></script>
	<script src="resources/js/jquery.slicknav.min.js"></script>
	<script src="resources/js/scripts.js"></script>
</body>
</html>

