//
//  AppDelegate.m
//  DemoRotation
//
//  Created by admin on 9/4/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
            

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self performSelector:@selector(addOtherView) withObject:nil afterDelay:2];
    return YES;
}
-(void) addOtherView {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    label.text  = @"abcefghjklpoiu";
    label.backgroundColor = [UIColor yellowColor];
    
    //one loarg
    UILabel *labelLarge = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 100)] ;
    labelLarge.backgroundColor = [UIColor blueColor];
    [[[[UIApplication sharedApplication] windows] lastObject] addSubview:labelLarge];
    //
    //draw 1
    [self drawCoordinateInView:label];
    NSLog(@"Before transform: %@", NSStringFromCGAffineTransform(label.transform));
     NSLog(@"Before CTM  transform: %@", NSStringFromCGAffineTransform(CGContextGetCTM(UIGraphicsGetCurrentContext())));
    
   label.transform = CGAffineTransformMakeRotation(90*M_PI/180.0);
    //label.transform = CGAffineTransformMakeScale(0.5, 0.5);
     NSLog(@"After transform: %@", NSStringFromCGAffineTransform(label.transform));
     NSLog(@"After CTM  transform: %@", NSStringFromCGAffineTransform(CGContextGetCTM(UIGraphicsGetCurrentContext())));
                                                        
    [[[[UIApplication sharedApplication] windows] lastObject] addSubview:label];
    
}
-(void) drawCoordinateInView:(UIView*)root {
  //  UIWindow *root = [[[UIApplication sharedApplication] windows] lastObject];
    UIView *lineViewX = [[UIView alloc] initWithFrame:CGRectMake(0, 0, root.bounds.size.width, 1)];
    lineViewX.backgroundColor = [UIColor redColor];
    [root addSubview:lineViewX];
    
    UIView *lineViewY = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, root.bounds.size.height)];
    lineViewY.backgroundColor = [UIColor greenColor];
    [root addSubview:lineViewY];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
