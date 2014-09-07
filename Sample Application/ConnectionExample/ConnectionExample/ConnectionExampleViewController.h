//
//  ConnectionExampleViewController.h
//  ConnectionExample
//
//  Created by KEMAL KOCABIYIK on 2/25/12.
//  Copyright (c) 2012 Koc University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConnectionExampleViewController : UIViewController <NSURLConnectionDataDelegate>

@property (retain, nonatomic) NSURLConnection *connection;
@property (retain, nonatomic) IBOutlet UIButton *btn_syncronous;
@property (retain, nonatomic) IBOutlet UIButton *btn_post;
@property (retain, nonatomic) IBOutlet UIButton *btn_get;
@property (retain, nonatomic) NSMutableData *receivedData;

/*BUTTON EVENTS*/
-(IBAction)btn_get_clicked:(id)sender;
-(IBAction)btn_post_clicked:(id)sender;
-(IBAction)btn_syncronous_clicked:(id)sender;
@end
