<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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


<title>无标题文档</title>
</head>

<body>
	<shiro:guest>
	             欢迎游客访问，<a href="${pageContext.request.contextPath}/login.jsp">点击登录</a><br/>
	</shiro:guest>
	<shiro:user>
	             欢迎[<shiro:principal/>]登录，<a href="${pageContext.request.contextPath}/logout">点击退出</a><br/>
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
			<shiro:hasRole name="admin">
                                                 用户[<shiro:principal/>]拥有角色admin<br/>
                    <td width="604" height="104" colspan="2"> <p class="g_title fix">
                        <a class="btn03" href="${basePath}UpdateServlet.action?id=${supplier.id}">编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    </p></td>
            </shiro:hasRole>
		    </tr>
	       	<tr>
			<td width="604" colspan="2" rowspan="6"><p align="center">
			    <strong>基本信息</strong>
				</p>
				<p>单位名称：${supplier.name}</p>
				<p>源代码：${supplier.code}</p>
				<p>机构类型：${supplier.jtype}</p>
				<p>供应商状态：${supplier.zhuangtai}</p>
				<p>备注：${supplier.ps}</p>
				<p>企业征信报告：${supplier.report}</p>
				<p>主办人：${supplier.dboss}</p>
				<p>协办人：${supplier.xboss}</p></td>
		    </tr>
		<shiro:hasRole name="admin">
                                     用户[<shiro:principal />]拥有角色admin或user<br />
            <tr>
                <td height="33"><a
                    href="<%=basePath%>Boss.action?id=${supplier.id}">联系信息</a></td>
            </tr>
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
