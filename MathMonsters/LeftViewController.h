//
//  LeftViewController.h
//  MathMonsters
//
//  Created by Ellen Shapiro on 1/8/13.
//  Copyright (c) 2013 Designated Nerd Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Monster;
#import "MonsterSelectionDelegate.h"

@interface LeftViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *monsters;
@property (nonatomic, assign) id<MonsterSelectionDelegate> delegate;

@end
