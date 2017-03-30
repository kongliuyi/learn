<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="../images/logo.png">

<title>东华理工大学校园订餐中心</title>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/carousel.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/customerservice.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/holder.js"></script>
<script type="text/javascript" src="js/scrolltopcontrol.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#aFloatTools_Show").click(function() {
			$('#divFloatToolsView').animate({
				width : 'show',
				opacity : 'show'
			}, 'normal', function() {
				$('#divFloatToolsView').show();
			});
			$('#aFloatTools_Show').attr('style', 'display:none');
			$('#aFloatTools_Hide').attr('style', 'display:block');
		});

		$("#aFloatTools_Hide").click(function() {
			$('#divFloatToolsView').animate({
				width : 'hide',
				opacity : 'hide'
			}, 'normal', function() {
				$('#divFloatToolsView').hide();
			});
			$('#aFloatTools_Show').attr('style', 'display:block');
			$('#aFloatTools_Hide').attr('style', 'display:none');
		});

	});
</script>
</head>

<body style="background-image: url(./images/background.jpg)">
	<jsp:include page="head.jsp" />


	<div class="container">

		<div class="row row-offcanvas row-offcanvas-right">

			<div class="col-xs-12 col-sm-9">
				<p class="pull-right visible-xs">
					<button type="button" class="btn btn-primary btn-xs"
						data-toggle="offcanvas">Toggle nav</button>
				</p>
				<div class="jumbotron">
					<h1>
						Hi，<%=session.getAttribute("loginname")%></h1>
					<p>以下是你的订单详情！</p>
				</div>

				<div>



					<div class="widget-box">

						<div class="widget-content nopadding">
							<table class="table table-bordered table-striped with-check">
								<thead style="background-color: #FFF">
									<tr>
										<th>#</th>
										<th>订单商品</th>
										<th>收货人</th>
										<th>订单数量</th>
										<th>订单金额</th>
										<th>下单时间</th>
										<th>联系地址</th>
										<th>联系电话</th>
										<th>订单状态</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<s:iterator value="#session.ordersList" id="orders">
										<tr>
											<td></td>
											<td><center>
													<a
														href="MenuAction!myDetail?id=<s:url value="%{#orders.menu.id}"/>"><img
														src="<s:property value="#orders.menu.path"/>" width="65"
														height="65"><span style="color: #000"><br>
															<br> <s:property value="#orders.menu.dishes" /></span></a>
												</center></td>
											<td><s:property value="#orders.name" /></td>
											<td><s:property value="#orders.sum" /></td>

											<td>￥<s:property value="#orders.price" />.00
											</td>
											<td><s:property value="#orders.downtime" /></td>
											<td><s:property value="#orders.address" /></td>
											<td><s:property value="#orders.telephone" /></td>
											<s:if test="#orders.ischeckout==1">
												<td>未发货</td>
											</s:if>
											<s:elseif test="#orders.ischeckout==0">
												<td>已发货</td>
											</s:elseif>
											<td><a class="btn btn-danger"
												href="javascript:if(confirm('确实要删除该订单信息吗?'))location='OrdersAction!myDel?id=<s:url value="%{#orders.id}'"/>">删除</a><br>
										</tr>
									</s:iterator>


								</tbody>
							</table>
						</div>
					</div>




				</div>


			</div>
			<!--/span-->

			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar"
				role="navigation">
				<div class="list-group">
					<a href="#" class="list-group-item "><img
						src="images/personal.jpg" width="220px"></a>
					<s:iterator value="#session.clientList" id="c">
						<a
							href="ClientAction!myData?id=<%=session.getAttribute("loginid")%>"
							class="list-group-item  active">用户金额：<s:label
								value="%{#request.c.money}"></s:label></a>
					</s:iterator>
					<a
						href="OrdersAction!myOrders?id=<%=session.getAttribute("loginid")%>"
						class="list-group-item">我的订单</a> <a href="#"
						class="list-group-item">成为会员</a> <a href="#"
						class="list-group-item">帮助中心</a> <a href="#"
						class="list-group-item">人工申述</a>

				</div>
			</div>
			<!--/span-->
		</div>
		<!--/row-->

		<hr>


		<!-- FOOTER -->
		<footer style="margin-top:80px">
		<p class="pull-right">
			<a href="#">东华理工大学校园订餐中心
		</p>

		</footer>

	</div>
	<!-- /.container -->


	<!-- Modal -->
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">登陆</h4>
				</div>
				<div class="modal-body">
					<form action="ClientAction!myLogin" method="post"
						style="font-size: 20px">
						<p>用户名：</p>
						<input type="text" name="client.username" class="form-control"
							placeholder="username" required autofocus><br>
						<p>密 码：</p>
						<input type="password" name="client.password" class="form-control"
							placeholder="password" required autofocus><br>
						<div class="modal-footer">

							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
							<button type="submit" class="btn btn-primary">登陆</button>
						</div>
					</form>
				</div>

			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- Modal -->
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">注册</h4>
				</div>
				<div class="modal-body">
					<form style="font-size: 20px" action="ClientAction!myRegister"
						method="post">
						<p>用户名：</p>
						<input type="text" name="client.username" class="form-control"
							placeholder="username" required autofocus><br>
						<p>密 码：</p>
						<input type="password" name="client.password" class="form-control"
							placeholder="password" required autofocus><br>
						<p>联系电话：</p>
						<input type="text" name="client.telephone" class="form-control"
							placeholder="telephone" required autofocus><br>
						<p>联系地址：</p>
						<input type="text" name="client.address" class="form-control"
							placeholder="address" required autofocus><br>
						<p>邮箱地址</p>
						<input type="text" name="client.email" class="form-control"
							placeholder="email" required autofocus><br>

						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
							<button type="submit" class="btn btn-primary">注册</button>
						</div>
					</form>
				</div>

			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->




	<!--客服 -->
	<div class="rides-cs">

		<div class="floatL">
			<a style="display: block" id="aFloatTools_Show" class="btnOpen"
				title="查看在线客服" href="javascript:void(0);">展开</a> <a
				style="display: none" id="aFloatTools_Hide" class="btnCtn"
				title="关闭在线客服" href="javascript:void(0);">收缩</a>
		</div>

		<div id="divFloatToolsView" class="floatR" style="display: none">
			<div class="cn">
				<h3 class="titZx">订餐客服</h3>
				<ul>
					<li><span>盖伦</span><a target="_blank"
						href="http://wpa.qq.com/msgrd?v=3&uin=513294260&site=qq&menu=yes"><img
							border="0" src="http://wpa.qq.com/pa?p=2:123456:51"
							title="小弟的私人飞机网上订餐" /></a></li>
					<li><span>艾希</span><a target="_blank"
						href="http://wpa.qq.com/msgrd?v=3&uin=123456&site=qq&menu=yes"><img
							border="0" src="http://wpa.qq.com/pa?p=2:123456:51"
							title="小弟的私人飞机网上订餐" /></a></li>
				</ul>

				<h3>建议提议</h3>
				<ul>
					<li><span>瑞兹</span><a target="_blank"
						href="http://wpa.qq.com/msgrd?v=3&uin=123456&site=qq&menu=yes"><img
							border="0" src="http://wpa.qq.com/pa?p=2:123456:51"
							title="小弟的私人飞机网上订餐" /></a></li>
				</ul>

				<h3>售后服务</h3>
				<ul>
					<li><span>波比</span><a target="_blank"
						href="http://wpa.qq.com/msgrd?v=3&uin=123456&site=qq&menu=yes"><img
							border="0" src="http://wpa.qq.com/pa?p=2:123456:51"
							title="小弟的私人飞机网上订餐" /></a></li>
				</ul>
			</div>
		</div>

	</div>

</body>
</html>

