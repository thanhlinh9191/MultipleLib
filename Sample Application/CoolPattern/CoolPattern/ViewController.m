//
//  ViewController.m
//  CoolPattern
//
//  Created by Ray Wenderlich on 4/15/13.
//  Copyright (c) 2013 Razeware LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIScrollView * scrollView = (UIScrollView *) self.view;
    [scrollView setContentSize:CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height * 1.5)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
