 

@interface SPUISearchViewController : NSObject
// called when view is being dismissed
- (void)_didFinishDismissing;
// clear stuff
- (void)_clearSearchResults;
- (void)_searchFieldEditingChanged;
@end