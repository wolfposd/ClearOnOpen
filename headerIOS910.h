 

@interface SPUISearchViewController : NSObject

// IOS 9

// called when view is being dismissed
- (void)_didFinishDismissing;
// clear stuff
- (void)_clearSearchResults;
- (void)_searchFieldEditingChanged;



// IOS 10:
- (void)clearSearchResults;
- (bool)clearSearchFieldAfterDismissal;


@end