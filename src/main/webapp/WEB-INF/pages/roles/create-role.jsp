<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../common/headTag.jsp" />
<jsp:include page="../common/bodyHeader.jsp" />
	<div class="full-width-banner" style="background-image:url('${pageContext.request.contextPath}/web_resource/images/book.jpg');">
		<div class="container white-font">
			<h1>Create Role</h1>
			<hr>
			<form:form name="roleModel" id="role-insert-form" modelAttribute="role" method="post">
				<div class="row">
					<div class="col-md-2">Role Name : </div>
					<div class="col-md-2">
						<form:input class="form-control" path="name" required="true" /> 
						<form:errors path="name" element="span" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<form:button class="btn btn-info btn-sm pull-right" type="submit">
							<span class="glyphicon glyphicon-ok"></span>
							Submit
						</form:button>
					</div>
				</div>
			</form:form>
		</div>
	</div>
	
<jsp:include page="../common/footer.jsp" />
</body>

</html>