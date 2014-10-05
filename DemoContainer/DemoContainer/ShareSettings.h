//
//  ShareSettings.h
//  DemoContainer
//
//  Created by admin on 10/6/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface ShareSettings : NSObject
@property (nonatomic) BOOL menuTapped;
@property (nonatomic) BOOL profileTapped;
+ (id)sharedSettings;
@end
