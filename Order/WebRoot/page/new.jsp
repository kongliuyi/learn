<%@page import="java.util.*" language="java" pageEncoding="utf-8" %>
<%@taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
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
	function abc(){	
	
		document.getElementById("a1").innerHTML=""+document.getElementById("content").value+"";
	}
</script>
</head>

<body style="background-color:#982930;" onload="abc()">
<jsp:include page="head.jsp"/>
<div style="padding-top:300px;margin-top:30px;height:1060px;width:100%;background:url(images/90117_top.jpg)no-repeat;">
	<div style="background-color:#FFFCF4;width:980px;min-height:500px;margin:0 auto;padding:50px">
	<s:iterator value="#session.newList" id="n">
	<input id="content" type="hidden" value="<s:property value="#n.content"/>"/>
	</s:iterator>
	<div id="a1"></div>
		</div>
		
</div>

</body>
</html>