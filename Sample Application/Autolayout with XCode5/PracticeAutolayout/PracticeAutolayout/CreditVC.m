//
//  CreditVC.m
//  PracticeAutolayout
//
//  Created by csnguyen on 5/21/14.
//  Copyright (c) 2014 csnguyen. All rights reserved.
//

#import "CreditVC.h"

@interface CreditVC ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *verticalLayout;

@end

@implementation CreditVC

- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (IBAction)showMe:(UIButton*)button {
    UILabel *label = [[UILabel alloc] init];
    label.text = @"Here I am";
    [self.view addSubview:label];
    
//    // old way
//    label.frame = CGRectMake((self.view.frame.size.width - 75.0) / 2.0, (self.view.frame.size.height - 20.0) / 2.0, 75, 20);
    
    // prevent layout added automatically
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    // add label
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:label
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1
                                                           constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:label
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1
                                                           constant:0]];
    [self.view layoutIfNeeded]; // discuss: don't use setNeedLayout here, by the purpose of optimize, frame is not set right after setNeedLayout call. So use layoutIfNeeded to force
    
    [UIView animateWithDuration:0.3 animations:^{
        // update button
        [self.view removeConstraint:self.verticalLayout];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[label]-[button]"
                                                                          options:0
                                                                          metrics:nil
                                                                            views:NSDictionaryOfVariableBindings(label, button)]];
        [self.view layoutIfNeeded];
    }];
}
@end
