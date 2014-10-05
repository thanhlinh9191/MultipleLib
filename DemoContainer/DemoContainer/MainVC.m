//
//  MainVC.m
//  DemoContainer
//
//  Created by admin on 10/6/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "MainVC.h"

@implementation MainVC
- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (IBAction)menuBtnTapped:(UIButton *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"menuTapped" object:nil];
}
- (IBAction)profileBtnTapped:(UIButton *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"profileTapped" object:nil];
}
@end
