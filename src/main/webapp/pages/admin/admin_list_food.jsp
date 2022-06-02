<%@ page pageEncoding="utf-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/pages/head.jsp">
	<jsp:param value="管理员管理商品信息" name="title" />
</jsp:include>
</head>
<body>
	<jsp:include page="/pages/admin/admin_nav.jsp">
		<jsp:param value="food_m" name="fun" />
	</jsp:include>
	<div class="container-fluid">
		<div class="card border">
			<div class="card-header border">
				<form class="form-inline"
					action="<%=request.getContextPath()%>/admin/admin_list_food.action"
					method="post">
					<input type="search" class="form-control mr-sm-2"
						placeholder="按菜名搜索" name="s_fn"
						value="<%=request.getParameter("s_fn") != null ? request.getParameter("s_fn") : ""%>">
					<select class="form-control mr-sm-2" name="s_type">
						<option value="">所有分类</option>
						<%
							List<Map<String, String>> types = (List<Map<String, String>>) request.getAttribute("types");
							for (Map<String, String> type : types) {
						%>
						<option value="<%=type.get("id")%>"
							<%=type.get("id").equals(request.getParameter("s_type")) ? "selected" : ""%>>
							<%=type.get("typename")%></option>
						<%
							}
						%>
					</select>
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜索</button>
					&nbsp;&nbsp;
				</form>
			</div>
			<%
				List<Map<String, String>> foods = (List<Map<String, String>>) request.getAttribute("foods");
				if (foods != null) {
			%>
			<div class="card-body">
				<div class="table-responsive-xl">
					<table class="table table-striped table-hover table-sm">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">商品名称</th>
								<th scope="col">简介</th>
								<th scope="col">型号</th>
								<th scope="col">价格</th>
								<th scope="col">分类</th>
								<th scope="col">图片</th>
								<th scope="col">购买率</th>
								<th scope="col">备注</th>
								<th scope="col">操作</th>
							</tr>
						</thead>
						<tbody>
							<%
								int num = 0;
									for (Map<String, String> food : foods) {
										num++;
							%>
							<tr>
								<th scope="row"><%=num%></th>
								<td><%=food.get("foodname")%></td>
								<td><%=food.get("feature")%></td>
								<td><%=food.get("material")%></td>
								<td><%=food.get("price")%></td>
								<td><%=food.get("typename")%></td>
								<td><img class="img-rounded"
									src="<%=request.getContextPath()%>/<%=food.get("picture")%>"  width="160" height="160"  />
								</td>
								<td><%=food.get("hits")%></td>
								<td>
									<%
										if (food.get("comment").equals("0")) {
													out.println("商城推荐");
												} else if (food.get("comment").equals("-1")) {
													out.println("&nbsp;");
												} else {
													out.println("特价" + food.get("comment") + "元");
												}
									%>
								</td>
								<td><a class="btn btn-sm btn-outline-warning"
									href="<%=request.getContextPath()%>/admin/admin_edit_food.action?id=<%=food.get("id") %>"
									role="button">修改</a></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>