
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring Security Web App</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/web_resource/css/bootstrap.min.css">
</head>
<body>
  <nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
      <div>
        <div style="float: left; width: 60px;">
          <img style="width: 40px; margin-top: 4px;" alt="Ferdi Sonmezay | Spring Security Web App" src="${pageContext.request.contextPath}/web_resource/images/logo.png">
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
          <li><a href="<c:url value="/j_spring_security_logout" />">Logout</a></li>
        </ul>
      </div>
    </div>
  </nav>

  <div class="container" style="margin-top: 90px;">
    <div class="jumbotron">
      <h1>Spring Bootstrap App</h1>
      <p class="lead">Spring Maven Hibernate Bootstrap template application</p>
    </div>
  </div>

  <script src="${pageContext.request.contextPath}/web_resource/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/web_resource/js/bootstrap.min.js"></script>
</body>
</html>
