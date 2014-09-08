//
//  SandboxViewController.m
//
//  Copyright iOSDeveloperTips.com All rights reserved.
//

#import "SandboxViewController.h"

@implementation SandboxViewController

/*-------------------------------------------------------------
*
*------------------------------------------------------------*/
- (void)buttonPressed:(UIButton *)button
{
  NSString *customURL = @"iOSDevTips://?token=123abct&registered=1";
//  NSString *customURL = @"iOSDevTips2://";


  if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:customURL]])
  {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:customURL]];
  }
  else
  {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"URL error"
                              message:[NSString stringWithFormat:@"No custom URL defined for %@", customURL]
                              delegate:self cancelButtonTitle:@"Ok" 
                              otherButtonTitles:nil];
    [alert show];
  }
    
}

/*-------------------------------------------------------------
*
*------------------------------------------------------------*/
- (void)loadView
{
  [self setView:[[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]]];
	[[self view] setBackgroundColor:[UIColor grayColor]];
  
  [self setLabel:[[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2)-100, 0, 200, 80)]];
  [[self label] setTextColor:[UIColor blueColor]];
  [[self label] setBackgroundColor:[UIColor whiteColor]];
  [[self label] setText: @"App Calling Custom URL"];
  [[self label] setTextAlignment:NSTextAlignmentCenter];
  [[self view] addSubview:[self label]];

  [self setButton:[UIButton buttonWithType:UIButtonTypeSystem]];
  [[self button] setFrame:CGRectMake((self.view.frame.size.width/2)-80, 100, 160, 40)];
  [[self button] setTitle:@"Invoke Custom URL" forState:UIControlStateNormal];
  [[self button] setTitleColor:[UIColor colorWithRed:1.000 green:0.926 blue:0.379 alpha:1.000] forState:UIControlStateNormal];
  [[self button] addTarget:self action:@selector(buttonPressed:) forControlEvents: UIControlEventTouchUpInside];
  [[self view] addSubview:[self button]];
  
}

@end
