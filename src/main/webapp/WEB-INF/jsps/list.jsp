<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />

<title>供应商</title>

<link href="<%=basePath%>resources/css/all.css" rel="stylesheet"
    type="text/css" />
    
    <script type="text/javascript" src="<%=basePath%>resources/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/listsort.js"></script>
    <script type="text/javascript"> 
    function choose(){
        var ps=document.getElementById("ps").value;
        var pc=document.getElementById("pc").value;
        window.location.href="<%=basePath%>List.action?ps=" + ps +"&pc=" + pc;
        }
    </script>
    
</head>

<body style="background: #e1e9eb;">
    <form action="<%=basePath%>List.action?pc=${pb.pc}&ps=${pb.ps}" id="mainForm" method="post">
        <div class="right">
            <div class="current">当前位置：
                <a href="<%=basePath%>" style="color: #6E6E6E;">供应商管理</a>
                &gt; 供应商列表  
            </div>
            <div align="right">
                <shiro:guest>
                                                        欢迎游客访问，<a href="${pageContext.request.contextPath}/login.jsp">点击登录</a><br/>
                </shiro:guest>
                <shiro:user>
                                                        欢迎[<shiro:principal/>]登录，<a href="${pageContext.request.contextPath}/logout">点击退出</a><br/>
                </shiro:user>
            </div>
            <div class="rightCont">
                <p class="g_title fix">
                                                             供应商列表 
                    <shiro:hasRole name="admin">
                        <a class="btn03" href="${basePath}Add.action">新 增</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    </shiro:hasRole>
                        <a class="btn03" href="${basePath}Output.action?pc=${pb.pc}&ps=${pb.ps}">导出</a>
                </p>
                <table class="tab1">
                    <tbody>
                        <tr>
                            <td width="90" align="right">单位名称：</td>
                            <td><input name="name" type="text" class="allInput" /></td>
                            <td width="90" align="right">源代码：</td>
                            <td><input name="code" type="text" class="allInput" /></td>
                            <td width="85" align="right"><input type="submit" class="tabSub" value="查 询" /></td>
                        </tr>
                    </tbody>
                </table>
                <div class="zixun fix">
                    <table class="tab2" width="100%" summary="user infomation table" id="tableSort">
                    <thead>
                        
                            <tr>            
                                <th onclick="$.sortTable.sort('tableSort',0)" style="cursor: pointer;">序号</th>
                                <shiro:hasRole name="admin">
                                    <th onclick="$.sortTable.sort('tableSort',1)" style="cursor: pointer;">单位名称</th>
                                </shiro:hasRole>
                                <th onclick="$.sortTable.sort('tableSort',2)" style="cursor: pointer;">源代码</th>
                                <th onclick="$.sortTable.sort('tableSort',3)" style="cursor: pointer;">数据类型</th>
                                <th onclick="$.sortTable.sort('tableSort',4)" style="cursor: pointer;">数据范围</th>
                                <th onclick="$.sortTable.sort('tableSort',5)" style="cursor: pointer;">最新协议生效时间</th>
                                <th onclick="$.sortTable.sort('tableSort',6)" style="cursor: pointer;">最新协议到期时间</th>
                                <th onclick="$.sortTable.sort('tableSort',7)" style="cursor: pointer;">首次签约时间</th>
                                <th onclick="$.sortTable.sort('tableSort',8)" style="cursor: pointer;">主办人</th>
                                <th onclick="$.sortTable.sort('tableSort',9)" style="cursor: pointer;">协办人</th>
                                <th onclick="$.sortTable.sort('tableSort',10)" style="cursor: pointer;">客户状态</th>
                            </tr>
                            </thead>
                        <tbody>
                            <c:forEach items="${pb.beanList}" var="supplier" varStatus="status">
                                <tr <c:if test="${status.index % 2 != 0}">style='background-color:#ECF6EE;'</c:if>>
                                <!-- 
                                    <td>${status.index + 1}</td>
                                     -->
                                     
                                    <td>${supplier.id}</td>
                                    <shiro:hasRole name="admin">
                                        <td>${supplier.name}</td>
                                    </shiro:hasRole>
                                    <td>${supplier.code}</td>
                                    <td>${supplier.stype}</td>
                                    <td>${supplier.large}</td>
                                    <td>${supplier.btime}</td>
                                    <td>${supplier.etime}</td>
                                    <td>${supplier.qtime}</td>
                                    <td>${supplier.dboss}</td>
                                    <td>${supplier.xboss}</td>
                                    <td>${supplier.zhuangtai}</td>
                                    <td><a class="btn03" href="<%=basePath%>Detail.action?id=${supplier.id}">查看</a></td>
                                    
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                
                    <div class='page fix'>
                    
                                                                       共 <b>${pb.tr}</b> 条 
                          
                        <a href="<%=basePath%>List.action?pc=1&ps=${pb.ps}" class='first'>首页</a> 
                        <a href="<%=basePath%>List.action?pc=${pb.pc-1}&ps=${pb.ps}" class='pre'>上一页</a> 
                                                                         当前第<span>${pb.pc}/${pb.tp}</span>页 
                        
                        <a href="<%=basePath%>List.action?pc=${pb.pc+1}&ps=${pb.ps}" class='next'>下一页</a> 
                        <a href="<%=basePath%>List.action?pc=${pb.tp}&ps=${pb.ps}" class='last'>末页</a> 
                                                                         ✎每页显示&nbsp;
                        <input id="ps" type='text' value='${pb.ps}' class='allInput w28' />
                        &nbsp;条&nbsp; 
                                                                       ✎ 跳至&nbsp;
                        <input id="pc" type='text' value='${pb.pc}' class='allInput w28' />
                        &nbsp;页&nbsp; 
                        <a  class='go' onclick="choose()">GO</a>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>