<cfoutput>
<!--MAIN BANNER AREA START -->
<div class="page-banner-area page-blog" id="page-banner">
    <div class="overlay dark-overlay"></div>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8 m-auto text-center col-sm-12 col-md-12">
                <div class="banner-content content-padding">
                    <h1 class="banner-title">Blog Detail</h1>
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
			<div class="<cfif args.sidebar>col-md-8 col-lg-9<cfelse>col-md-12</cfif>">
				<!--- ContentBoxEvent --->
				#cb.event("cbui_preEntryDisplay")#
		
				<!--- post --->
				<div class="blog-post" id="post_#prc.entry.getContentID()#">
					
					<!--- Post image --->
					<cfif prc.entry.getFeaturedImageURL() NEQ "">
						<div class="img-outer"><img class="img-fluid" src="#prc.entry.getFeaturedImageURL()#" alt="#prc.entry.getTitle()#"></div>
					</cfif>

					<!--- Title --->
					<div class="post-title">
						<!--- Post detail --->
						<div class="mt-4 mb-3 d-flex">
					        <div class="post-author mr-3">
					            <i class="fa fa-user"></i>
					            <span class="h6 text-uppercase">#prc.entry.getAuthorName()#</span>
					        </div>

					        <div class="post-info">
					            <i class="fa fa-calendar-check"></i>
					            <span>#dateFormat(prc.entry.getDisplayPublishedDate(),"dd mmm yy" )#</span>
					        </div>
					    </div>

						<!--- Title --->
						<a href="#cb.linkEntry(prc.entry)#" class="h4" rel="bookmark">#prc.entry.getTitle()#</a>

						<!--- content --->
						<div class="post-content">
							#prc.entry.renderContent()#
						</div>
						
						<cfif cb.quickCategoryLinks(prc.entry) NEQ "">
							<div class="mt-5 mb-3">
	                            <h5 class="d-inline-block mr-3">Tags:</h5>
	                            <ul class="list-inline d-inline-block">
	                                <li class="list-inline-item">#cb.quickCategoryLinks(prc.entry)#</li>
	                            </ul>
	                        </div>
                        </cfif>

                        <div class="my-4">
                            <h5 class="d-inline-block mr-3">Share Now:</h5>
                            <ul class="list-inline d-inline-block">
                                <li class="list-inline-item"><a target="_blank" href="https://www.facebook.com/share.php?u=#cb.linkEntry(prc.entry)#"><i class="fab fa-facebook"></i></a></li>
                                <li class="list-inline-item"><a target="_blank" href="https://twitter.com/share?url=#cb.linkEntry(prc.entry)#&amp;text=#prc.entry.getTitle()#"><i class="fab fa-twitter"></i></a></li>
                                <li class="list-inline-item"><a target="_blank" href="https://www.linkedin.com/shareArticle?mini=true&amp;url=#cb.linkEntry(prc.entry)#"><i class="fab fa-linkedin"></i></a></li>
                            </ul>
                        </div>

					</div>
		
					<cfif !args.print>
					<!--- Comments Bar --->
					#html.anchor(name="comments")#
					<div class="post-comments">
						<div class="infoBar">
							<cfif NOT cb.isCommentsEnabled(prc.entry)>
							<i class="icon-warning-sign icon-2x"></i>
							Comments are currently closed
							</cfif>
						</div>
					</div>
					
					<!--- Display Comments --->
					<cfif cb.quickComments() NEQ "">
						<div class="row" id="comments">
							<div class="col-md-12 col-lg-12">
								<div class="comments my-4">
	                                <h3 class="mb-5">Comments :</h3>
									#cb.quickComments()#
	                            </div>					
							</div>
						</div>
					</cfif>
					<hr>
					<!--- Comment Form: I can build it or I can quick it? --->
					<div class="mt-5 mb-3" id="commentFormShell">
                        <h3 class="mt-5 mb-2">Leave a comment</h3>
                        <p class="mb-4">We don't spam at your inbox.</p>
						#cb.quickCommentForm( prc.entry )#
					</div>
					</cfif>
		
				</div>
		
				<!--- ContentBoxEvent --->
				#cb.event("cbui_postEntryDisplay")#
		
			</div>
		
			<cfif args.sidebar>
				<div class="col-md-4 col-lg-3" id="blog-sidenav">
					#cb.quickView(view='_blogsidebar', args=args)#
				</div>
			</cfif>
		</div>
	</div>
</section>
</cfoutput>