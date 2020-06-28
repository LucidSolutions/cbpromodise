<cfoutput>
	<!--- ContentBoxEvent --->
	#cb.event( "cbui_prePageDisplay" )#
	<!--MAIN BANNER AREA START -->
	<div class="page-banner-area page-blog" id="page-banner">
	    <div class="overlay dark-overlay"></div>
	    <div class="container">
	        <div class="row justify-content-center">
	            <div class="col-lg-8 m-auto text-center col-sm-12 col-md-12">
	                <div class="banner-content content-padding">
	                    <h1 class="banner-title">Search</h1>
	                    <p>Showing results for: <strong>#cb.getSearchTerm()#</strong></p>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<!--MAIN HEADER AREA END -->

	<!--- Body Main --->
	<section id="body-main" class="search-section">
		<!--- search Results --->
		<div class="container">
			<h4 class="mt-3 mb-2">Search Results</h4>
			<!--- Search Results --->
			#cb.getSearchResultsContent()#
			<!--- Search paging --->
			#cb.quickSearchPaging()#
		</div>
	</section>

	<!--- ContentBoxEvent --->
	#cb.event( "cbui_postPageDisplay" )#
</cfoutput>