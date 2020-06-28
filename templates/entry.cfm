<cfoutput>
<cfif len( cb.themeSetting( 'blogLayout' ) )>
	<cfif cb.themeSetting( 'blogLayout' ) eq 'Two Column'>
		<div class="col-md-12 col-lg-6">
	<cfelse>
		<div class="col-md-12 col-lg-12">
	</cfif>
		<div class="blog-post" id="post_#entry.getContentID()#">
			<!--- Blog Post Image --->
			<cfif entry.getFeaturedImageURL() NEQ "">
				<div class="img-outer"><a href="#cb.linkEntry(entry)#"><img class="img-fluid" src="#entry.getFeaturedImageURL()#" alt="#entry.getTitle()#"></a></div>
			</cfif>

			<!--- Blog Post Detail --->
			<div class="mt-4 mb-3 d-flex">
		        <div class="post-author mr-3">
		            <i class="fa fa-user"></i>
		            <span class="h6 text-uppercase">#entry.getAuthorName()#</span>
		        </div>

		        <div class="post-info">
		            <i class="fa fa-calendar-check"></i>
		            <span>#dateFormat(entry.getDisplayPublishedDate(),"dd mmm yy" )#</span>
		        </div>
		    </div>

			<!--- Blog Post Title --->
			<a href="#cb.linkEntry(entry)#" class="h4" rel="bookmark">#entry.getTitle()#</a>

			<p class="mt-3">#left(ReReplaceNoCase(entry.renderContent(),"<[^>]*>","","ALL"),200)#...</p>
			<a href="#cb.linkEntry(entry)#" class="read-more">Read More <i class="fa fa-angle-right"></i></a>
		</div>
	</div>
</cfif>
</cfoutput>