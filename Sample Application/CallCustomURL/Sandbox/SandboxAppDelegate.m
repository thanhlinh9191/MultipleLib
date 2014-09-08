//
//  SandboxAppDelegate.m
//
//  Copyright iOSDeveloperTips.com All rights reserved.
//

#import "SandboxAppDelegate.h"
#import "SandboxViewController.h"

@implementation SandboxAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application
{   
  // Create and initialize the window
  [self setWindow:[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]];

  // Create test view controller
  [self setVc:[[SandboxViewController alloc] init]];
  
  [[self window] addSubview:[[self vc] view]];
  [[self window] makeKeyAndVisible];
}

@end
