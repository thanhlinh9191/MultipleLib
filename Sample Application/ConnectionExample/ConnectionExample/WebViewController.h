//
//  WebViewController.h
//  ConnectionExample
//
//  Created by KEMAL KOCABIYIK on 2/25/12.
//  Copyright (c) 2012 Koc University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIWebView *webView;
@property (retain, nonatomic) NSString *str;

-(id) initWithString:(NSString *) str;
@end
