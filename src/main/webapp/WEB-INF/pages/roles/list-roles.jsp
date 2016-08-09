<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../common/headTag.jsp" />
<jsp:include page="../common/bodyHeader.jsp" />
	<div class="container">
		<div class="well">
			<h1>Roles</h1>
			<table class="table">
				<thead>
					<tr>
						<th>Id</th>
						<th>Name</th>
						<th width="70"></th>
					</tr>
				</thead>
				<tfoot>
			    	<tr>
				      	<td colspan="5">
				      		<a href="<c:url value="/admin/create-role"/>" class="btn btn-info pull-right">
				      			<span class="glyphicon glyphicon-plus"></span>
				      			Create Role
				      		</a>
				      	</td>
			    	</tr>
			    </tfoot>
				<tbody>
					<c:forEach items="${roles}" var="roleItem">
					<tr>
						<td>${roleItem.id}</td>
						<td>
							<spring:url value="/admin/role/{roleId}" var="roleUrl">
				                <spring:param name="roleId" value="${roleItem.id}"/>
				            </spring:url>
				            <a href="${fn:escapeXml(roleUrl)}"><c:out value="${roleItem.name}"/></a>
						</td>
						
						<td>
							<spring:url value="/admin/update-role/{roleId}" var="updRoleUrl">
				                <spring:param name="roleId" value="${roleItem.id}"/>
				            </spring:url>
							<a class="btn btn-default btn-xs" href="${fn:escapeXml(updRoleUrl)}">
								<span class="glyphicon glyphicon-pencil"></span>
							</a>
							<spring:url value="/admin/delete-role" var="delRoleUrl">
				                <spring:param name="role" value="${roleItem.id}"/>
				            </spring:url>
							<a data-confirm="delete" class="btn btn-default btn-xs" href="${fn:escapeXml(delRoleUrl)}">
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