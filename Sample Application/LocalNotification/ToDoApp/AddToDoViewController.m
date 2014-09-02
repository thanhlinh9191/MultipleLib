//
//  AddToDoViewController.m
//  ToDoApp
//
//  Created by ThanhLinh on 2/23/14.
//  Copyright (c) 2014 ThanhLinh. All rights reserved.
//

#import "AddToDoViewController.h"

@interface AddToDoViewController ()

@end

@implementation AddToDoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    [self.itemText resignFirstResponder];
    UILocalNotification *localNofi = [[UILocalNotification alloc] init];
    localNofi.fireDate=[self.datePicker date];
    localNofi.alertBody=self.itemText.text;
    localNofi.alertAction=@"Show me the text";
    localNofi.timeZone=[NSTimeZone defaultTimeZone];
    
    localNofi.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber]+1;
    [[UIApplication sharedApplication] scheduleLocalNotification:localNofi];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Reload Data" object:self];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
