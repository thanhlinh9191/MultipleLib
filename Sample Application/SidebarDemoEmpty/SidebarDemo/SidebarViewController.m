//
//  SidebarViewController.m
//  SidebarDemo
//
//  Created by Simon on 29/6/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "SidebarViewController.h"
#import "PhotoViewController.h"
#import "SWRevealViewController.h"
@interface SidebarViewController ()

@end

@implementation SidebarViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     _menuItems = @[@"title", @"news", @"map", @"calendar", @"wishlist", @"bookmark", @"tag",@"comments"];
    self.view.backgroundColor = [UIColor colorWithWhite:0.2 alpha:1];
    self.tableView.backgroundColor=[UIColor colorWithWhite:0.2 alpha:1];
    self.tableView.separatorColor =[UIColor colorWithWhite:0.15 alpha:0.2];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.menuItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = self.menuItems[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    return cell;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    // Set the title of navigation bar by using the menu items
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    UINavigationController *destViewController = (UINavigationController*)segue.destinationViewController;
    destViewController.title = [[_menuItems objectAtIndex:indexPath.row] capitalizedString];
    
    // Set the photo if it navigates to the PhotoView
    if ([segue.identifier isEqualToString:@"showPhoto"]) {
        PhotoViewController *photoController = (PhotoViewController*)segue.destinationViewController;
        NSString *photoFilename = [NSString stringWithFormat:@"%@_photo.jpg", [_menuItems objectAtIndex:indexPath.row]];
        photoController.photoFilename = photoFilename;
    }
    
    if([segue isKindOfClass:[SWRevealViewControllerSegue class]]){
        SWRevealViewControllerSegue *swSegue = (SWRevealViewControllerSegue*)segue;
        swSegue.performBlock=^(SWRevealViewControllerSegue *rvcSegue, UIViewController *svc, UIViewController *dvc){
            UINavigationController *nav = (UINavigationController*)self.revealViewController.frontViewController;
            [nav setViewControllers:@[dvc] animated:NO];
            [self.revealViewController setFrontViewPosition:FrontViewPositionLeft animated:YES];
            
        };
    }
    
}

@end














