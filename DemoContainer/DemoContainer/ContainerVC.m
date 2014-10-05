//
//  ContainerVC.m
//  DemoContainer
//
//  Created by admin on 10/6/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "ContainerVC.h"
#import "ShareSettings.h"
@interface ContainerVC ()
@property (weak, nonatomic) IBOutlet UIView *MenuVC;
@property (weak, nonatomic) IBOutlet UIView *ProfileVC;
@property (weak, nonatomic) IBOutlet UIView *MainVC;
@property (strong, nonatomic) ShareSettings * shareSettings;
@end

@implementation ContainerVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.shareSettings = [ShareSettings sharedSettings];
    self.shareSettings.menuTapped=NO;
    self.shareSettings.profileTapped=NO;
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuTapped) name:@"menuTapped" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(profileTapped) name:@"profileTapped" object:nil];
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"menuTapped" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"profileTapped" object:nil];
}
-(void)menuTapped{
    if(self.shareSettings.menuTapped){
        [UIView animateWithDuration:0.3 animations:^{
            self.MainVC.frame = CGRectMake(0, self.MainVC.frame.origin.y, self.MainVC.frame.size.width, self.MainVC.frame.size.height);
            
            self.MenuVC.frame = CGRectMake(-260,  self.MenuVC.frame.origin.y, self.MenuVC.frame.size.width, self.MenuVC.frame.size.height);
        }];
    } else{
        [UIView animateWithDuration:0.3 animations:^{
            self.MainVC.frame = CGRectMake(260, self.MainVC.frame.origin.y, self.MainVC.frame.size.width, self.MainVC.frame.size.height);
            
            self.MenuVC.frame = CGRectMake(0, self.MenuVC.frame.origin.y, self.MenuVC.frame.size.width, self.MenuVC.frame.size.height);
        }];
    }
    self.shareSettings.menuTapped=!self.shareSettings.menuTapped;
}
-(void)profileTapped{
    if(self.shareSettings.profileTapped){
        [UIView animateWithDuration:0.3 animations:^{
            self.MainVC.frame = CGRectMake(0, self.MainVC.frame.origin.y, self.MainVC.frame.size.width, self.MainVC.frame.size.height);
            
            self.ProfileVC.frame = CGRectMake(260,  self.ProfileVC.frame.origin.y, self.ProfileVC.frame.size.width, self.ProfileVC.frame.size.height);
        }];
    } else{
        [UIView animateWithDuration:0.3 animations:^{
            self.MainVC.frame = CGRectMake(-260, self.MainVC.frame.origin.y, self.MainVC.frame.size.width, self.MainVC.frame.size.height);
            
            self.ProfileVC.frame = CGRectMake(0, self.ProfileVC.frame.origin.y, self.ProfileVC.frame.size.width, self.ProfileVC.frame.size.height);
        }];
    }
    self.shareSettings.profileTapped=!self.shareSettings.profileTapped;
}
@end