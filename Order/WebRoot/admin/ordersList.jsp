<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<html lang="en">
<head>
<title>东华理工大学订餐中心</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/uniform.css" />
<link rel="stylesheet" href="css/select2.css" />
<link rel="stylesheet" href="css/unicorn.main.css" />
<link rel="stylesheet" href="css/unicorn.grey.css" class="skin-color" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>


	<jsp:include page="optionsBar.jsp" />

	<div id="content">
		<div id="content-header">
			<h1>历史订单</h1>
			<div class="btn-group">
				<a class="btn btn-large tip-bottom" title="Manage Files"><i
					class="icon-file"></i></a> <a class="btn btn-large tip-bottom"
					title="Manage Users"><i class="icon-user"></i></a> <a
					class="btn btn-large tip-bottom" title="Manage Comments"><i
					class="icon-comment"></i><span class="label label-important">5</span></a>
				<a class="btn btn-large tip-bottom" title="Manage Orders"><i
					class="icon-shopping-cart"></i></a>
			</div>
		</div>
		<div id="breadcrumb">
			<a href="index.html" title="Go to Home" class="tip-bottom"><i
				class="icon-home"></i> 主页</a> <a href="#" class="current">订单列表</a>
		</div>
		<div class="widget-box">
			<div class="widget-title">
				<span class="icon"> <i class="icon-th"></i>
				</span>
				<h5>Static table</h5>
			</div>
			<div class="widget-content nopadding">
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>下单用户</th>
							<th>收货人名</th>
							<th>菜肴</th>
							<th>单价</th>
							<th>下单时间</th>
							<th>状态</th>
							<th>单价</th>
							<th>总价</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="#session.showOrders" id="o">
							<tr>
								<td><s:property value="#o.client.username" /></td>
								<td><s:property value="#o.name" /></td>
								<td><s:property value="#o.menu.dishes" /></td>
								<td><s:property value="#o.sum" /></td>
								<td><s:property value="#o.downtime" /></td>
								<s:if test="#o.ischeckout==1">
									<td>未发货</td>
								</s:if>
								<s:elseif test="#o.ischeckout==0">
									<td>已发货</td>
								</s:elseif>
								<td>￥<s:property value="#o.price" />.00
								</td>
								<td>￥<s:property value="#o.sum * #o.price" />.00
								</td>

								<td><a class="btn btn-primary"
									href="ClientActiona!myEdit?id=<s:property value="#o.id"/>"><i
										class="icon-pencil icon-white"></i> 修改</a> <a
									class="btn btn-danger"
									href="javascript:if(confirm('确实要删除该菜单吗?'))location='OrdersAction!myDel?str=<s:property value="#o.id"/>sc'"><i
										class="icon-remove icon-white"></i> 删除</a></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
		</div>
	</div>



	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.ui.custom.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.uniform.js"></script>
	<script src="js/select2.min.js"></script>
	<script src="js/jquery.validate.js"></script>
	<script src="js/unicorn.js"></script>
	<script src="js/unicorn.form_validation.js"></script>
</body>
</html>
