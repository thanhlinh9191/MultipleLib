//
//  RecipeBookViewController.h
//  RecipeBook
//
//  Created by ThanhLinh on 2/22/14.
//  Copyright (c) 2014 ThanhLinh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeBookViewController : UIViewController<UITableViewDataSource,UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
