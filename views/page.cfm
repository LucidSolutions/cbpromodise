<cfoutput>
	<!--MAIN BANNER AREA START -->
	<div class="page-banner-area page-#listfirst(cb.getCurrentPage().getSlug(),'/')#" id="page-banner" style='<cfif prc.page.getFeaturedImageURL() NEQ ""> background: url("#prc.page.getFeaturedImageURL()#")</cfif>'>
	    <div class="overlay dark-overlay"></div>
	    <div class="container">
	        <div class="row justify-content-center">
	            <div class="col-lg-8 m-auto text-center col-sm-12 col-md-12">
	                <div class="banner-content content-padding">
	                    #prc.page.getExcerpt()#
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<!--MAIN HEADER AREA END -->
	<!--- Body Main --->
	#prc.page.renderContent()#

</cfoutput>