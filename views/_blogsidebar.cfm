<cfoutput>
<!--- ContentBoxEvent --->
#cb.event( "cbui_BeforeSideBar" )#

<div class="row">
	<cfif cb.themeSetting( "showEntriesSearchBlogSide", true )>
		<div class="col-md-12">	
			<div class="sidebar-widget search">	
				#cb.widget( "SearchBlog" )#
			</div>
		</div>
	</cfif>

	<cfif cb.themeSetting( "showCategoriesBlogSide", true )>
		<div class="col-md-12">	
			<div class="sidebar-widget category">
				<h5 class="mb-3">Category</h5>
				<!---
				Display Categories using ContentBox collection template rendering
				the default convention for the template is "category.cfm" you can change it via the quickCategories() 'template' argument.
				--->
				<ul class="list-styled">
					#cb.quickCategories()#		
				</ul>
			</div>
		</div>
	</cfif>

	<cfif cb.themeSetting( "showRecentEntriesBlogSide", true )>
		<div class="col-md-12">	
			<div class="sidebar-widget category">
				<h5 class="mb-3">Recent Entries</h5>
				#cb.widget( 'RecentEntries' )#
			</div>
		</div>
	</cfif>

	<cfif cb.themeSetting( "showSiteUpdatesBlogSide", true )>
		<div class="col-md-12">	
			<!--- RSS Buttons --->
			<div class="sidebar-widget rss">
				<h5 class="mb-3">Site Updates</h5>
				<ul class="list-styled">
					<li><i class="fa fa-rss"></i> <a href='#cb.linkRSS()#' title="Subscribe to our RSS Feed!">RSS Feed</a></li>
				</ul>
			</div>
		</div>
	</cfif>

	<cfif cb.themeSetting( "showArchivesBlogSide", true )>
		<div class="col-md-12">	
			<div class="sidebar-widget archives">
				<h5 class="mb-3">Archives</h5>
				#cb.widget( "ArchivesBlog" )#
			</div>
		</div>
	</cfif>

</div>

<!--- ContentBoxEvent --->
#cb.event( "cbui_afterSideBar" )#
</cfoutput>