<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../common/headTag.jsp" />
<jsp:include page="../common/bodyHeader.jsp" />
	  
	  <div id="pageTitle">
	  	<div class="container">
	  		<h1>User Management</h1>
	  	</div>
	  </div>
	  
      <div class="container">
      	      	
		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
		  <li class="active"><a href="#users" role="tab" data-toggle="tab">Users</a></li>
		  <li><a href="#addUser" role="tab" data-toggle="tab">Add User</a></li>
		</ul>
		
		<!-- Tab panes -->
		<div class="tab-content">
		  <div class="tab-pane active fade in well" id="users">
			<div class="row">
				<div class="col-md-12">
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
				</div>
			</div>
		  </div>
		  <div class="tab-pane fade well" id="addUser">
		  	<h2>Add New User</h2>
		  	<form method="post" action="${pageContext.request.contextPath}/admin/add-user">
			  <div class="panel panel-default">
                <div class="panel-body form-horizontal">
                    <div class="form-group">
                        <label for="concept" class="col-sm-3 control-label">User Name</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="userName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="description" class="col-sm-3 control-label">Password</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" name="password">
                        </div>
                    </div> 
                    <div class="form-group">
                        <label for="amount" class="col-sm-3 control-label">Retype Password</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" name="repassword">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="status" class="col-sm-3 control-label">Role</label>
                        <div class="col-sm-9">
                            <select class="form-control" name="role">
                              <c:forEach items="${roles}" var="role" varStatus="roleStatus">
                                <option value="${role.id}">${role.name}</option>
                              </c:forEach>
                            </select>
                        </div>
                    </div> 
                    <div class="form-group">
                        <div class="col-sm-12 text-right">
                            <button type="submit" class="btn btn-success preview-add-button">
                                <span class="glyphicon glyphicon-plus"></span> Ekle
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            </form>
		  </div>
		</div>
		
	  </div> <!-- container -->
  
 <jsp:include page="../common/footer.jsp" />
</body>

</html>