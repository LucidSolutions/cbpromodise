<cfoutput>
	<div id="comment_#comment.getCommentID()#" class="media comment mb-4">
	    <!--- Anchor --->
        <a href="javascript:void(0)" class="img-fluid d-flex mr-4 rounded">#cb.quickAvatar( author=comment.getAuthorEmail(), size=60 )#</a>
        
        <div class="media-body">
            <!--- Comment Author --->
			<h5>
				#comment.getAuthor()#
			</h5>
			<span class="text-muted">#dateFormat(comment.getDisplayCreatedDate(),"dd mmm yyyy" )#</span>
			<p class="mt-2">#comment.getDisplayContent()#</p>

        </div>
	</div>
</cfoutput>