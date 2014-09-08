//
//  SandboxAppDelegate.m
//
//  Copyright iOSDeveloperTips.com All rights reserved.
//

#import "SandboxAppDelegate.h"
#import "SandboxViewController.h"

@implementation SandboxAppDelegate

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
        sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
  // Check the calling application Bundle ID
  if ([sourceApplication isEqualToString:@"com.3Sixty.CallCustomURL"])
  {
    NSLog(@"Calling Application Bundle ID: %@", sourceApplication);
    NSLog(@"URL scheme:%@", [url scheme]);
    NSLog(@"URL query: %@", [url query]);

    return YES;
  }
  else
    return NO;
}

#if 0
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
        sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
  NSLog(@"Calling Application Bundle ID: %@", sourceApplication);
  NSLog(@"URL scheme:%@", [url scheme]);
  NSLog(@"URL query: %@", [url query]);

  return YES;
}
#endif

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
