


@interface SBSearchViewController : NSObject
- (void) searchGesture:(id)arg1 completedShowing:(BOOL)arg2;
- (void) _searchFieldEditingChanged;
@end


@interface SBSearchHeader : NSObject
    @property (readonly, assign, nonatomic) UITextField* searchField;
@end