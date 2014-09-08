//
//  SandboxAppDelegate.h
//
//  Copyright iOSDeveloperTips.com All rights reserved.
//

#import <UIKit/UIKit.h>

@class SandboxViewController;

@interface SandboxAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (strong) SandboxViewController *vc;

@end

