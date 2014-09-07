//
//  ConnectionExampleAppDelegate.h
//  ConnectionExample
//
//  Created by KEMAL KOCABIYIK on 2/25/12.
//  Copyright (c) 2012 Koc University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ConnectionExampleViewController;

@interface ConnectionExampleAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ConnectionExampleViewController *viewController;

@property (strong, nonatomic) UINavigationController *navigationController;

@end
