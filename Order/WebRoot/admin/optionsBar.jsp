<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<div id="header">
			<h1><a href="./dashboard.html">Unicorn Admin</a></h1>		
		</div>
		
		<div id="search">
			
		</div>
		<div id="user-nav" class="navbar navbar-inverse">
            <ul class="nav btn-group">
                <li class="btn btn-inverse"><a title=""  href="AdministratorAction!myEdit?id=<%=session.getAttribute("adminid") %>"><i class="icon icon-user"></i> <span class="text"><%=session.getAttribute("adminuser") %></span></a></li>
               
              
                <li class="btn btn-inverse"><a title="" href="outlogin.jsp"><i class="icon icon-share-alt"></i> <span class="text">退出登陆</span></a></li>
            </ul>
        </div>
            
		<div id="sidebar">
		
			<ul>
				<li class="active"><a href="AdministratorAction!myLogin"><i class="icon icon-home"></i> <span>主页</span></a></li>
			 	<% if(Integer.parseInt(session.getAttribute("adminlevel").toString())==0){ %>
			 	<li class="submenu">
					<a href="#"><i class="icon icon-th-list"></i> <span>管理员模块</span> </a>
					<ul>
						<li><a href="AdministratorAction!myShow">管理员列表</a></li>
						<li><a href="adminAdd.jsp">添加管理员</a></li>
					</ul>
				</li>
				<%} %>
				<li><a href="ClientAction!clientShow"><i class="icon-user"></i> <span>用户列表</span></a></li>
				<li class="submenu">
				<a href="#"><i class="icon-star-empty"></i> <span>订单列表</span> </a>
					<ul>
						<li><a href="OrdersAction!ordersShow">历史订单</a></li>
						<li><a href="OrdersAction!processShow">待处理订单</a></li>
						<li><a href="OrdersAction!ordersDate">今日订单</a></li>
					</ul>
			</li>
				<li class="submenu">
					<a href="#"><i class="icon-star-empty"></i> <span>菜单管理</span> </a>
					<ul>
						<li><a href="MenuAction!menuShow">菜单列表</a></li>
						<li><a href="menuAdd.jsp">添加菜单</a></li>
					</ul>
				</li>
				<li class="submenu">
					<a href="#"><i class="icon-file"></i> <span>公告管理</span> </a>
					<ul>
						<li><a href="AnnouncementAction!myShow">公告列表</a></li>
						<li><a href="announcementAdd.jsp">更新公告</a></li>
					</ul>
				</li>

				
				<li><a href="about.jsp"><i class="icon-heart"></i> <span>关于我们</span></a></li>
			
			</ul>
		
		</div>