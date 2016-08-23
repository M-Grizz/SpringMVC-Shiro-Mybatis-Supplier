<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />

<title>供应商修改</title>

<link href="<%=basePath%>resources/css/all.css" rel="stylesheet"
	type="text/css" />
</head>

<body style="background: #e1e9eb;">
	<form action="<%=basePath%>UpdateOneServlet.action?id=${supplier.id}"
		id="mainForm" method="post">
		<div class="right">
			<div class="current">
				当前位置： <a href="<%=basePath%>" style="color: #6E6E6E;">供应商管理</a> &gt;
				修改供应商
			</div>
			<div class="rightCont">
				<p class="g_title fix">
					修改供应商 <a class="btn03" href="${basePath}List.action">返回</a>
				</p>
				<table class="tab1">
					<tbody>

						<tr>
							<td width="90" align="right">序号：</td>
							<td>${supplier.id}</td>
						</tr>
						<tr>
							<td width="90" align="right">单位名称：</td>
							<td><input name="name" type="text" class="allInput"
								value="${supplier.name}" /></td>
						</tr>
						<tr>
							<td width="90" align="right">源代码：</td>
							<td><input name="code" type="text" class="allInput"
								value="${supplier.code}" /></td>
						</tr>
						<tr>
							<td width="90" align="right">机构类型：</td>
							<td><select name="jtype">

									<option value="计算机制造业">计算机制造业</option>
							</select></td>
						</tr>
						<tr>
							<td width="90" align="right">供应商状态：</td>
							<td><select name="zhuangtai">
									<option value="测试客户">测试客户</option>
									<option value="合作客户">合作客户</option>
									<option value="合作到期">合作到期</option>
									<option value="冻结客户">冻结客户</option>
									<option value="商务洽谈中">商务洽谈中</option>
							</select></td>
						</tr>


						<tr>
							<td width="90" align="right">备注：</td>
							<td><input name="pss" type="text" class="allInput"
								value="${supplier.ps}" /></td>
						</tr>
						<tr>
							<td width="90" align="right">企业征信报告：</td>
							<td><input name="report" type="text" class="allInput"
								value="${supplier.report}" /></td>
						</tr>

						<tr>
							<td width="90" align="right">主办人：</td>
							<td><input name="dboss" type="text" class="allInput"
								value="${supplier.dboss}" /></td>
						</tr>
						<tr>
							<td width="90" align="right">协办人：</td>
							<td><input name="xboss" type="text" class="allInput"
								value="${supplier.xboss}" /></td>
						</tr>

						<tr>
							<td width="85" align="right"><input type="submit"
								class="tabSub" value="修改" /></td>
						</tr>
					</tbody>
				</table>

			</div>
		</div>
	</form>
</body>
</html>