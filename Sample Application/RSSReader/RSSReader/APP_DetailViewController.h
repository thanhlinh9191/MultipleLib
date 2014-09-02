//
//  APP_DetailViewController.h
//  RSSReader
//
//  Created by ThanhLinh on 2/22/14.
//  Copyright (c) 2014 ThanhLinh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APP_DetailViewController : UIViewController

@property (copy, nonatomic) NSString *url ;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
