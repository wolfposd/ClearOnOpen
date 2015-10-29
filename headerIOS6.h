

@interface SBSearchController : NSObject
    -(id) init;
    - (void)searchBar:(id)arg1 textDidChange:(id)arg2;
    - (void)setShowsKeyboard:(BOOL)arg1 animated:(BOOL)arg2;
@end



@interface SBSearchView : NSObject
    - (void)addTableView;
    - (void)setShowsKeyboard:(BOOL)arg1 animated:(BOOL)arg2;
    @property (readonly, assign, nonatomic)  UITextField* searchBar;
@end