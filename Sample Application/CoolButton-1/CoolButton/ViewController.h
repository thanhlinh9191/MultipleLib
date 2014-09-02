//
//  ViewController.h
//  CoolButton
//
//  Created by Brian Moakley on 2/21/13.
//  Copyright (c) 2013 Razeware. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CoolButton;

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet CoolButton * coolButton;

- (IBAction)hueValueChanged:(id)sender;
- (IBAction)saturationValueChanged:(id)sender;
- (IBAction)brightnessValueChanged:(id)sender;

@end
