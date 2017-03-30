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
				<h1>菜单</h1>
				<div class="btn-group">
					<a class="btn btn-large tip-bottom" title="Manage Files"><i class="icon-file"></i></a>
					<a class="btn btn-large tip-bottom" title="Manage Users"><i class="icon-user"></i></a>
					<a class="btn btn-large tip-bottom" title="Manage Comments"><i class="icon-comment"></i><span class="label label-important">5</span></a>
					<a class="btn btn-large tip-bottom" title="Manage Orders"><i class="icon-shopping-cart"></i></a>
				</div>
			</div>
			<div id="breadcrumb">
				<a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> 主页</a>
				<a href="#">菜单管理</a>
				<a href="#" class="current">添加菜单</a>
			</div>
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="icon-pencil"></i>
								</span>
								<h5>添加菜单列表</h5>
							</div>
							<form  id="form-wizard" class="form-horizontal" action="MenuAction!myAdd" enctype="multipart/form-data"  method="post">
							<div class="widget-content nopadding">
							
									<div id="form-wizard-1" class="step">
										<div class="control-group">
											<label class="control-label">菜单名</label>
											<div class="controls">
												<input name="menu.dishes" type="text" />
											</div>
										</div>
											<div class="control-group">
											<label class="control-label">价格</label>
											<div class="controls">
												<input name="menu.price" type="text"  />
											</div>
										</div>
									<div class="control-group">
											<label class="control-label">简介</label>
											<div class="controls">
												<input name="menu.synopsis" type="text"  />
											</div>
										</div>
									
									</div>
										
									<div id="form-wizard-2" class="step">
											
										<div class="control-group">
											<label class="control-label">图片</label>
											<div class="controls">
												<s:file name="file" label="图片"></s:file>
												<span class="help-block">图片格式为  image/bmp,image/png,image/gif,image/jpeg,image/jpg 大小为102400</span>
											</div>
										</div>
										</div>
									
									<div class="form-actions">
											<input id="back" class="btn btn-primary" type="reset" value="返回" />
											<input id="next" class="btn btn-primary" type="submit" value="提交" />121212
											<div id="status"></div>
									</div>
									<!-- <div id="submitted"></div> -->
							
								
							</div>
							</form>
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
