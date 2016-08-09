<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../common/headTag.jsp" />
<jsp:include page="../common/bodyHeader.jsp" />
	<div id="pageTitle">
	  	<div class="container">
	  		<h1>Role Info</h1>
	  	</div>
	  </div>
	  
	<div>
		<div class="container">
			
			<hr>
			<div class="row">
				<div class="col-md-3">Role Name : </div>
				<div class="col-md-3">
					${role.name}
				</div>
			</div>
		</div>
	</div>
	
<jsp:include page="../common/footer.jsp" />
</body>

</html>