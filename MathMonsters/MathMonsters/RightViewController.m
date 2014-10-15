//
//  RightViewController.m
//  MathMonsters
//
//  Created by Ellen Shapiro on 1/8/13.
//  Copyright (c) 2013 Designated Nerd Software. All rights reserved.
//

#import "RightViewController.h"
#import "Monster.h"

@implementation RightViewController

#pragma mark - View Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //Update the UI to reflect the monster set on initial load.
    [self refreshUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated, in this case the IBOutlets.
    [self setNameLabel:nil];
    [self setDescriptionLabel:nil];
    [self setIconImageView:nil];
    [self setWeaponImageView:nil];
}

#pragma mark - Overridden setters
-(void)setMonster:(Monster *)monster
{
    //Make sure we're not setting up the same monster.
    if (_monster != monster) {
        _monster = monster;
        
        //Update the UI to reflect the new monster selected from the list.
        [self refreshUI];
    }
}

#pragma mark - New Methods
-(void)refreshUI
{
    _nameLabel.text = _monster.name;
    _iconImageView.image = [UIImage imageNamed:_monster.iconName];
    _descriptionLabel.text = _monster.description;
    _weaponImageView.image = [_monster weaponImage];
}

#pragma mark - Monster Selection Delegate
-(void)selectedMonster:(Monster *)newMonster
{
    [self setMonster:newMonster];
    
    //Dismisses the popover if it's showing.
    if (_popover != nil) {
        [_popover dismissPopoverAnimated:YES];
    }
}

#pragma mark - UISplitViewDelegate methods
-(void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc
{
    //Grab a reference to the popover
    self.popover = pc;
    
    //Set the title of the bar button item
    barButtonItem.title = @"Monsters";
    
    //Set the bar button item as the Nav Bar's leftBarButtonItem
    [_navBarItem setLeftBarButtonItem:barButtonItem animated:YES];
}

-(void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    //Remove the barButtonItem.
    [_navBarItem setLeftBarButtonItem:barButtonItem animated:YES];
    
    //Nil out the pointer to the popover.
    _popover = nil;
}

@end
