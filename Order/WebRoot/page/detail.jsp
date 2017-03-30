<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
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
    <link rel="shortcut icon" href="../images/logo.png">

    <title>东华理工大学校园订餐中心</title>
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/carousel.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<link href="css/customerservice.css" rel="stylesheet" type="text/css" />
	<link href="css/font-awesome.css" rel="stylesheet" type="text/css" />
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
	  function	confirmMoney(){
	    	 if (confirm("是否确定下单并支付（支付后无法退回）?")) {
	    		 $.ajax({
	 				type : "POST",
	 				url : "OrdersAction!myOrders",
	 				async: false,
					cache: false,
					datatype:"json",
	 				data:$('#orders').serialize(),
	 				success : function(result) {
	 					if(result){
	 						  if(confirm("对不起，您的账户余额不足，是否充值？"))
	 					        {
	 					          alert("充值页面");
	 					        }
	 					}else{
	 						alert(result);
	 						$("html").html(result);
	 					}
	 				}
	 			});
	    		
	    	 }
	     }
	</script>
  </head>

  <body >
    <jsp:include page="head.jsp"/>
  

    <div style="width:100%;padding-top:50px;">
    <div style="width:100%;margin:0 auto;min-width:980px;padding-top:30px;">
    <form action="MenuAction!search" method="post">
    <div style="float:right;margin-right:50px"><button type="submit" class="btn btn btn-primary">搜索菜单</button></div>
    <div style="float:right;margin-right:10px"><input type="text" name="menu.dishes" class="form-control" placeholder="Search" required autofocus></div>
    </form>
    </div>
   <div style="width:100%;margin:0 auto;min-width:980px"><img src="images/head.jpg" width="100%"></div>
   
    	<div style="width:85%;min-width:980px;height:600px;margin :0 auto;margin-top:40px;border:1px #ccc solid">
    	<s:iterator value="#session.detailList" id="m">
  		  <div style="width:28%;margin:20px;float:left">
          	<img src="<s:url value="%{#request.m.path}" />" style="width:100%;min-width:150px;">
<br><br>
            	<img src="images/duoyu.jpg" >
            <br><br>
     	  <!--  <div class="bshare-custom icon-medium-plus" ><a title="分享到QQ空间" class="bshare-qzone"></a><a title="分享到新浪微博" class="bshare-sinaminiblog"></a><a title="分享到人人网" class="bshare-renren"></a><a title="分享到腾讯微博" class="bshare-qqmb"></a><a title="分享到网易微博" class="bshare-neteasemb"></a><a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a><span class="BSHARE_COUNT bshare-share-count">0</span></div><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
         --> </div>
          <div style="width:40%;float:left;margin:20px;">
          	<p><h3><s:label value="%{#request.m.dishes}"/></h3></p>
          博雅特产网提供凤梨酥,大溪豆干,北埔客家擂茶,新竹贡丸,辉鸿蚵仔煎,犂记饼店,台北鸳鸯火锅,高雄蚵仔煎,双冬槟榔,万峦猪脚,台湾牡蛎,南投高粱酒等台湾美食,
          	<hr style="border:1px dotted #D9D9D9">
          	<p><span style="margin-right:30px">用料</span><s:property value="#m.synopsis"/></p>
            <p><span style="margin-right:30px;">价格</span><span style="font-size:20px;color:red">￥<s:property value="#m.price"/>.00</span>/份</p>
            <p><span style="margin-right:30px">单位</span>件</p>
            <p><span style="margin-right:20px">销售量</span><s:property value="#m.sum"/></p>          
            <p>数量</p> 
         
            <hr><% if(session.getAttribute("loginid")==null){ %>
          <a data-toggle="modal" data-target="#myModal1" class="btn btn-lg btn-primary">立即购买</a><%}else{ %>
              <a data-toggle="modal" data-target="#myModal3" class="btn btn-lg btn-primary">立即购买</a>
          <%} %>
          <% if(session.getAttribute("loginid")==null){ %>
          <a data-toggle="modal" data-target="#myModal1" class="btn btn-lg btn-primary">加入购物车</a><%}else{ %>
                <a  href="BasketAction!myAdd?id=<s:property value="#m.id"/>" class="btn btn-lg btn-primary">加入购物车</a>
          <%} %>

          
          <br>  <br>  <br>
           <img src="images/head2.jpg">
           
          </div>
          </s:iterator>
          <div style="float:left;width:22%;margin-top:20px;min-width:180px;border:1px #F0D584 solid;background-color:#FFFCDE">
         
         <!-- 排行 -->
          <img src="images/paihang.jpg" style="width:100%;min-width:"205px">
         <s:iterator value="#session.rankingList" id="ranking">
         <a href="MenuAction!myDetail?id=<s:property value="#ranking.id"/>">
         <div>
         <div style="margin:20px;float:left">
            <img src="<s:property value="#ranking.path"/>" width="100" height="100"></div>
          <div style="float:left;margin-top:50px;color:#000"><p><s:property value="#ranking.dishes"/></p>
           <span style="font-size:20px;color:red">￥<s:property value="#ranking.price"/>.00</span>
           </div>
   	 	</div></a>
   	 	</s:iterator>
   	 	
   	 	</div>
   	 	
   	 	</div>
   	 	
         <div style="width:85%;min-width:980px;height:40px;border:1px #ccc solid;margin:0 auto;margin-top:25px;">
        <img src="images/head3.jpg">
        </div>
        
        
        
         <div style="width:85%;min-width:980px;border:1px #ccc solid;margin:0 auto;margin-top:10px;">
		<div>
		<div style="float:left"><h3>用户评论</h3></div>
		<div style="float:right;margin:20px">
		  <% if(session.getAttribute("loginid")==null){ %><a  data-toggle="modal" data-target="#myModal1"  class="btn btn-danger">我要评论</a>
		  <%}else{ %><a  data-toggle="modal" data-target="#myModal4"  class="btn btn-danger">我要评论</a><%} %></div>
		  </div>
<!-- 	<s:iterator value="#session.reviewList" id="review">
		<div style="padding:20px;clear:both;height:150px">
		<div style="width:100px;height:100px;float:left;border:1px solid #CCC;">
			<img src="images/personal.jpg" width="98" height="98">
			<center><p><s:property value="#review.client.username" /></p></center>
		</div>
		<div style="width:650px;height:100px;float:left;border:1px solid #CCC;margin-left:20px">
			<div style="width:100%;height:55px;margin:20px"><s:property value="#review.content"/></div>
			<div style="width:100%;padding-top:20px;padding-left:450px"><s:property value="#review.time"/> </div>
		
		</div>

		</div>
		</s:iterator> 	
		<div style="padding:20px;clear:both;height:150px">
		<div style="width:100px;height:100px;float:left;border:1px solid #CCC;">
			<img src="images/personal.jpg" width="98" height="98">
			<p>我只是个打酱油的</p>
		</div>
		<div style="width:650px;height:100px;float:left;border:1px solid #CCC;margin-left:20px">
			好好吃啊好好吃啊好好吃啊好好吃啊好好吃啊好好吃啊好好吃啊好好吃啊好好吃啊好好吃啊好好吃啊好好吃啊好好吃啊好好吃啊好好吃啊好好吃啊好好吃啊
		</div>

		</div>
		-->
		
		<div id="show"></div>
       <jsp:include page="pagination.jsp"/>


 	</div>
    </div>

      <hr>


      <!-- FOOTER -->
      <footer style="margin-top:80px">
        
      </footer>




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
       <p>用户名：</p><input type="text" name="client.username"class="form-control" placeholder="username" required autofocus><br>
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
		<p>联系地址：</p><input type="text" name="client.address" class="form-control" placeholder="address" required autofocus><br>
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

<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">请填写好你的订单信息</h4>
      
      </div>
      <div class="modal-body">
	  <form action="OrdersAction!myAdd" method="post" style="font-size:20px">
	  <s:iterator value="#session.loginClient" id="client">
	  <s:hidden value="%{#request.client.id}" name="orders.client.id"></s:hidden>
	  <input type="hidden" value="<%=session.getAttribute("detailId") %>" name="orders.menu.id"class="form-control" placeholder="username" required autofocus><br>     
       <p>收件人</p><input type="text" value="${client.username}" name="orders.name" class="form-control" placeholder="username" required autofocus><br>
       <p>数量</p><input type="text" name="orders.sum" value="1" class="form-control" placeholder="username" required autofocus><br>
       <p>单价</p><input type="text" name="orders.price"   value="<%=session.getAttribute("menuPrice") %>"  name="orders.price"class="form-control" placeholder="username" required autofocus><br>
       <p>联系电话</p><input type="text"  value="${client.telephone} "  name="orders.telephone"class="form-control" placeholder="username" required autofocus><br>
	   <p>联系地址</p><input type="text"  value="${client.address}" name="orders.address" class="form-control" placeholder="password" required autofocus><br>
	   </s:iterator>
	   <div class="modal-footer">
		
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary"  onClick="javascript:confirmMoney()">下单</button>
      </div>
	  </form>
      </div>
      
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- Modal -->
<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">评论</h4>
      </div>
      <div class="modal-body">
	  <form action="ReviewAction!myAdd?id=<%=session.getAttribute("detailId") %>" method="post" style="font-size:20px">
      
		<textarea name="review.content" rows="10" cols="60"></textarea>
		<input type="hidden" value="<%=session.getAttribute("detailId") %>" name="menu.id"/>
		<input type="hidden" value="<%=session.getAttribute("loginid") %>" name="client.id"/>
	   <div class="modal-footer">
		
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="submit" class="btn btn-primary">提交</button>
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
				<li><span>波比</span><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=123456&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:123456:51" title="小弟的私人飞机网上订餐" /></a></li>
			</ul>
		</div>
	</div>
	
</div>

  </body>
</html>

