//
//  LoadTVC.m
//  PracticeAutolayout
//
//  Created by csnguyen on 5/22/14.
//  Copyright (c) 2014 csnguyen. All rights reserved.
//

#import "LoadTVC.h"
#import "CustomView.h"

@interface LoadTVC ()
@property (nonatomic, strong) NSArray *dummyList;
@end

@implementation LoadTVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dummyList = @[@{@"date":@"2014/05/16", @"name": @"Julia Robert"},
                       @{@"date":@"2014/05/17", @"name": @"Tommy Lee Jones"},
                       @{@"date":@"2014/05/18", @"name": @"Leonardo Dicaprio and Kate Winslet"},
                       @{@"date":@"2014/05/19", @"name": @"Demi More"}];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dummyList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    UILabel *dateLbl = (UILabel*)[cell viewWithTag:100];
    UILabel *nameLbl = (UILabel*)[cell viewWithTag:101];
    CustomView *view = (CustomView*)[cell viewWithTag:102];
    NSDictionary *info = self.dummyList[indexPath.row];
    
    dateLbl.text = info[@"date"];
    nameLbl.text = info[@"name"];
    view.mySize = CGSizeMake((indexPath.row%2==0)?30.0:60.0, 30.0);

    return cell;
}
@end
