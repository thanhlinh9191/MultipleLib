//
//  AppChildController.m
//  PageApp
//
//  Created by ThanhLinh on 2/23/14.
//  Copyright (c) 2014 ThanhLinh. All rights reserved.
//

#import "AppChildController.h"

@interface AppChildController ()

@end

@implementation AppChildController

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
    // Do any additional setup after loading the view from its nib.
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.screenNumber.text= [NSString stringWithFormat:@"Screen Number: %i",self.index];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
