<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<head>
<!--<style type="text/css">
.pagination{
 overflow:hidden;
 margin:0;
 padding:10px 10px 6px 10px;
 border-top:1px solid #f60;
 _zoom:1;
}
.pagination *{
 display:inline;
 float:left;
 margin:0;
 padding:0;
 font-size:12px;
}
.pagination i{
 float:none;
 padding-right:1px;
}
.currentPage b{
 float:none;
 color:#f00;
}
.pagination li{
 list-style:none;
 margin:0 5px;
}
.pagination li li{
 position:relative;
 margin:-2px 0 0;
 font-family: Arial, Helvetica, sans-serif
}
.firstPage a,.previousPage a,.nextPage a,.lastPage a{
 overflow:hidden;
 height:0;
 text-indent:-9999em;
 border-top:8px solid #fff;
 border-bottom:8px solid #fff;
}
.pagination li li a{
 margin:0 1px;
 padding:0 4px;
 border:3px double #fff;
 +border-color:#eee;
 background:#eee;
 color:#06f;
 text-decoration:none;
}
.pagination li li a:hover{
 background:#f60;
 border-color:#fff;
 +border-color:#f60;
 color:#fff;
}
li.firstPage{
 margin-left:40px;
 border-left:3px solid #06f;
}
.firstPage a,.previousPage a{
 border-right:12px solid #06f;
}
.firstPage a:hover,.previousPage a:hover{
 border-right-color: #f60;
}
.nextPage a,.lastPage a{
 border-left:12px solid #06f;
}
.nextPage a:hover,.lastPage a:hover{
 border-left-color:#f60;
}
li.lastPage{
 border-right:3px solid #06f;
}
li li.currentState a{
 position:relative;
 margin:-1px 3px;
 padding:1px 4px;
 border:3px double #fff;
 +border-color:#f60;
 background:#f60;
 color:#fff;
}
li.currentState,.currentState a,.currentState a:hover{
 border-color:#fff #ccc;
 cursor:default;
}
</style>-->
 <script type="text/javascript">
	var xmlhttp;
		function main(url,method){
	
		if(window.XMLHttpRequest){
			xmlhttp = new XMLHttpRequest();
		}else{
			xmlhttp = new ActiveXObject("Microsoft.XMLHttp");
		}
		
		xmlhttp.onreadystatechange=method;
		xmlhttp.open("get",url,true);
		xmlhttp.send();
		}
		
		
		
		function show(){
	
			main("ReviewAction!listUserinfoByPage?currentIndex=0",function (){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				document.getElementById("show").innerHTML=xmlhttp.responseText;
			}
		});
			
		}
		function show1(id){

			main("ReviewAction!listUserinfoByPage?currentIndex="+id+"",function (){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				document.getElementById("show").innerHTML=xmlhttp.responseText;
			}
		});
		}
	</script>
	</head><body onload="show()">
	
	<div style="margin-top:50px">
	  	<center>
		<ul class="pagination pagination-lg">
		 <li 	><a onclick="show1(0)"" title="首页">&laquo;</a></li>
		 <s:iterator var="counter" begin="1" end="#request.pg.pageCount">
    	<s:if test="#counter==#request.pg.currentPage">
    	 <li  title="当前页"  >
    	 </s:if>
    	  <s:else>
    	 <li>
    	  </s:else>
    	 <a title="转到第<s:property value="#counter" />页" onclick="show1(<s:property value="#request.pg.indexes[#counter-1]" />)"><s:property value="#counter" /></a></li>

    </s:iterator>
      <li>
      <a onclick="show1(<s:property value="#request.pg.lastIndex" />)" title="尾页">&raquo;</a>
      </li>
				</ul>
		</center>
	  </div>

<!-- <ul class="pagination" title="分页列表">
  <li class="totalAnnal">总记录数：<i><s:property value="#pg.totalCount" /></i></li>
  <li class="totalPage">总页数：<i><s:property value="#pg.pageCount" /></i></li>
  <li class="currentPage">当前页：<b><s:property value="#pg.currentPage" /></b></li>
  <li class="firstPage"><a onclick="show1(0)" title="首页">首页</a></li>
  <li class="previousPage"><a onclick="show1(<s:property value="#request.pg.previousIndex" />)" title="前一页">前一页</a></li>
  <li>
    <ol>
    <s:iterator var="counter" begin="1" end="#request.pg.pageCount">
    	<s:if test="#counter==#request.pg.currentPage">
    	 <li  title="当前页"  >
    	 </s:if>
    	  <s:else>
    	 <li>
    	  </s:else>
    	
    	 <a title="转到第<s:property value="#counter" />页" onclick="show1(<s:property value="#request.pg.indexes[#counter-1]" />)"><s:property value="#counter" /></a></li>

   
    </s:iterator>
    
    </ol>
  </li>
  <li class="nextPage"><a onclick="show1(<s:property value="#request.pg.nextIndex" />)" >后一页</a></li>
  <li class="lastPage"><a onclick="show1(<s:property value="#request.pg.lastIndex" />)" title="尾页">尾页</a></i>
</ul>
-->
</body></head>
