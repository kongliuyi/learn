<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<html lang="en">
	<head>
		<title>东华理工大学校园订餐中心</title>
		<meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="css/uniform.css" />
		<link rel="stylesheet" href="css/select2.css" />		
		<link rel="stylesheet" href="css/unicorn.main.css" />
		<link rel="stylesheet" href="css/unicorn.grey.css" class="skin-color" />	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
	<body>
		
		<jsp:include page="optionsBar.jsp"/>
		
		<div id="content">
			<div id="content-header">
				<h1>管理员</h1>
				<div class="btn-group">
					<a class="btn btn-large tip-bottom" title="Manage Files"><i class="icon-file"></i></a>
					<a class="btn btn-large tip-bottom" title="Manage Users"><i class="icon-user"></i></a>
					<a class="btn btn-large tip-bottom" title="Manage Comments"><i class="icon-comment"></i><span class="label label-important">5</span></a>
					<a class="btn btn-large tip-bottom" title="Manage Orders"><i class="icon-shopping-cart"></i></a>
				</div>
			</div>
			<div id="breadcrumb">
				<a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> 主页</a>
				<a href="#">管理员模块</a>
				<a href="#" class="current">管理员列表</a>
			</div>
			<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-th"></i>
								</span>
								<h5>Static table</h5>
							</div>
							<div class="widget-content nopadding">
								<table class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>菜单名</th>
											<th>价格</th>
											<th>简介</th>
											<th>推出时间</th>
											<th>图片</th>
											<th>状态</th>
											<th>销售总数</th>
										</tr>
									</thead>
									<tbody>
								<s:iterator value="#session.menuShow" id="m">
										<tr>
											<td><a href="MenuAction!myEdit?id=<s:property value="#m.id"/>" style="color:#000"><s:property value="#m.dishes"/></a></td>
											<td><s:property value="#m.price"/></td>
											<td><s:property value="#m.synopsis"/></td>
											<td><s:property value="#m.launchtime"/></td>
											<td><img src="../<s:property value="#m.path"/> " width="40"></td>
											<td><s:property value="#m.status"/></td>
											<td><s:property value="#m.sum"/></td>
											<td><a class="btn btn-primary" href="MenuAction!myEdit?id=<s:property value="#m.id"/>"><i class="icon-pencil icon-white"></i> 修改</a>
									<a class="btn btn-danger" href="javascript:if(confirm('确实要删除该菜单吗?'))location='MenuAction!myDel?id=<s:property value="#m.id"/>'" "><i class="icon-remove icon-white"></i> 删除</a></td>
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
