<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>东华理工大学校园订餐中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body><div style="height:500px">
 
<s:iterator value="#request.userlist" id="review">
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
			
		</div>

  </body>
</html>
