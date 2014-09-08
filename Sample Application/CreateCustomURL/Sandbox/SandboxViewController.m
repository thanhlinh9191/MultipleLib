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
  [[self label] setText: @"App With Custom URL"];
  [[self label] setTextAlignment:NSTextAlignmentCenter];
  [[self view] addSubview:[self label]];
}

@end
