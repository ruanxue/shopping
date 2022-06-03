<%@ page pageEncoding="utf-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="head.jsp">
	<jsp:param value="首页" name="title" />
</jsp:include>
</head>
<body>
	<%
		String ident = (String) session.getAttribute("ident");
		if (ident == null) {
	%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 col-12">
				<nav class="navbar navbar-expand-lg navbar-light bg-light justify-content-between">
					<a class="navbar-brand" href="<%=request.getContextPath() %>/homepage.action">
						<img src="${pageContext.request.contextPath}/images/zhuye/biaoti.jpg" alt="logo" style="width:120px;">
					</a>
					<ul class="nav justify-content-end">
						<li class="nav-item"><a class="nav-link" href="#" data-toggle="modal" data-target="#loginModal">登录</a></li>
						<li class="nav-item"><a class="nav-link" href="#" data-toggle="modal" data-target="#registerModal">注册</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	<%
		} else if (ident.equals("1")) {
	%>
	<jsp:include page="/pages/admin/admin_nav.jsp" />
	<%
		} else if (ident.equals("0")) {
	%>
	<jsp:include page="/pages/user/user_nav.jsp" />
	<%
		}
	%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 col-12">
				<h4 class="list-group-item list-group-item-primary">热门商品</h4>
				<%
					List<Map<String, String>> hot = (List<Map<String, String>>) request.getAttribute("hot");
					if (hot != null) {
				%>
				<ul class="list-group">
					<%
						for (Map<String, String> hm : hot) {
					%>
					<li class="list-group-item"><img class="img-rounded"
						src="<%=request.getContextPath() %>/<%=hm.get("picture") %>" width="160" height="160" />
						<a
						href="<%=request.getContextPath() %>/show_detail.action?id=<%=hm.get("id") %>"
						target="_blank"><%=hm.get("foodname")%></a> &nbsp;&nbsp; <span><%=hm.get("price")%>元</span></li>
					<%
						}
					%>
				</ul>
				<%
					}
				%>
			</div>
			<div class="col-md-4 col-12">
				<h4 class="list-group-item list-group-item-primary">今日特价</h4>
				<%
					List<Map<String, String>> special = (List<Map<String, String>>) request.getAttribute("special");
					if (hot != null) {
				%>
				<ul class="list-group">
					<%
						for (Map<String, String> hm : special) {
					%>
					<li class="list-group-item"><img class="img-rounded"
						src="<%=request.getContextPath() %>/<%=hm.get("picture") %>"  width="160" height="160" />
						<a
						href="<%=request.getContextPath() %>/show_detail.action?id=<%=hm.get("id") %>"
						target="_blank"><%=hm.get("foodname")%></a> &nbsp;&nbsp; <span><%=hm.get("comment")%>元</span></li>
					<%
						}
					%>
				</ul>
				<%
					}
				%>
			</div>
			<div class="col-md-4 col-12">
				<h4 class="list-group-item list-group-item-primary">商城推荐</h4>
				<%
					List<Map<String, String>> recomm = (List<Map<String, String>>) request.getAttribute("recomm");
					if (hot != null) {
				%>
				<ul class="list-group">
					<%
						for (Map<String, String> hm : recomm) {
					%>
					<li class="list-group-item"><img class="img-rounded"
						src="<%=request.getContextPath() %>/<%=hm.get("picture") %>"  width="160" height="160"  />
						<a
						href="<%=request.getContextPath() %>/show_detail.action?id=<%=hm.get("id") %>"
						target="_blank"><%=hm.get("foodname")%></a> &nbsp;&nbsp; <span><%=hm.get("price")%>元</span></li>
					<%
						}
					%>
				</ul>
				<%
					}
				%>
			</div>
		</div>
	</div>
	<div class="col-12">
		<h4 class="list-group-item list-group-item-primary">家电</h4>
		<table class="table text-center">
			<th>
				<div class="col-12">
					<ul class="list-group">
						<li class="list-group-item">
							<img class="img-thumbnail" src="${pageContext.request.contextPath}/images/jiadian/xiaomibingxiang.jpg" width="160"
								 height="160"/><br>
							<a href="/shopping_war_exploded/show_detail.action?id=1">小米冰箱</a>
							<span>2399元</span></li>
					</ul>
				</div>
			</th>
			<th>
				<div class="col-12">
					<ul class="list-group">
						<li class="list-group-item">
							<img class="img-thumbnail" src="${pageContext.request.contextPath}/images/jiadian/xiaomikongtiao.jpg" width="160"
								 height="160"/><br>
							<a href="/shopping_war_exploded/show_detail.action?id=8">小米空调</a>
							<span>2399元</span></li>
					</ul>
				</div>
			</th>
			<th>
				<div class="col-12 ">
					<ul class="list-group">
						<li class="list-group-item">
							<img class="img-thumbnail" src="${pageContext.request.contextPath}/images/jiadian/saodijiqiren.jpg" width="160"
								 height="160"/><br>
							<a href="/shopping_war_exploded/show_detail.action?id=3">扫拖机器人</a>
							<span>1999元</span></li>
					</ul>
				</div>
			</th>
			<th>
				<div class="col-12">
					<ul class="list-group">
						<li class="list-group-item">
							<img class="img-thumbnail" src="${pageContext.request.contextPath}/images/jiadian/dianshi.jpg" width="160"
								 height="160"/><br>
							<a href="/shopping_war_exploded/show_detail.action?id=7">小米电视</a>
							<span>19999元</span></li>
					</ul>
				</div>
			</th>
		</table>
	</div>
	<div class="col-12">
		<h4 class="list-group-item list-group-item-primary">手机</h4>
		<table class="table text-center">
			<th>
				<div class="col-12">
					<ul class="list-group">
						<li class="list-group-item">
							<img class="img-thumbnail" src="${pageContext.request.contextPath}/images/shoji/12Pro.jpg" width="160"
								 height="160"/><br>
							<a href="/shopping_war_exploded/show_detail.action?id=2">小米12Pro</a>
							<span>4899元</span></li>
					</ul>
				</div>
			</th>
			<th>
				<div class="col-12">
					<ul class="list-group">
						<li class="list-group-item">
							<img class="img-thumbnail" src="${pageContext.request.contextPath}/images/shoji/K50Pro.jpg" width="160"
								 height="160"/><br>
							<a href="/shopping_war_exploded/show_detail.action?id=4">红米K50Pro</a>
							<span>2699元</span></li>
					</ul>
				</div>
			</th>
			<th>
				<div class="col-12 ">
					<ul class="list-group">
						<li class="list-group-item">
							<img class="img-thumbnail" src="${pageContext.request.contextPath}/images/shoji/heisha5Pro.jpg" width="160"
								 height="160"/><br>
							<a href="/shopping_war_exploded/show_detail.action?id=5">黑鲨5 Pro</a>
							<span>4299元</span></li>
					</ul>
				</div>
			</th>
			<th>
				<div class="col-12">
					<ul class="list-group">
						<li class="list-group-item">
							<img class="img-thumbnail" src="${pageContext.request.contextPath}/images/shoji/MIXFOLD.jpg" width="160"
								 height="160"/><br>
							<a href="/shopping_war_exploded/show_detail.action?id=6">小米折叠手机</a>
							<span>6999元</span></li>
					</ul>
				</div>
			</th>
		</table>
	</div>
	<div class="col-12">
		<h4 class="list-group-item list-group-item-primary">智能设备</h4>
		<table class="table text-center">
			<th>
				<div class="col-12">
					<ul class="list-group">
						<li class="list-group-item">
							<img class="img-thumbnail" src="${pageContext.request.contextPath}/images/shebei/dayinji.jpg" width="160"
								 height="160"/><br>
							<a href="/shopping_war_exploded/show_detail.action?id=1">喷墨打印机</a>
							<span>899元</span></li>
					</ul>
				</div>
			</th>
			<th>
				<div class="col-12">
					<ul class="list-group">
						<li class="list-group-item">
							<img class="img-thumbnail" src="${pageContext.request.contextPath}/images/shebei/CyberDog.jpg" width="160"
								 height="160"/><br>
							<a href="/shopping_war_exploded/show_detail.action?id=14">仿生机器人</a>
							<span>9999元</span></li>
					</ul>
				</div>
			</th>
			<th>
				<div class="col-12 ">
					<ul class="list-group">
						<li class="list-group-item">
							<img class="img-thumbnail" src="${pageContext.request.contextPath}/images/shebei/9hao.jpg" width="160"
								 height="160"/><br>
							<a href="/shopping_war_exploded/show_detail.action?id=15">九号平衡车</a>
							<span>2199元</span></li>
					</ul>
				</div>
			</th>
			<th>
				<div class="col-12">
					<ul class="list-group">
						<li class="list-group-item">
							<img class="img-thumbnail" src="${pageContext.request.contextPath}/images/shebei/touyingyi.jpg" width="160"
								 height="160"/><br>
							<a href="/shopping_war_exploded/show_detail.action?id=16">米家投影仪</a>
							<span>2499元</span></li>
					</ul>
				</div>
			</th>
		</table>
	</div>
	<div class="col-12">
		<h4 class="list-group-item list-group-item-primary">电脑</h4>
		<table class="table text-center">
			<th>
				<div class="col-12">
					<ul class="list-group">
						<li class="list-group-item">
							<img class="img-thumbnail" src="${pageContext.request.contextPath}/images/diannao/imac-24.jpg" width="160"
								 height="160"/><br>
							<a href="/shopping_war_exploded/show_detail.action?id=13">iMac</a>
							<span>12999元</span></li>
					</ul>
				</div>
			</th>
			<th>
				<div class="col-12">
					<ul class="list-group">
						<li class="list-group-item">
							<img class="img-thumbnail" src="${pageContext.request.contextPath}/images/diannao/MacPro.jpg" width="160"
								 height="160"/><br>
							<a href="/shopping_war_exploded/show_detail.action?id=9">Mac Pro</a>
							<span>47999元</span></li>
					</ul>
				</div>
			</th>
			<th>
				<div class="col-12 ">
					<ul class="list-group">
						<li class="list-group-item">
							<img class="img-thumbnail" src="${pageContext.request.contextPath}/images/diannao/mac-mini.jpg" width="160"
								 height="160"/><br>
							<a href="/shopping_war_exploded/show_detail.action?id=10">Mac mini</a>
							<span>6799元</span></li>
					</ul>
				</div>
			</th>
			<th>
				<div class="col-12">
					<ul class="list-group">
						<li class="list-group-item">
							<img class="img-thumbnail" src="${pageContext.request.contextPath}/images/diannao/mbp14.jpg" width="160"
								 height="160"/><br>
							<a href="/shopping_war_exploded/show_detail.action?id=11">MacBook Pro14</a>
							<span>18999元</span></li>
					</ul>
				</div>
			</th>
		</table>
	</div>
	<%@ include file="login.jsp"%>
	<%@ include file="register.jsp"%>
</body>
</html>