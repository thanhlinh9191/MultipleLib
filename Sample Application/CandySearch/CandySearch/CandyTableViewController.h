//
//  CandyTableViewController.h
//  CandySearch
//
//  Created by Nicolas Martin on 7/5/12.
//  Copyright (c) 2012 University of Illinois at Urbana-Champaign. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CandyTableViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate>

@property (strong,nonatomic) NSArray *candyArray;
@property (strong,nonatomic) NSMutableArray *filteredCandyArray;
@property IBOutlet UISearchBar *candySearchBar;

@end
