<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../common/headTag.jsp" />
<jsp:include page="../common/bodyHeader.jsp" />
	<div class="container">
		<div class="well">
			<h1>Books</h1>
			<table class="table">
				<thead>
					<tr>
						<th>Id</th>
						<th>Name</th>
						<th>Author</th>
						<th>Year</th>
						<th width="70"></th>
					</tr>
				</thead>
				<tfoot>
			    	<tr>
				      	<td colspan="5">
				      		<a href="<c:url value="/create-book"/>" class="btn btn-info pull-right">
				      			<span class="glyphicon glyphicon-plus"></span>
				      			Create Book
				      		</a>
				      	</td>
			    	</tr>
			    </tfoot>
				<tbody>
					<c:forEach items="${books}" var="bookItem">
					<tr>
						<td>${bookItem.id}</td>
						<td>
							<spring:url value="/book/{bookId}" var="bookUrl">
				                <spring:param name="bookId" value="${bookItem.id}"/>
				            </spring:url>
				            <a href="${fn:escapeXml(bookUrl)}"><c:out value="${bookItem.name}"/></a>
						</td>
						<td>${bookItem.author}</td>
						<td>${bookItem.year}</td>
						<td>
							<spring:url value="/update-book/{bookId}" var="updBookUrl">
				                <spring:param name="bookId" value="${bookItem.id}"/>
				            </spring:url>
							<a class="btn btn-default btn-xs" href="${fn:escapeXml(updBookUrl)}">
								<span class="glyphicon glyphicon-pencil"></span>
							</a>
							<spring:url value="/delete-book" var="delBookUrl">
				                <spring:param name="book" value="${bookItem.id}"/>
				            </spring:url>
							<a data-confirm="delete" class="btn btn-default btn-xs" href="${fn:escapeXml(delBookUrl)}">
								<span class="glyphicon glyphicon-trash"></span>
							</a>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
	<script type="text/javascript">
	$('a[data-confirm]').click(function(ev) {
		var href = $(this).attr('href');
		$('#dataConfirmOK').click(function(){
			window.location.href=href;
			});
		$('#dataConfirmCancel').click(function(){
			window.location.href='#'});
		$('#silConfirmModal').modal({show:true});
		return false;
	});
	</script>
</body>

</html>