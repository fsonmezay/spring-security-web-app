<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<table class="table table-striped">
	<thead>
		<tr>
			<th><center>ID</center></th>
			<th>User Name</th>
			<th>Password</th>
			<th>Role</th>
			<th>Delete</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${users}" var="user" varStatus="status">
		<tr>
			<td align="center">${user.id}</td>
			<td>${user.userName}</td>
			<td>${user.password}</td>
			<td>${user.role.name}</td>
			<td>
				<a data-confirm="" 
					class="btn btn-xs btn-danger"
					data-toggle="modal" data-target="#silConfirmModal" href="${pageContext.request.contextPath}/admin/delete-user?userId=${user.id}">
					<span class="glyphicon glyphicon-remove"></span>
				</a> 
			</td>
		</tr>	
	</c:forEach>
	</tbody>
</table>