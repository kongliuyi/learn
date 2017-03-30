<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
 <div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
      <div class="container">
        
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="MenuAction!myIndex">主页</a></li>
            <li><a href="page/about.html" target="blank">实体店</a></li>
			 <li><a href="AnnouncementAction!init">每周一荐</a></li>
          </ul>
		   <ul class="nav navbar-nav navbar-right">
          
			 <li> <% if(session.getAttribute("loginname")==null){
			 	
			%><a data-toggle="modal" data-target="#myModal1">
				登陆
			</a></li><%}else{  %>  <a href="#" data-toggle="dropdown"><%=session.getAttribute("loginname") %> <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="ClientAction!myData?id=<%=session.getAttribute("loginid")%>">个人中心</a></li>
                <li><a href="#">充值金额</a></li>
                 <li><a href="OrdersAction!myOrders?id=<%=session.getAttribute("loginid")%>">我的订单</a></li>
                <li><a href="BasketAction!myShow">购物车</a></li>
                <li class="divider"></li>
                 <li><a href="#">意见反馈</a></li>
                <li><a href="page/loginout.jsp">退出</a></li>
              </ul>
              <%} %>
			 <li> <a data-toggle="modal" data-target="#myModal2">
				注册
			</a></li>
          </ul>
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </div><!-- /.navbar -->
