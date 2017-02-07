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

#import "headerIOS910.h"
#import "headerIOS78.h"
#import "headerIOS6.h"
#import "substrate.h"

// =============================================================================
//                                   iOS10
// =============================================================================
%group iOS10
    %hook SPUISearchViewController

        - (bool)clearSearchFieldAfterDismissal
        {
            return YES;
        }

    %end // hook SPUISearchViewController
%end // group iOS10


// =============================================================================
//                                   iOS9
// =============================================================================
%group iOS9

    %hook SPUISearchViewController

    - (void)_didFinishDismissing
    {
        [self _clearSearchResults];
        [self _searchFieldEditingChanged];
        %orig;
    }

    %end // hook SPUISearchViewController
%end // group iOS9


// =============================================================================
//                                   iOS7+8
// =============================================================================


%group iOS7

    %hook SBSearchViewController

    - (void)searchGesture:(id)arg1 completedShowing:(BOOL)arg2 {
        %orig;
        if (!arg2) {
            SBSearchHeader *h = MSHookIvar<SBSearchHeader *>(self, "_searchHeader");
            if (h) {
                [h searchField].text = @"";
                [self _searchFieldEditingChanged];
            }
        }
    }

    %end // hook SBSearchViewController
%end // group iOS7


// =============================================================================
//                                   iOS6
// =============================================================================

%group iOS6

    static SBSearchController *sbSearchController;
    %hook SBSearchController

    - (id)init{
        if ((self = %orig) != nil) {
            //do stuff
            sbSearchController = self;
        }
        return self;
    }

    %end // hook SBSearchController

    %hook SBSearchView
    //make search bar's text nil on init

    - (void)addTableView
    {
        [self searchBar].text = nil;
        //- (void)searchBar:(id)arg1 textDidChange:(id)arg2;
        [sbSearchController searchBar:self textDidChange:nil];
        //- (void)setShowsKeyboard:(BOOL)arg1 animated:(BOOL)arg2;
        [self setShowsKeyboard:YES animated:YES];
        %orig;
    }
    %end // hook SBSearchView
%end // group iOS6


// =============================================================================
//                                   group initializer
// =============================================================================


%ctor 
{
    //float sysVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    if(kCFCoreFoundationVersionNumber >= 1300) // iOS 10
    {
        %init(iOS10);
    }
    else if(kCFCoreFoundationVersionNumber >= 1200) // iOS 9
    {
        %init(iOS9);
    }
    else if (kCFCoreFoundationVersionNumber >= 847) // iOS7 + 8
    {
        %init(iOS7);
    } 
    else 
    {
        %init(iOS6);
    }
}