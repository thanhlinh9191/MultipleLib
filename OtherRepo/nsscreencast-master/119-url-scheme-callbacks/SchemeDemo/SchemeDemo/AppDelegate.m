//
//  AppDelegate.m
//  SchemeDemo
//
//  Created by ben on 4/26/14.
//  Copyright (c) 2014 Fickle Bits. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    NSLog(@"URL: %@", url);
    
    if ([[url host] isEqualToString:@"success"]) {
        
        NSString *query = [url query];
        query = [query stringByReplacingOccurrencesOfString:@"?" withString:@""];
        NSArray *paramValues = [query componentsSeparatedByString:@"&"];
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [paramValues enumerateObjectsUsingBlock:^(NSString *paramValue, NSUInteger idx, BOOL *stop) {
            NSArray *parts = [paramValue componentsSeparatedByString:@"="];
            NSString *key = [parts firstObject];
            NSString *value = [parts lastObject];
            params[key] = value;
        }];
        
        NSString *word = params[@"word"];
        word = [word stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"WordReversed"
                                                            object:word
                                                          userInfo:nil];
        
        return YES;
    }
    
    return NO;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
