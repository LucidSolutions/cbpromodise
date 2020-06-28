/**
* ContentBox - A Modular Content Platform
* Copyright since 2012 by Ortus Solutions, Corp
* www.ortussolutions.com/products/contentbox
* ---
* A cool basic widget that shows N recent entries
*/
component extends="contentbox.models.ui.BaseWidget" singleton{

	RecentEntriesHome function init(){
		// Widget Properties
		setName( "RecentEntriesHome" );
		setVersion( "1.0" );
		setDescription( "A cool basic widget that shows N recent blog entries on home page." );
		setAuthor( "Lucid Outsourcing Solutions" );
        setAuthorURL( "https://lucidoutsourcing.com/" );
		setIcon( "list" );
		setCategory( "Blog" );
		return this;
	}

	/**
	* Show n recent entries with some cool orderings
	* @max.hint The number of recent entries to show. By default it shows 5
	* @title.hint An optional title to display using an H2 tag.
	* @titleLevel.hint The H{level} to use, by default we use H2
	* @category.hint The list of categories to filter on
	* @category.multiOptionsUDF getAllCategories
	* @searchTerm.hint The search term to filter on
	* @searchTerm.label Search Term
	* @sortOrder.hint How to order the results, defaults to publishedDate
	* @sortOrder.label Sort Order
	* @sortOrder.options Most Recent,Most Popular,Most Commented
	*/
	any function renderIt(
		numeric max=3,
		title="",
		string titleLevel="2",
		string category="",
		string searchTerm="",
		string sortOrder="Most Recent"
	){
		var event 			= getRequestContext();
		var cbSettings 		= event.getValue( name="cbSettings", private=true );
		
		// Determine Sort Order
		switch( arguments.sortOrder ){
			case "Most Popular" 	: { arguments.sortOrder = "hits DESC";break; }
			case "Most Commented" 	: { arguments.sortOrder = "numberOfComments DESC";break;}
			default : { arguments.sortOrder = "publishedDate DESC"; }
		}

		var entryResults 	= entryService.findPublishedEntries( max=arguments.max,
											   					 category=arguments.category,
											   				 	 searchTerm=arguments.searchTerm,
											   				 	 sortOrder=arguments.sortOrder );
		var rString			= "";

		// iteration cap
		if( entryResults.count lt arguments.max){
			arguments.max = entryResults.count;
		}

		// generate recent comments
		saveContent variable="rString"{
			// title
			if( len(arguments.title) ){ writeOutput( "<h#arguments.titleLevel#>#arguments.title#</h#arguments.titleLevel#>" ); }
			writeOutput('<div class="row">');
			// iterate and create
			for(var x=1; x lte arguments.max; x++){
				writeOutput('<div class="col-lg-4 col-sm-6 col-md-4"><div class="blog-block">');
				writeOutput('<a href="#cb.linkEntry(entryResults.entries[ x ])#"> <img class="img-fluid" src="#entryResults.entries[ x ].getFeaturedImageURL()#" alt="#entryResults.entries[ x ].getTitle()#"></a>');
				writeOutput('<div class="blog-text">' );
                writeOutput('<h6 class="author-name"><span>#cb.quickCategoryLinks(entryResults.entries[ x ])#</span>#entryResults.entries[ x ].getAuthorName()#</h6>');
                writeOutput('<a href="#cb.linkEntry(entryResults.entries[ x ])#" class="h5 my-2 d-inline-block">#entryResults.entries[ x ].getTitle()#</a>');
                writeOutput('<p>#left(ReReplaceNoCase(entryResults.entries[ x ].renderContent(),"<[^>]*>","","ALL"),120)#...</p>');
                writeOutput('</div>');
				writeOutput( "</div></div>" );
			}
			writeOutput( "</div>" );
		}

		return rString;
	}

	/**
	* Get all the categories
	*/
	array function getAllCategories() cbIgnore{
		return categoryService.getAllNames();
	}

}
