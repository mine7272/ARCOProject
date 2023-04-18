<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">

<%@ include file="../includes/header.jsp"%>

<title>ARCO - Community List</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://netdna.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	rel="stylesheet">
<!-- <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"> -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">
<style type="text/css">
body {
	margin-top: 20px;
	background: #FFF
}

.card {
	background: #fff;
	margin-bottom: 30px;
	transition: .5s;
	border: 0;
	border-radius: .1875rem;
	display: inline-block;
	position: relative;
	width: 100%;
	box-shadow: none;
	font-family: 'Nanum Gothic', sans-serif;
}

.page-link {
	color: #000;
	background-color: #fff;
	border: 1px solid #ccc;
}

.page-item.active .page-link {
	/* z-index: 1; */
	color: #555;
	font-weight: bold;
	background-color: #e0e0e0;
	border-color: #ccc;
}

.page-link:focus, .page-link:hover {
	color: #000;
	background-color: #fafafa;
	border-color: #ccc;
}

.inbox .action_bar .delete_all {
	margin-bottom: 0;
	margin-top: 8px
}

.inbox .action_bar .btn, .inbox .action_bar .search {
	margin-left: 200px;
	margin-bottom: 15px;
}

.inbox .mail_list .list-group-item {
	border: 0;
	padding: 15px;
	margin-bottom: 1px
}

.inbox .mail_list .list-group-item:hover {
	background: #eceeef
}

.inbox .mail_list .list-group-item .media {
	margin: 0;
	width: 100%
}

.inbox .mail_list .list-group-item .controls {
	display: inline-block;
	margin-right: 10px;
	vertical-align: top;
	text-align: center;
	margin-top: 11px
}

.inbox .mail_list .list-group-item .media-heading a {
	color: #555;
	font-weight: normal;
}

.inbox .mail_list .list-group-item .media-heading a:hover, .inbox .mail_list .list-group-item .media-heading a:focus
	{
	text-decoration: none
}

.inbox .mail_list .list-group-item .media-heading time {
	font-size: 13px;
	margin-right: 10px
}

.inbox .mail_list .list-group-item .msg {
	margin-bottom: 0px
}

.inbox .mail_list .unread {
	border-left: 2px solid
}

.inbox .mail_list .unread .media-heading a {
	color: #333;
	font-weight: 700
}

.inbox .btn-group {
	box-shadow: none
}

.inbox .bg-gray {
	background: #e6e6e6
}

.modal {
	display : none;
	position : fixed;
	z-index : 300;
	left : 0;
	top : 0;
	width : 120%;
	height : 100%;
	overflow : auto;
	background-color: rgb(0,0,0);
	background-color: rgba(0,0,0,0.4);
}

.modal-content {
	position : fixed;
	left : 50%;
	top : 20%;
	
	transform : translate(-50%, -50%);
	
	background-color : #fefefe;
	margin : 15% auto;
	padding : 20px;
	border : 1px solid #888;
	border-radius : 10px;
	width : 400px;
	height : 170px;
	box-shadow : 5px 10px 10px 1px rgba(0,0,0,.3);
	font-family: 'Nanum Gothic', sans-serif;
}

.modal-footer {
	font-family: 'Nanum Gothic', sans-serif;
	cursor : pointer;
	height : 48px;
}

.input-group-addon {
	border : 0px;
}

@media only screen and (max-width: 767px) {
	.inbox .mail_list .list-group-item .controls {
		margin-top: 3px
	}
}
</style>
</head>
<body>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
	<div class="container">
		<section class="content inbox">
			<!-- Modal -->

			<div class="container-fluid">
				<div class="row clearfix">
					<div class="col-lg-12">
						<div class="card action_bar">
							<div class="body">
								<div class="row clearfix">
									<div class="col-lg-1 col-md-2 col-3"></div>
									<div class="col-lg-5 col-md-4 col-6">
										<form id="searchForm" action="/board/list" method='get' style=" width:500px;" class="input-group search">
											<select class="form-control" name='type' style="width:150px;">
												<option value="" <c:out value="${pageMaker.cri.type == null ? 'selected' : ''}"/>>--</option>
												<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : ''}"/>>제목</option>
												<option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : ''}"/>>내용</option>
												<option value="W" <c:out value="${pageMaker.cri.type eq 'W' ? 'selected' : ''}"/>>작성자</option>
												<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected' : ''}"/>>제목/내용</option>
												<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW' ? 'selected' : ''}"/>>제목/작성자</option>
												<option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC' ? 'selected' : ''}"/>>제목/작성자/내용</option>
											</select>
											<input type='text' name="keyword" class="form-control" style="width:350px;"
													placeholder="Search..." value='<c:out value="${pageMaker.cri.keyword}"/>'>
											<input type='hidden' name="pageNum" value="${pageMaker.cri.pageNum}">
											<input type='hidden' name='brd_id' value='${pageMaker.cri.brd_id}'>
											<button type="submit" class="searchButton"><span class="input-group-addon"><i class="zmdi zmdi-search"></i></span></button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row clearfix">
					<div class="col-md-12 col-lg-12 col-xl-12">
						<table class="table table-bordered table-hover"
							style="font-family: 'Nanum Gothic', sans-serif;">
							<thead>
								<tr>
									<th>#번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>

							<c:forEach items="${list}" var="board">
								<tr>
									<td><c:out value="${board.post_id}" /></td>
									<td><a class='move'
										href='<c:out value="${board.post_id}"/>' style="color: black;">
											<c:out value="${board.post_title}" /> <b> [ <c:out
													value="${board.post_com_count}" /> ]
										</b>
									</a></td>
									<td><c:out value="${board.post_writer}" /></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${board.post_regdate}" /></td>
									<td><c:out value="${board.post_view_count}" /></td>
								</tr>
							</c:forEach>
						</table>

						<table class="table" style="border-top: hidden;">
							<tr>
								<td style="padding: 0px;">
									<div class="card m-t-5">
										<div class="body">
											<ul class="pagination pagination-primary m-b-0">
												<c:if test="${pageMaker.prev}">
													<li class="paginate_button previous"><a
														class="page-link" href="${pageMaker.startPage-1}">Previous</a></li>
												</c:if>
												<c:forEach var="num" begin="${pageMaker.startPage}"
													end="${pageMaker.endPage}">
													<li class="paginate_button"><a class="page-link move2"
														href="${num}">${num}</a></li>
												</c:forEach>
												<c:if test="${pageMaker.next}">
													<li class="paginate_button next"><a class="page-link"
														href="${pageMaker.endPage +1}">Next</a></li>
												</c:if>
											</ul>
										</div>
									</div>
								</td>
								<td style="padding: 0px;">
									<div class="card m-t-5">
										<div class="body">
											<ul style="float: right;" class="regBtn">
												<li class="page-item"><a class="page-link" style="width:120px; text-align:center; border: 1px solid #ccc; border-radius: 20px;"
													href='/board/register'>글 등록</a></li>
											</ul>
										</div>
									</div>
								</td>
							</tr>
						</table>

						<div id="myModal" class="modal">

							<!-- Modal content -->
							<div class="modal-content">
								<p style="text-align: center;">
									<span style="font-size: 14pt;"><b><span style="font-size: 20pt;">Success</span></b></span></p>
								<p style="text-align: center; line-height: 1.5;">
									<span style="font-size: 14pt;">처리가 완료되었습니다.</span></p>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" id="close_modal">Close</button>
								</div>
							</div>
						</div>
						<!-- End Modal -->
					</div>
				</div>
			</div>
		</section>
	</div>
	<form id='actionForm' action="/board/list" method='get'>
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
		<input type='hidden' name='pageNumForLimit' value='${pageMaker.cri.pageNumForLimit}'>
		<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>
		<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
		<input type='hidden' name='brd_id' value='${pageMaker.cri.brd_id}'>
	</form>
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	 	$(document).ready(
				function() {

					var result = '<c:out value="${result}"/>';

					checkModal(result);

					history.replaceState({}, null, null);

					function checkModal(result) {
						if (result === '' || history.state) {
							return;
						}
						if (parseInt(result) > 0) {
							$(".modal-conent")
									.html("게시글 " + parseInt(result) + " 번이 등록 되었습니다.");
						}
						$('#myModal').show();
						
						$("#close_modal").click(function() {
							$('#myModal').hide();
						});
					}
					

					$("#regBtn").on("click", function() {
						self.location = "/board/register";
					});
					var actionForm = $("#actionForm");
					
					$(".paginate_button a").on(
							"click",
							function(e) {
								e.preventDefault();
								console.log('click');
								actionForm.find("input[name='pageNum']").val(
										$(this).attr("href"));
								actionForm.submit();
							});
					
					$(".move").on("click", function(e){
					    e.preventDefault();
					    actionForm.append("<input type='hidden' name='post_id' value='"+
					            $(this).attr("href")+"'>");
					    actionForm.attr("action", "/board/get");
					    actionForm.submit();
					});
					
					var searchForm = $("#searchForm");
					
					$("#searchForm searchButton").on("click", function(e){
						
						e.preventDefault();
						let val = $("input[name='keyword']").val();
						searchForm.find("input[name='keyword']").val(val);
						/* searchForm.find("input[name='pageNum']").val("1"); */
						
						searchForm.submit();
					})
          
					$(".move2").on("click", function(e){
					    e.preventDefault();
					    actionForm.attr("action", "/board/list");
					    actionForm.submit();
					});
				});
		
	</script>
</body>
</html>