<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>联系人信息</title>
</head>

<body>
	<shiro:guest>
                       欢迎游客访问，
        <a href="${pageContext.request.contextPath}/login.jsp">点击登录</a>
		<br />
	</shiro:guest>
	<shiro:user>
                         欢迎[<shiro:principal />]登录，
        <a href="${pageContext.request.contextPath}/logout">点击退出</a>
		<br />
	</shiro:user>
	
	<table width="979" height="570" border="1">
		<tr>
			<td width="317" height="225" rowspan="2">
			    <p>源代码：${supplier.code}</p>
				<p>客户状态：${supplier.zhuangtai}</p>
				<p>数据类型：${supplier.stype}</p>
				<p>数据范围：${supplier.large}</p>
				<p>主办人：${supplier.dboss}</p>
				<p>协办人：${supplier.xboss}</p>
				<p>&nbsp;</p></td>
			<td width="604" height="104" colspan="2">
			    <p class="g_title fix">
					<shiro:hasPermission name="user:create">
		                                                    用户[<shiro:principal />]拥有权限user:create<br />
							<a class="btn03" href="${basePath}UpdateServlet.action?id=${supplier.id}">
					                编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;
		             </p></td>
			    </shiro:hasPermission>
		</tr>
		<tr>

			<shiro:hasRole name="admin">
				<td width="604" colspan="2" rowspan="6"><p align="center">
					<p>
						用户[<shiro:principal />]拥有角色admin<br />
					</p>
					<strong>商务联系人</strong>
					<p>张三</p>
					<p>王五</p>
				</td>
			</shiro:hasRole>

			<shiro:hasAnyRoles name="admin,user">
				<td width="604" colspan="2" rowspan="6">
					<p>
						用户[
						<shiro:principal />
						]拥有角色user<br />
					</p>
					<strong>技术联系人</strong>
					<p>李四</p>
					<p>赵薇</p>
					<p>撒网</p>
					<p>哥儿</p></td>
			</shiro:hasAnyRoles>
        </tr>
		
			<tr>
				<td height="33"><a
					href="<%=basePath%>Boss.action?id=${supplier.id}">联系信息</a></td>
			</tr>
		<shiro:hasRole name="admin">
                                     用户[<shiro:principal />]拥有角色admin<br />
			<tr>
				<td height="33">合同信息</td>
			</tr>
			<tr>
				<td height="33">服务信息</td>
			</tr>
			<tr>
				<td height="33">商务沟通记录</td>
			</tr>
			<tr>
				<td height="33">数据源概况</td>
			</tr>
		</shiro:hasRole>
	</table>
</body>
</html>
