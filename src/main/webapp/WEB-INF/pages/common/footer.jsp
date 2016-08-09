<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
	 </div>
	</div><!-- wrap -->

	<div id="footer">
		<div class="container">
			<p class="text-muted">&nbsp;</p>
		</div>
	</div>
	
<!-- Modal -->
<div class="modal fade" id="silConfirmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">Confirm!</h4>
      </div>
      <div class="modal-body">
        Confirm Delete?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="dataConfirmCancel">Cancel</button>
        <button type="button" class="btn btn-danger" id="dataConfirmOK">Delete</button>
      </div>
    </div>
  </div>
</div>

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