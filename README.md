# spring-security-web-app

You can find the original documentation at [Ferdi Sonmezay Website](http://ferdisonmezay.com/)

# Section One: Creating a web application

Here is the source code of the project. You can  [download](https://github.com/fsonmezay/spring-security-web-app) or **clone from github**

```bash
$ git clone https://github.com/fsonmezay/spring-security-web-app.git
```


In this tutorial, I am going to create a sample java web application using:

 - [Apache Maven](http://maven.apache.org/),
 - [Spring Framework](http://spring.io/),
 - Spring Security,
 - Twitter bootstrap

I will create project structure with [Apache Maven](http://maven.apache.org/install.html) (version 3.2.3), so please make sure that maven is installed before you start.

**Creating a Java Project With Maven**

Navigate to the folder you want to create the project and in Command Line, type:

```bash
$ mvn archetype:generate -DgroupId=com.ferdisonmezay -DartifactId=springsecuritywebapp -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

```

This command will create `springsecuritywebapp` directory in your file system. When you navigate to the folder, you'll see that there's a directory called `src` and a file called `pom.xml`. the content of the 'pom.xml' file looks like this:

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>com.ferdisonmezay</groupId>
  <artifactId>springsecuritywebapp</artifactId>
  <packaging>jar</packaging>
  <version>1.0-SNAPSHOT</version>
  <name>springsecuritywebapp</name>
  <url>http://maven.apache.org</url>
  <dependencies>
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>3.8.1</version>
      <scope>test</scope>
    </dependency>
  </dependencies>
</project>
```

First we will add some personal staff, properties and build parameters to `pom.xml`. So, open the file in your favorite editor, and add these lines after `<name></name>` tag

```xml
<description>Ferdi Sonmezay | Spring Security Web App</description>
<developers>
  <developer>
    <name>Ferdi Sonmezay</name>
    <id>fsonmezay</id>
    <email>ferdi@ferdisonmezay.com</email>
    <organization>www.ferdisonmezay.com</organization>
    <roles>
      <role>Software Developer</role>
    </roles>
  </developer>
</developers>

<properties>
  <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
</properties>

<build>
  <plugins>
    <plugin>
      <groupId>org.mortbay.jetty</groupId>
      <artifactId>maven-jetty-plugin</artifactId>
      <version>6.1.26</version>
    </plugin>
  </plugins>
</build>
```

Then, we need to add some dependencies to `pom.xml` file.  between `<dependencies> ... </dependencies>` tags:

*Lines to add*

```xml
<!-- Spring -->
<dependency>
  <groupId>org.springframework</groupId>
  <artifactId>spring-webmvc</artifactId>
  <version>4.0.5.RELEASE</version>
</dependency>

<dependency>
  <groupId>org.springframework</groupId>
  <artifactId>spring-orm</artifactId>
  <version>4.0.5.RELEASE</version>
</dependency>

<!-- Spring Security -->
<dependency>
  <groupId>org.springframework.security</groupId>
  <artifactId>spring-security-web</artifactId>
  <version>3.2.5.RELEASE</version>
</dependency>

<dependency>
  <groupId>org.springframework.security</groupId>
  <artifactId>spring-security-config</artifactId>
  <version>3.2.5.RELEASE</version>
</dependency>

<dependency>
  <groupId>org.springframework.security</groupId>
  <artifactId>spring-security-core</artifactId>
  <version>3.2.5.RELEASE</version>
</dependency>

<dependency>
  <groupId>org.springframework.security</groupId>
  <artifactId>spring-security-taglibs</artifactId>
  <version>3.2.5.RELEASE</version>
</dependency>

<!-- Hibernate -->
<dependency>
  <groupId>org.hibernate</groupId>
  <artifactId>hibernate-core</artifactId>
  <version>4.3.6.Final</version>
</dependency>

<!-- Database driver -->
<dependency>
  <groupId>org.hsqldb</groupId>
  <artifactId>hsqldb</artifactId>
  <version>2.2.9</version>
</dependency>

<!-- JSTL -->
<dependency>
  <groupId>jstl</groupId>
  <artifactId>jstl</artifactId>
 <version>1.2</version>
</dependency>

<dependency>
  <groupId>org.apache.tomcat</groupId>
  <artifactId>jsp-api</artifactId>
  <version>6.0.32</version>
  <scope>provided</scope>
</dependency>

<!-- Junit -->
<dependency>
  <groupId>junit</groupId>
  <artifactId>junit</artifactId>
  <version>4.11</version>
</dependency>

<dependency>
  <groupId>com.thinkaurelius.thrift</groupId>
  <artifactId>thrift-server</artifactId>
  <version>0.3.3</version>
</dependency>
```

#### Converting to a web project

The project was generated as a Java Application, so we need to convert it to a web application.
For the conversion, we need to create a `webapp` directory in the `/src/main` folder.

Now, navigate to the webapp folder and create two folders in `webapp` folder.

 - web_resource
 - WEB-INF

We will keep our web resource files like images, js files, css files in web_resource folder, and web pages and web configurations in WEB-INF folder.


To make spring configuration we will need an `application context` configuration file, so create `applicationContext.xml` file in `WEB-INF` folder, and add these lines to the file.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:p="http://www.springframework.org/schema/p"
	xmlns:context="http://www.springframework.org/schema/context"
	xmlns:mvc="http://www.springframework.org/schema/mvc"
	xsi:schemaLocation="http://www.springframework.org/schema/beans
 						http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
 						http://www.springframework.org/schema/context
 						http://www.springframework.org/schema/context/spring-context-3.0.xsd
 						http://www.springframework.org/schema/mvc
 						http://www.springframework.org/schema/mvc/spring-mvc.xsd">

	<mvc:annotation-driven />
	<context:component-scan base-package="com.ferdisonmezay.springsecuritywebapp" />
	<mvc:resources mapping="/webapp/web_resource/**" location="/web_resource/" />
	<mvc:default-servlet-handler/>
	<bean
		class="org.springframework.web.servlet.view.InternalResourceViewResolver"
		p:prefix="/WEB-INF/pages/" p:suffix=".jsp" />
</beans>
```


Now, create a file called `web.xml`in the folder `WEB-INF`. Open the file and add these lines to the `web.xml` file.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://java.sun.com/xml/ns/javaee"
		 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
		 xsi:schemaLocation="http://java.sun.com/xml/ns/javaee
 							 http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd"
		 version="2.5">

	<display-name>Ferdi Sonmezay | Spring Security Web App</display-name>

	<servlet>
		<servlet-name>sampleSpringSecurity</servlet-name>
		<servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
		<init-param>
			<param-name>contextConfigLocation</param-name>
			<param-value>/WEB-INF/applicationContext.xml</param-value>
		</init-param>
		<load-on-startup>1</load-on-startup>
	</servlet>

	<servlet-mapping>
		<servlet-name>sampleSpringSecurity</servlet-name>
		<url-pattern>/</url-pattern>
	</servlet-mapping>

	<filter>  
	    <filter-name>encodingFilter</filter-name>  
	    <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>  
	    <init-param>  
	       <param-name>encoding</param-name>  
	       <param-value>UTF-8</param-value>  
	    </init-param>  
	    <init-param>  
	       <param-name>forceEncoding</param-name>  
	       <param-value>true</param-value>  
	    </init-param>  
	</filter>  

	<listener>
		<listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
	</listener>
</web-app>
```

Our project structure should look like

```bash
.
src
|__main
|__|__java
|__|__|__com
|__|__|___ferdisonmezay
|__|__|___|__App.java
|__|__webapp
|__|__|__WEB-INF
|__|__|__|__applicationContext.xml
|__|__|__|__web.xml
|__|__|__web_resource
|__test
|__|__java
|__|__|__com
|__|__|__|__ferdisonmezay
|__|__|__|__|__AppTest.java
pom.xml
```

Now, if you run `mvn jetty:run` on command line, and open `localhost:8080` on your browser, you should be able to see an error 404 page, containing a link to the application.


#### Making the Website work

Now we need a working website. So first we will add some resource files, to `web_resource` directory.
you can add any `*.css` or `*.js` files to `web_resources` directory.

I have created `css`, `js`, `images` directories in `web_resources` directory and, copied `bootstrap.min.css` file to `css` directory and `bootstrap.min.js` and `jQuery.js` files to `js` directory. I also copied some images that I will use for this project to `images` directory.

*NOTE :* You can download [Twitter Bootstrap](http://getbootstrap.com/getting-started/#download), and [jQuery](https://code.jquery.com/jquery-migrate-1.4.1.min.js) from these links

Now we need to create an html file to display the web content. Create `pages` directory in `WEB-INF` folder
and place an html file (`index.html`) in pages folder.

**index.html** (Remember that we will use *taglib* for future operations.)

```html

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
```


Now we have to create a controller, to handle web requests. First create a package called `com.ferdisonmezay.springsecuritywebapp.controller`, and then create a file called `MainController.java`

```java
// MainController.java
package com.ferdisonmezay.springsecuritywebapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping(value = "/*")
	public String mainController(Model model) {
		return "index";
	}

}
```

Now, if you run

```bash
$ mvn jetty:run
```

on terminal, and open `http://localhost:8080/springsecuritywebapp/` in your browser, you can see sample web application.

----
----

# Section Two: Adding Spring Security
First, we have to create a spring-security configuration file in WEB-INF directory.

`spring-security.xml`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans:beans xmlns="http://www.springframework.org/schema/security"
  xmlns:beans="http://www.springframework.org/schema/beans" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans
        http://www.springframework.org/schema/beans/spring-beans-3.2.xsd
        http://www.springframework.org/schema/security
        http://www.springframework.org/schema/security/spring-security-3.2.xsd">

  <http auto-config="true" access-denied-page="/accessdenied">
    <intercept-url pattern="/login" access="ROLE_ANONYMOUS"/>
    <intercept-url pattern="/loginfailed" access="ROLE_ANONYMOUS"/>
    <intercept-url pattern="/books" access="ROLE_USER,ROLE_SUPER_USER"/>
    <intercept-url pattern="/*" access="ROLE_USER, ROLE_SUPER_USER" />
    <intercept-url pattern="/admin/*" access="ROLE_SUPER_USER" />
    <form-login login-page="/login" default-target-url="/success" authentication-failure-url="/loginfailed" />
    <logout logout-success-url="/logout" />
  </http>

  <authentication-manager>
    <authentication-provider>
      <password-encoder hash="md5" />
      <user-service>
        <!-- user: sudo , password: su -->
        <user name="sudo"
              password="0b180078d994cb2b5ed89d7ce8e7eea2"
              authorities="ROLE_SUPER_USER, ROLE_USER" />

        <!-- user: webuser , password: user1 -->
        <user name="webuser"
              password="24c9e15e52afc47c225b757e7bee1f9d"
              authorities="ROLE_USER" />
      </user-service>
    </authentication-provider>
  </authentication-manager>

  <beans:bean id="webexpressionHandler" class="org.springframework.security.web.access.expression.DefaultWebSecurityExpressionHandler" />

</beans:beans>
```

Then we must create login.jsp, logout.jsp pages. We also have to modify our MainController.java file to handle spring security requests.

First create a `login` directory, in the `pages` directory. and add a jsp file `login.jsp` in login directory. The content of login.jsp should be as follows:

```html

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
            Invalid username or password.
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
```

Now we have to add spring-security configurations to `web.xml` file.

```xml
<context-param>
  <param-name>contextConfigLocation</param-name>
  <param-value>
    /WEB-INF/spring-security.xml
  </param-value>
</context-param>

<filter>
  <filter-name>springSecurityFilterChain</filter-name>
  <filter-class>org.springframework.web.filter.DelegatingFilterProxy</filter-class>
</filter>

<filter-mapping>
  <filter-name>springSecurityFilterChain</filter-name>
  <url-pattern>/*</url-pattern>
</filter-mapping>
```

Then, we need to add spring security request handlers to `MainController.java` file.

```java
@RequestMapping(value = "/login", method = RequestMethod.GET)
public String login(ModelMap model) {
  return "login/login";
}

@RequestMapping(value = "/loginfailed", method = RequestMethod.GET)
public String loginerror(ModelMap model) {
  model.addAttribute("error", "true");
  return "login/login";
}

@RequestMapping(value = "/logout", method = RequestMethod.GET)
public String logout(ModelMap model) {
  return "index";
}

```
