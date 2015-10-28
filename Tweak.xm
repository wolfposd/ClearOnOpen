 //        DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE 
 //                    Version 2, December 2004 
 //
 // Copyright (C) 2015 @wolfposd (Mordred666) 
 //
 // Everyone is permitted to copy and distribute verbatim or modified 
 // copies of this license document, and changing it is allowed as long 
 // as the name is changed. 
 //
 //            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE 
 //   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION 
 //
 //  0. You just DO WHAT THE FUCK YOU WANT TO.



@interface SPUISearchViewController : NSObject

// called when view is showing
- (void)_didFinishDismissing;

// clear stuff
- (void)_clearSearchResults;
- (void)_searchFieldEditingChanged;

@end



%hook SPUISearchViewController

- (void)_didFinishDismissing
{
    [self _clearSearchResults];
    [self _searchFieldEditingChanged];
    %orig;
}

%end
