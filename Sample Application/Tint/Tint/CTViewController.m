//
//  CTViewController.m
//  Tint
//
//  Created by Steven Beyers on 8/19/13.
//  Copyright (c) 2013 CapTech. All rights reserved.
//

#import "CTViewController.h"

@interface CTViewController ()

@end

@implementation CTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    
    if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) {
        self.view.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
    } else {
        self.view.tintAdjustmentMode = UIViewTintAdjustmentModeNormal;
    }
}

@end
