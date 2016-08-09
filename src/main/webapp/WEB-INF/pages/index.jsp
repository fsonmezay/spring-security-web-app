<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="./common/headTag.jsp" />
<jsp:include page="./common/bodyHeader.jsp" />
    
    <div class="container">
    <div class="jumbotron" style="background-image: url('${pageContext.request.contextPath}/web_resource/images/banner.png');">
          <h1>Spring Bootstrap App</h1>
          <p class="lead">
          Spring Maven Hibernate Bootstrap template application
          </p>
        </div>
        
        <div class="row">
          <div class="col-md-12">
            <div class="well">
              <h1>Header</h1>
          </p>
          <p>
            Lorem Ipsum, 
          </p>
          <p>
          <sec:authorize access="hasRole('ROLE_USER')">
            <a href="${pageContext.request.contextPath}/admin/roles">Test Authorization (admin/roles)</a>
          </sec:authorize>
          </p>
            </div>
          </div>
        </div>
        
    </div> <!-- container -->
  
 <jsp:include page="./common/footer.jsp" />
</body>

</html>