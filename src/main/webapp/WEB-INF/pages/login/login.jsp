<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Configuration Server">
    <meta name="author" content="Ferdi Sonmezay - ferdi@ferdisonmezay.com">
    <title>Spring Security Web App</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/web_resource/css/bootstrap.min.css">

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>

<body>
  <div id="wrap">
    <div class="container">
      <div id="loginbox" style="margin-top: 50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3">
      <c:choose>
        <c:when test="${not empty error}">
          <div class="alert alert-danger">
            <a class="close" data-dismiss="alert" href="#">x</a>
            Invalid username or password
            <br />
          </div>
          <div class="panel panel-danger">
        </c:when>
        <c:otherwise>
          <div class="panel panel-success">
        </c:otherwise>
      </c:choose>
      <div class="panel-heading">
        <div class="panel-title">Login</div>
      </div>
        <div style="padding-top: 30px" class="panel-body">
          <div class="row">
            <div class="col-md-4" style="text-align:center;">
              <img alt="Ferdi Sonmezay | Spring Security Web App" src="${pageContext.request.contextPath}/web_resource/images/logo.png" style="margin-top:15px;">
              <br/> Spring Security Web App
            </div>
            <div class="col-md-6">
              <form name='loginForm' action="j_spring_security_check" method="POST" class="form-horizontal" role="form">
                <div style="margin-bottom: 25px" class="input-group">
                  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i> </span>
                  <input id="login-username" required="true" type="text" class="form-control" name="j_username" value="" placeholder="Username">
                </div>
                <div style="margin-bottom: 25px" class="input-group">
                  <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i> </span>
                  <input id="login-password" required="true" type="password" class="form-control" name="j_password" placeholder="Password">
                </div>
                <div style="margin-top: 10px" class="form-group">
                  <div class="col-sm-12 controls">
                    <button id="btn-login" type="submit" class="btn btn-sm btn-success pull-right">
                      <span class="glyphicon glyphicon-ok">&nbsp;</span>
                      Login
                    </button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script src="${pageContext.request.contextPath}/web_resource/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/web_resource/js/bootstrap.min.js"></script>
</body>
</html>
