<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<html lang="en">
	<head>
		<title>东华理工大学校园订餐中心</title>
		<meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
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
				<a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> 主页</a>
				<a href="#">管理员模块</a>
				<a href="#" class="current">添加管理员用户</a>
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-pencil"></i>
								</span>
								<h5>添加管理员用户</h5>
							</div>
							<div class="widget-content nopadding">
								<form id="form-wizard" class="form-horizontal" action="AdministratorAction!myAdd" method="post" />
									<div id="form-wizard-1" class="step">
										<div class="control-group">
											<label class="control-label">账号</label>
											<div class="controls">
												<input name="administrator.username" type="text" />
											</div>
										</div>
											<div class="control-group">
											<label class="control-label">密码</label>
											<div class="controls">
												<input name="administrator.password" type="password"  />
											</div>
										</div>
									
										<div class="control-group">
											<label class="control-label">真实姓名</label>
											<div class="controls">
												<input name="administrator.realname" type="text"  />
												<span class="help-block">请务必填写该员工的真实姓名</span>
											</div>
										</div>
									
									</div>
									<div id="form-wizard-2" class="step">
											
										
											<div class="control-group">
											<label class="control-label">联系电话</label>
											<div class="controls">
												<input name="administrator.telephone" type="text"  />
											</div>
										</div>
									</div>
									<div class="form-actions">
											<input id="back" class="btn btn-primary" type="reset" value="返回" />
											<input id="next" class="btn btn-primary" type="submit" value="提交" />
											<div id="status"></div>
									</div>
									<div id="submitted"></div>
								</form>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row-fluid">
					<div id="footer" class="span12">
						东华理工大学校园订餐中心
					</div>
				</div>
			</div>
		</div>
		
		
            
            <script src="js/jquery.min.js"></script>
            <script src="js/jquery.ui.custom.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script src="js/jquery.validate.js"></script>
            <script src="js/jquery.wizard.js"></script>
            <script src="js/unicorn.js"></script>
            <script src="js/unicorn.wizard.js"></script>
	</body>
</html>
