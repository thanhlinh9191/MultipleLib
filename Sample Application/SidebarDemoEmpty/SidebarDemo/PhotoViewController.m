//
//  PhotoViewController.m
//  SidebarDemo
//
//  Created by Simon on 30/6/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "PhotoViewController.h"
#import "SWRevealViewController.h"
@interface PhotoViewController ()

@end


@implementation PhotoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Load image
    self.photoImageView.image = [UIImage imageNamed:self.photoFilename];
    
    
    self.title = @"Photo";
    _sidebarButton.tintColor=[UIColor colorWithWhite:0.96 alpha:0.2];
    _sidebarButton.target=self.revealViewController;
    _sidebarButton.action=@selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
