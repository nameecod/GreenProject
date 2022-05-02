<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords" content="SocialChef - Social Recipe HTML Template" />
	<meta name="description" content="SocialChef - Social Recipe HTML Template">
	<meta name="author" content="themeenergy.com">
	
	<title>베지피 커뮤니티</title>
	
	<link rel="stylesheet" href="/resources/css/style.css" />
	<link rel="stylesheet" href="/resources/css/icons.css" />
	<link href="http://resources/fonts.googleapis.com/css?family=Raleway:400,300,500,600,700,800" rel="stylesheet">
	<script src="https://use.fontawesome.com/e808bf9397.js"></script>
	<script src="/resources/js/cmu_comment.js"></script>
	<link rel="shortcut icon" href="/resources/images/favicon.ico" />
	<style type="text/css">
		.three-fourth {width: 100%;}
		.comments .depth-4 {padding-left:180px;margin-left:0;}
		.depth-4 .avatar {left:90px;}
		
		.comments .depth-5 {padding-left:270px; margin-left:0;}
		.depth-5 .avatar {left:180px;}
		
		.cumtitle {border: 1px; float:left; width:100%; margin-bottom:10px; background: #fff; border-radius: 3px;}
		.cumtitle .lead{font-size:30px; font-weight:500;  padding: 0px;}

		.cmurlink {display: block; align: center;}
		.cmurlink .R-rlink {cursor: pointer;  padding: 11px 14px; background: #fff; color: #49A54C; border-radius:3px;}
		.post .entry-content {float: left; padding: 17px 20px 0; min-height: 600px;}
		.post .container {float:left; width: 1079px !important; padding:0; border-radius: 3px;}
		.h_button a{cursor: pointer; background: #fff; color: #49A54C; border-radius: 3px;}
		.h_button{	float: center; padding-bottom: 15px; padding-right: 15px;}
			
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
		<%@ include file="../../../Header.jsp" %>
		<div style="padding-top: 200px"></div>		
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
					<input name="CMU_PK" type="hidden" value="${cmuvo.CMU_PK}"/>
					<div class="cmucate cumtitle">
						<p class="lead">${cmuvo.CMU_CATE}</p>
					</div>
					<div class="cmucon cumtitle">
						<p class="lead">${cmuvo.CMU_TITLE}</p>
					</div>	
					<article class="post single">					
						<div class="entry-meta">
							<div class="date">
								<span class="day"><fmt:formatDate pattern="dd" value="${cmuvo.CMU_REG}"/></span> 
								<span class="my"><fmt:formatDate pattern="MM-yyyy" value="${cmuvo.CMU_REG}"/></span>
							</div>
							<div class="avatar">
								<!-- 작성자 마이페이지 링크 -->
								<a href="VgMpgMain.do"><img src="/resources/images/avatar.jpg" alt="" /><span>마이페이지..?</span></a>
							</div>
						</div>
						<div class="container">
							<div class="entry-content">
								<p class="lead">${cmuvo.CMU_CONTENT}</p>
							</div>
						</div>
					</article>
					<!--//blog entry-->
					<!-- 세션아이디 -->
					<input type="hidden" name="USR_ID" value="${sessionScope.usr_Id }">
					<div>
						<c:set var="USR_ADMIN" value="${sessionScope.usr_Admin }" />
						<c:set var="USR_ID" value="${sessionScope.usr_Id }" />
						<c:set var="writer_ID" value="${cmuvo.USR_ID }" />
						<c:if test="${USR_ADMIN == 1 || USR_ID eq writer_ID}">
							<!-- 레시피 삭제하기 -->
							<div class="h_button">
								<a  href="/cmu/deletecmu.do?CMU_PK=${cmuvo.CMU_PK}"><input
									name="CMU_PK" type="hidden" value="${cmuvo.CMU_PK}" /><input
									type="button" name="deletecmu" id="deletecmu"
									style="width: 130px;" value="삭제하기" />
								</a>
							</div>
							<!-- 레시피 수정하기 -->
							<div class="h_button">
								<a  href="/cmu/updatecmuform.do?CMU_PK=${cmuvo.CMU_PK}"><input
									name="CMU_PK" type="hidden" value="${cmuvo.CMU_PK}" /><input
									type="button" name="updatecmu" id="updatecmu"
									style="width: 130px;" value="수정하기" />
								</a>
							</div>
						</c:if>
					</div>
										
					<!--comments-->
					<div class="comments" id="comments">
						<h2>${replycount} comments </h2>
						<ol class="comment-list">
						
					<!--comments-->
					<c:forEach var="replylist" items="${replylist}" varStatus="status">
					<li class="comment depth-1">
						<div class="avatar"><a href="VgMpgMain.do"><img src="/resources/images/avatar.jpg" alt="" /></a></div>
					    <div class="comment-box">   <!-- style="margin-left: <c:out value="${30*replylist.CCM_REF_LEVEL}"/>px;" -->
					        <div class="comment-author meta"> 
					        <strong><c:out value="${replylist.USR_ID}"/></strong><c:out value="${replylist.CCM_REG}"/>
					        </div>
					        <a class="comment-reply-link" href="#" onclick="fn_commentdelete('<c:out value="${replylist.CCM_PK}"/>')">삭제</a>
					        <a class="comment-reply-link" href="#" onclick="fn_commentupdate('<c:out value="${replylist.CCM_PK}"/>')">수정</a>
					        <a class="comment-reply-link" href="#" onclick="fn_commentreply('<c:out value="${replylist.CCM_PK}"/>')">댓글</a>
					        <div class="comment-text" id="reply <c:out value="${replylist.CCM_PK}"/>"><c:out value="${replylist.CCM_CONTENT}"/></div>
					    </div>
					</li>
					</c:forEach>
					
					
					<!--comments-->
	
							<!--comment-->
							<li class="comment depth-1">
								<!-- 작성자 마이페이지 링크 -->
								<div class="avatar"><a href="VgMpgMain.do"><img src="/resources/images/avatar.jpg" alt="" /></a></div>
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
								<div class="avatar"><a href="VgMpgMain.do"><img src="/resources/images/avatar.jpg" alt="" /></a></div>
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
								<div class="avatar"><a href="VgMpgMain.do"><img src="/resources/images/avatar.jpg" alt="" /></a></div>
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
							
						</ol>
											
					</div>
					<!--//comments-->
					
					<!--respond-->
					<div class="comment-respond" id="respond">
						<h2>댓글창</h2>
						<div class="container">
							<p><strong>주의 :</strong> 욕설 및 모욕 등 타인의 기분을 상하게 하는 게시물의 내용은 삼가주시길바랍니다.<span class="req">*</span></p>
							<form name="commentform" action="cmu_commentsave.do" method="post">
							<!-- 여기서 할 일, 아이디 세션 받고 게시물 번호 받고(히든) -->
								<div class="f-row">
									<!-- 게시글 번호 받음 -->
									<input type="hidden" id="CMU_PK" name="CMU_PK" value="<c:out value="${cmuvo.CMU_PK}"/>">
									<input type="hidden" id="USR_ID" name="USR_ID" value="<c:out value="${cmuvo.USR_ID}"/>">
									<textarea id="CCM_CONTENT" name="CCM_CONTENT" placeholder="댓글을 작성해주세요."></textarea>
								</div>
								
								<div class="f-row">
									<div class="third bwrap">
										<input type="submit" onclick="fn_commentsubmit()" value="댓글 작성" />
									</div>
								</div>
							</form>
						</div>
					</div>
					
						<div id="replydiv" class="comment-respond">
							<form name="updateform" action="cmu_commentsave.do" method="post">
							<!-- 여기서 할 일, 아이디 세션 받고 게시물 번호 받고(히든) -->
								<div class="f-row">
									<!-- 게시글 번호 받음 -->
									<input type="hidden" id="CMU_PK" name="CMU_PK" value="<c:out value="${cmuvo.CMU_PK}"/>">
									<input type="hidden" id="USR_ID" name="USR_ID" value="<c:out value="${cmupagevo.USR_ID}"/>">
									<textarea id="CCM_CONTENT" name="CCM_CONTENT" placeholder="댓글을 작성해주세요."></textarea>
								</div>
								
								<div class="f-row">
									<div class="third bwrap">
									<!-- 수정, 취소 정리 -->
									        <a href="#" onclick="fn_replyUpdateSave()">저장</a>
        									<a href="#" onclick="fn_replyUpdateCancel()">취소</a>
									</div>
								</div>
							</form>
						</div>

					<!--//respond-->
				</section>
			</div>
				<div class ="cmurlink">
					<!-- 글 목록가는 링크 -->
					<a class="R-rlink" href="VgCmuList.do"> 글 목록 가기</a>
				</div>
			<!--//row-->
		</div>
		<!--//wrap-->
	</main>
	<!--//main-->
		
    <!--footer-->
    <%@ include file="../../../Footer.jsp" %>
    <!--//footer-->
	
	<script src="/resources/js/jquery-3.1.0.min.js"></script>
	<script src="/resources/js/jquery.uniform.min.js"></script>
	<script src="/resources/js/jquery.slicknav.min.js"></script>
	<script src="/resources/js/scripts.js"></script>
</body>
</html>


