//
//  AppChildController.h
//  PageApp
//
//  Created by ThanhLinh on 2/23/14.
//  Copyright (c) 2014 ThanhLinh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppChildController : UIViewController
@property (assign, atomic) NSInteger  index;
@property (weak,nonatomic) IBOutlet UILabel *screenNumber;

@end
