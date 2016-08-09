<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../common/headTag.jsp" />
<jsp:include page="../common/bodyHeader.jsp" />
	<div class="full-width-banner" style="background-image:url('${pageContext.request.contextPath}/web_resource/images/book.jpg');">
		<div class="container white-font">
			<h1>Create Book</h1>
			<hr>
			<form:form name="bookModel" id="book-insert-form" modelAttribute="book" method="post">
				<div class="row">
					<div class="col-md-2">Book Name : </div>
					<div class="col-md-2">
						<form:input class="form-control" path="name" required="true" /> 
						<form:errors path="name" element="span" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-2">Author : </div>
					<div class="col-md-2">
						<form:input path="author" class="form-control" /> 
						<form:errors path="author" element="span" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-2">Year : </div>
					<div class="col-md-2">
						<form:input path="year" type="number" min="1980" step="1" pattern="\d+" class="form-control" /> 
						<form:errors path="year" element="span" />
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