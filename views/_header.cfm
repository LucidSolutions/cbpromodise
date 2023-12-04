<cfoutput>
<nav class="navbar navbar-expand-lg fixed-top trans-navigation" id="header-main">
	<div class="container">
		<cfif cb.themeSetting( 'headerLogo' ) is "">
			<a href="#cb.linkHome()#" class="navbar-brand" title="#cb.siteTagLine()#" data-toggle="tooltip"><strong>#cb.siteName()#</strong></a>
		<cfelse>
			<a href="#cb.linkHome()#" class="navbar-brand brand-img" title="#cb.siteTagLine()#" data-toggle="tooltip"><img src="#cb.themeSetting( 'headerLogo' )#"></a>
		</cfif>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="##mainNav" aria-controls="mainNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon">
                <i class="fa fa-bars"></i>
            </span>
		</button>
		<!--- Generate Menu --->
		<div class="collapse navbar-collapse justify-content-end" id="mainNav">
			<ul class="navbar-nav">
				<cfset menuData = cb.rootMenu( type="data", levels="2" )>
				<!--- Iterate and build pages --->
				<cfloop array="#menuData#" index="menuItem">
					<cfif structKeyExists( menuItem, "subPageMenu" )>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#menuItem.link#" class="dropdown-toggle" data-toggle="dropdown">#menuItem.title# <i class="fa fa-chevron-down"></i></a>
							#buildSubMenu( menuData=menuItem.subPageMenu, parentLink=menuItem.link, parentTitle=menuItem.title )#
						</li>
					<cfelse>
						<cfif cb.isPageView() AND event.buildLink( cb.getCurrentPage().getSlug() ) eq menuItem.link>
							<li class="nav-item active">
						<cfelseif cb.isHomePage() AND menuItem.title eq 'Home'>
							<li class="nav-item active">
						<cfelse>
							<li class="nav-item">
						</cfif>
							<a class="nav-link" href="#menuItem.link#">#menuItem.title#</a>
						</li>
					</cfif>
				</cfloop>

				<!--- Blog Link, verify active --->
				<cfif ( !structKeyExists(prc.cbSettings, "cb_site_disable_blog") )>
					<cfif cb.isBlogView()><li class="nav-item active"><cfelse><li></cfif>
						<a class="nav-link" href="#cb.linkBlog()#">Blog</a>
					</li>
				</cfif>
			</ul>
		</div>
	</div>
</nav>


<cfscript>
any function buildSubMenu( required menuData, required parentLink, required parentTitle ){
	var menu = '<ul class="dropdown-menu">';

	// Parent
	menu &= '<li><a class="dropdown-item" href="#parentLink#">#parentTitle#</a></li>';

	for( var menuItem in arguments.menuData ){
		if( !structKeyExists( menuItem, "subPageMenu" ) ){
			menu &= '<li><a class="dropdown-item" href="#menuItem.link#">#menuItem.title#</a></li>';
		} else {
			menu &= '<li class="dropdown-submenu"><a href="#menuItem.link#" class="dropdown-toggle" data-toggle="dropdown">#menuItem.title#</a>';
			menu &= buildSubMenu( menuItem.subPageMenu, menuItem.link, menuItem.parentTitle );
			menu &= '</li>';
		}
	}
	menu &= '</ul>';

	return menu;
}
</cfscript>
</cfoutput>