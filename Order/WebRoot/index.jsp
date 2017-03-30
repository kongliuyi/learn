<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>东华理工大学校园订餐中心</title>
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/carousel.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<link href="css/customerservice.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/holder.js"></script>
	<script type="text/javascript" src="js/scrolltopcontrol.js"></script>
	<script type="text/javascript" >
		$(document).ready(function(){
	
	$("#aFloatTools_Show").click(function(){
		$('#divFloatToolsView').animate({width: 'show', opacity: 'show'}, 'normal',function(){
			$('#divFloatToolsView').show();
		});
		$('#aFloatTools_Show').attr('style','display:none');
		$('#aFloatTools_Hide').attr('style','display:block');
	});
	
	$("#aFloatTools_Hide").click(function(){
		$('#divFloatToolsView').animate({width: 'hide', opacity: 'hide'}, 'normal',function(){
			$('#divFloatToolsView').hide();
		});
		$('#aFloatTools_Show').attr('style','display:block');
		$('#aFloatTools_Hide').attr('style','display:none');
	});
	
});
	if(window.name != "bencalie"){
     location.reload();
     window.name = "bencalie";
}
else{
     window.name = "";
}
	</script>
  </head>

  <body style="background-image:url(images/background.jpg)">
  <jsp:include page="page/head.jsp"/>

    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1">f</li>
      
      </ol>
      <div class="carousel-inner">
        <div class="item active">
          <img src="images/3.jpg" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
       
              <p>东华理工大学校园餐饮店连锁店又开张啦，所场费用不用三四千，不用一两千 只要<code>￥99</code>！！<br>快动起电话快快订购吧！@ </p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">前往了解详情</a></p>
            </div>
          </div>
        </div>
       
        <div class="item">
          <img src="images/2.jpg" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>大家记得多吃蔬菜噢！~</h1>
             
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
    </div><!-- /.carousel -->

<div style="width:100%;height:50px;margin-top:50px; color:#222222；position:absolute">
<div style="font-size:20px;width:950px; height:50px; margin:0 auto;  text-align:center">欢迎来到 "<b>东华理工大学校园订餐中心</b>" 在线订餐网站<br><br>这里提供最新鲜，最美味，最便捷，最安全的食物。让你重温旧梦找回家的感觉！Thx</div>
</div>
<br><br><br><br>
    <div class="container marketing">
      <!-- Three columns of text below the carousel -->
      <div class="row" style="width:100%;">
        <div style="width:90%; margin:0 auto; float:none;">
        <s:iterator value="#session.menuload" id="m">
        <div class="col-lg-4" style="width: 33.3333333%;
    float:left;
    margin-top:20px;">
          <img class="img-circle" src="<s:url value="%{#request.m.path}"/>" style="width:140px;height:140px" alt="Generic placeholder image">
          <h2><s:property value="#request.m.dishes"/></h2>
          <p><s:property value="#request.m.synopsis" /></p>
		  <p ><span style="color:red">￥<s:property value="%{#request.m.price}"/>.00</span></p>
          <p><a class="btn btn-default" href="MenuAction!myDetail?id=<s:url value="%{#request.m.id}"/>" role="button">查看详细资料&raquo;</a></p>
        </div><!-- /.col-lg-4 -->
       </s:iterator>
      
		
		</div>
      </div><!-- /.row -->

    <br><br><br><br><br><br>
      <!-- START THE FEATURETTES -->

	<div style="width:980px;height:250px;margin:0 auto; float:none;">
	<div style="width:15%;float:left;"><img src="images/sina.jpg" style="margin-left:30px"><div style="margin:30 0 0 24">
	<a class="btn btn-default" href="#" role="button">&nbsp;&nbsp;&nbsp;加关注&nbsp;&nbsp;   &raquo;</a></div>
	</div>
	<div style="width:50%;float:left;margin-left:30px"><div style="width:40%;float:left"><img src="images/x2.jpg" style="width:200px"></div>
	<div style="width:50%;float:left;line-height:2;margin-left:30px">这动心的滋味，是全新提拉米苏酱的香醇，是奶香饼干粒的酥脆，更是初次相遇时的甜蜜……全新#提拉米苏星冰乐#，对第一次的心动SAY YES！
	<a class="btn btn-default" href="#" role="button">了解更多  &raquo;</a></div>
	</div>
	<div style="width:10%;float:left;margin-left:30px"><div>
	<img src="images/weixin.gif"></div><div style="margin:20 0 0 10"><p>扫一扫</p>
</div>	关注微信
	</div>
	<div style="width:15%;float:left;margin-left:30px"><img src="images/shaomiao.gif" width="150px" height="150px">
	</div>
	</div>
     
<hr/>
     


      
      

      <!-- /END THE FEATURETTES -->


      <!-- FOOTER -->
      <footer>
         
        <p>&copy; 2017 东华理工大学校园订餐中心  &middot;    </p>
      </footer>

    </div><!-- /.container -->


<!-- Modal -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">登陆</h4>
      </div>
      <div class="modal-body">
	  <form action="ClientAction!myLogin" method="post" style="font-size:20px">
       <p>用户名：</p><input type="text" name="client.username" class="form-control" placeholder="username" required autofocus><br>
	   <p>密  码：</p><input type="password"  name="client.password" class="form-control" placeholder="password" required autofocus><br>
	   <div class="modal-footer">
		
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="submit" class="btn btn-primary">登陆</button>
      </div>
	  </form>
      </div>
      
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Modal -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">注册</h4>
      </div>
      <div class="modal-body">
        <form style="font-size:20px" action="ClientAction!myRegister" method="post">
		<p>用户名：</p><input type="text" name="client.username" class="form-control" placeholder="username" required autofocus><br>
		<p>密  码：</p><input type="password"  name="client.password" class="form-control" placeholder="password" required autofocus><br>
		<p>联系电话：</p><input type="text" name="client.telephone" class="form-control" placeholder="telephone" required autofocus><br>
		<p>地址：</p><input type="text" name="client.address" class="form-control" placeholder="address" required autofocus><br>
		<p>邮箱地址</p><input type="text" name="client.email" class="form-control" placeholder="email" required autofocus><br>
		 <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="submit" class="btn btn-primary">注册</button>
      </div>
		</form>
      </div>
     
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<!--客服 -->
<div class="rides-cs">

	<div class="floatL">
		<a style="display:block" id="aFloatTools_Show" class="btnOpen" title="查看在线客服" href="javascript:void(0);">展开</a>
		<a style="display:none" id="aFloatTools_Hide" class="btnCtn" title="关闭在线客服" href="javascript:void(0);">收缩</a>
	</div>
	
	<div id="divFloatToolsView" class="floatR" style="display:none">
		<div class="cn">
			<h3 class="titZx">订餐客服</h3>
			<ul>
				<li><span>盖伦</span><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=513294260&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:123456:51"  title="小弟的私人飞机网上订餐" /></a></li>
				<li><span>艾希</span><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=123456&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:123456:51" title="小弟的私人飞机网上订餐" /></a></li>
			</ul>
			
			<h3>建议提议</h3>
			<ul>
				<li><span>瑞兹</span><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=123456&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:123456:51" title="小弟的私人飞机网上订餐" /></a></li>
			</ul>
			
			<h3>售后服务</h3>
			<ul>
				<li><span>信爷</span><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=327620469&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:123456:51" title="小弟的私人飞机网上订餐" /></a></li>
			</ul>
		</div>
	</div>
	
</div>

  </body>
</html>

