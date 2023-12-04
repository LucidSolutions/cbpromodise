<cfoutput>
<footer class="section-padding" id="footer">
	<div class="container">
		<div class="row">
            <div class="col-lg-5 col-sm-8 col-md-8">
                <div class="footer-widget footer-link">
                    <h4>We concern about you<br> to grow business rapidly.</h4>
                    <p>#cb.themeSetting( 'footerAboutBox' )#</p>
                </div>
            </div>
            <div class="col-lg-2 col-sm-4 col-md-4">
                <div class="footer-widget footer-link">
                    <h4>About</h4>
                    <ul>
                        <cfset menuData = cb.rootMenu( type="data", levels="2" )>
                        <cfloop array="#menuData#" index="menuItem">
                            <cfif structKeyExists( menuItem, "subPageMenu" )>
                                <li>
                                    <a href="#menuItem.link#" class="footerDropdownMenu">#menuItem.title#</a>
                                    #buildSubMenu( menuData=menuItem.subPageMenu, parentLink=menuItem.link, parentTitle=menuItem.title )#
                                </li>
                            <cfelse>
                                <cfif cb.isPageView() AND event.buildLink( cb.getCurrentPage().getSlug() ) eq menuItem.link>
                                    <li>
                                <cfelse>
                                    <li>
                                </cfif>
                                    <a href="#menuItem.link#">#menuItem.title#</a>
                                </li>
                            </cfif>
                        </cfloop>

                        <!--- Blog Link, verify active --->
                        <cfif ( !structKeyExists(prc.cbSettings, "cb_site_disable_blog") )>
                            <cfif cb.isBlogView()><li><cfelse><li></cfif>
                                <a href="#cb.linkBlog()#">Blog</a>
                            </li>
                        </cfif>
                    </ul>
                </div>
            </div>

            <div class="col-lg-2 col-sm-6 col-md-6">
                <div class="footer-widget footer-link">
                    <h4>Quick Links</h4>
                    #cb.widget( 'Menu',{slug="quick-links"} )#
                </div>
            </div>
            <div class="col-lg-3 col-sm-6 col-md-6">
                <div class="footer-widget footer-text">
                    <h4>Our location</h4>
                    <p class="mail"><span>Mail:</span> #cb.themeSetting( 'siteEmailBox' )#</p>
                    <p><span>Phone :</span>#cb.themeSetting( 'sitePhoneBox' )#</p>
                    <p><span>Location:</span> #cb.themeSetting( 'AddressBox' )#</p>
                </div>
            </div>
        </div>

		<div class="row">
            <div class="col-lg-12 text-center">
                <p>Theme Developed By <a href="https://lucidoutsourcing.com/">Lucid Outsourcing Solutions Pvt. Ltd.</a></p>
                <div class="footer-copy">#cb.themeSetting( 'footerBox' )#</div>
            </div>
        </div>
		<!--- contentboxEvent --->
		#cb.event( "cbui_footer" )#
	</div>
</footer>

<cfscript>
any function buildSubMenu( required menuData, required parentLink, required parentTitle ){
    var menu = '<ul class="pl-4">';

    for( var menuItem in arguments.menuData ){
        if( !structKeyExists( menuItem, "subPageMenu" ) ){
            menu &= '<li><a href="#menuItem.link#">#menuItem.title#</a></li>';
        } else {
            menu &= '<li class="submenu"><a href="#menuItem.link#">#menuItem.title#</a>';
            menu &= buildSubMenu( menuItem.subPageMenu, menuItem.link, menuItem.parentTitle );
            menu &= '</li>';
        }
    }
    menu &= '</ul>';

    return menu;
}
</cfscript>
</cfoutput>