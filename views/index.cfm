<cfoutput>
<!--MAIN BANNER AREA START -->
<div class="page-banner-area page-blog" id="page-banner">
    <div class="overlay dark-overlay"></div>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8 m-auto text-center col-sm-12 col-md-12">
                <div class="banner-content content-padding">
                    <h1 class="banner-title">Latest news</h1>
                    <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Unde, perferendis?</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!--MAIN HEADER AREA END -->

<!--- Body Main --->
<section id="body-main" class="section-padding">
	<div class="container">	
		<div class="row">
			<!--- Content --->
			<div class="col-md-8 col-lg-9">
				<div class="row">
					<!--- ContentBoxEvent --->
					#cb.event( "cbui_preIndexDisplay" )#
						
					<!--- Are we filtering by category? --->
					<cfif len( rc.category )>
						<div class="col-lg-12 col-md-12">
							<h4 class="mb-3">Category Filtering: '#rc.category#'</h4>
							<p><a href="#cb.linkBlog()#" class="btn btn-hero btn-circled btn-sm" title="Remove filter and view all entries">Remove Filter</a></p>
							<br/>
						</div>
					</cfif>
			
					<!--- Are we searching --->
					<cfif len( rc.q )>
						<div class="col-lg-12 col-md-12">
							<p><a class="btn btn-hero btn-circled btn-sm" href="#cb.linkBlog()#" title="Clear search and view all entries">Clear Search</a></p>
							<p>Searching by: '#rc.q#'</p>
							<br/>
						</div>
					</cfif>
			
					<!--- Entries displayed here --->
					#cb.quickEntries()#
			
					<!--- Pagination --->
					<cfif prc.entriesCount>
						<div class="col-lg-12 col-md-12 contentBar">
							#cb.quickPaging()#
						</div>
					</cfif>
			
					<!--- ContentBoxEvent --->
					#cb.event( "cbui_postIndexDisplay" )#
				</div>
			</div>

			<!--- SideBar --->
			<cfif args.sidebar>
				<div class="col-md-4 col-lg-3" id="blog-sidenav">
					#cb.quickView( view='_blogsidebar', args=args )#
				</div>
			</cfif>
		
		</div>
	</div>
</section>		
</cfoutput>