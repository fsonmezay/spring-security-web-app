<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<body>
	<!-- Wrap all page content here -->
    <div id="wrap">

      <!-- Fixed navbar -->
      <div class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
          <div>
          	<div style="float:left;width:60px;">
          	  <img style="width:40px; margin-top:4px;" alt="Ferdi Sonmezay | Spring Security Web App" src="${pageContext.request.contextPath}/web_resource/images/logo.png">
	        </div>
	        <div class="navbar-header">
	            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
	              <span class="sr-only">Toggle navigation</span>
	              <span class="icon-bar"></span>
	              <span class="icon-bar"></span>
	              <span class="icon-bar"></span>
	            </button>
	            <a class="navbar-brand" href="./"> | Spring Security Web App</a>
	          </div>
          </div>
          <div class="collapse navbar-collapse pull-right">
            <ul class="nav navbar-nav">
              <li class="active"><a href="./"><span class="glyphicon glyphicon-home"></span> Home</a></li>
              <li><a href="${pageContext.request.contextPath}/books">Books</a></li>
              <sec:authorize access="hasRole('ROLE_SUPER_USER')">
	              <li class="dropdown">
	                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	                	<span class="glyphicon glyphicon-user"></span> Administration <b class="caret"></b></a>
	                <ul class="dropdown-menu">
	                  <li><a href="${pageContext.request.contextPath}/admin/roles">Role Management</a></li>
	                  <li><a href="${pageContext.request.contextPath}/admin/users">User Management</a></li>
	                </ul>
	              </li>
	          </sec:authorize>
	          <li><a href="<c:url value="/j_spring_security_logout" />"><spring:message code="lbl.menu.usermenu.signout" /></a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
      
      <div style="margin-top:75px;">
      