//
//  ViewController.m
//  CoolButton
//
//  Created by Brian Moakley on 2/21/13.
//  Copyright (c) 2013 Razeware. All rights reserved.
//

#import "ViewController.h"
#import "CoolButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)hueValueChanged:(id)sender
{
    UISlider * slider = (UISlider *) sender;
    self.coolButton.hue = slider.value;
}

- (IBAction)saturationValueChanged:(id)sender
{
    UISlider * slider = (UISlider *)sender;
    self.coolButton.saturation = slider.value;
}

- (IBAction)brightnessValueChanged:(id)sender
{
    UISlider * slider = (UISlider *)sender;
    self.coolButton.brightness = slider.value;
}

@end
